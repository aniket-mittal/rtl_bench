"""
Write every task as one folder directly under tasks/:

  tasks/<name>/
    spec.md        what the module should do, which file to edit, how to run the public tests (agent-visible)
    <module>.v     starter code to fix / fill in / write (editable); plus any read-only support files (e.g. lib.v)
    public_tb.v    public tests: self-checking testbench with its input/expected vectors written in (agent-visible)
    hidden_tb.v    hidden tests: runs the submission and the reference side by side on seeded random inputs (verifier only)
    reference.v    correct solution (verifier only); reference_<file> per file when several files are editable
    task.json      module name, interface, editable / read-only / hidden files, tools, step/time limits, grading, provenance

Input: intermediate task JSONs (see FORMAT.md) from the convert_*.py scripts.
Each task is checked before it is kept: the reference must compile, pass both testbenches and its formal self-check,
and a repair starter must fail. Failures are left out and listed in the --excluded file.

Usage:
  python3 export_tasks.py --out ../../tasks --jobs 10 <dir or json> [...]
"""
import argparse
import json
import re
import shutil
import sys
import tempfile
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import rtltask as rt  # noqa: E402
import grade as gr    # noqa: E402

HERE = Path(__file__).resolve().parent
HIDDEN_CYCLES = 5000
KIND_SHORT = {"spec_to_rtl": "spec2rtl"}
BENCHLS_GROUPS = {"OriGen": "benchls-origen", "RTLPP": "benchls-rtlpp", "MG-Verilog": "benchls-mgverilog",
                  "AutoVCoder": "benchls-autovcoder", "SEC-Flow": "benchls-github"}


def task_path(source_task_id, suite, kind, provenance):
    """(group folder, task folder name) for a task, e.g. ("generated", "repair-thermostat-bug1")."""
    k = KIND_SHORT.get(kind, kind)
    parts = source_task_id.split("/")
    if parts[-1] in ("repair", "spec_to_rtl", "infill"):
        parts = parts[:-1]
    clean = lambda s: re.sub(r"[^A-Za-z0-9_.]+", "_", s).strip("_")
    if suite == "open_source":                       # <collection>/<design>/mutant_<k>
        design = re.sub(r"^Prob\d+_", "", parts[-2])
        return "generated", f"{k}-{clean(design)}-bug{parts[-1].split('_')[-1]}"
    if suite == "verilog-eval":
        return "verilog-eval", f"{k}-{clean(re.sub(r'^Prob\d+_', '', parts[1]))}"
    if suite == "rtllm":
        return "rtllm", f"{k}-{clean(parts[1])}"
    if parts[:2] == ["rtl-benchls", "task3"]:        # GitHub issue fixes
        repo = (provenance.get("repository") or "repo").split("/")[-1]
        extra = parts[2].split("__", 1)[1] if "__" in parts[2] else ""
        return "github-issues", f"{k}-{clean(repo)}-pr{provenance.get('pr_number')}" + (f"-{clean(extra)}" if extra else "")
    origin = provenance.get("origin") or ""
    group = next((g for key, g in BENCHLS_GROUPS.items() if key in origin), "benchls-other")
    m = re.match(r"(.*)_(block|module)_(\d+)$", parts[-1])
    name = f"{clean(m.group(1))}-{m.group(2)}{m.group(3)}" if m else clean(parts[-1])
    return group, f"{k}-{name}"


def flat(path):
    p = rt.safe_relpath(path)
    return p[4:] if p.startswith("rtl/") else p


def inline_tb(iface, top, stim, expected):
    """Public testbench: rtltask's vector testbench with the vectors written in (no data files)."""
    tb = rt.gen_testbench(iface, top, len(stim))
    iw, ow = max(1, rt.in_width(iface)), rt.out_width(iface)
    tb = tb.replace("    $readmemh(stim_file, stim);\n",
                    "\n".join(f"    stim[{i}] = {iw}'h{w};" for i, w in enumerate(stim)) + "\n")
    tb = tb.replace("      $readmemh(exp_file, expv);\n",
                    "\n".join(f"      expv[{i}] = {ow}'h{w};" for i, w in enumerate(expected)) + "\n")
    tb = tb.replace('    if (!$value$plusargs("stim=%s", stim_file)) stim_file = "stimulus.hex";\n', "")
    tb = tb.replace('    if (!$value$plusargs("expected=%s", exp_file)) exp_file = "expected.hex";\n', "")
    head = (f"// Public tests: {len(stim)} cycles with the expected outputs written in. Generated; do not edit.\n"
            f"// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim\n"
            f"// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.\n")
    return head + tb.split("\n", 1)[1]


def hidden_tb(iface, top, cycles, seed):
    """Hidden tests: submission (`top`) and reference (`top`__ref, renamed by the grader) on the same random inputs."""
    clock = iface.get("clock")
    rst = iface.get("reset") or {}
    ow = rt.out_width(iface)
    decl, conn = [], []
    if clock:
        conn.append(f".{rt._vname(clock)}(clk)")
    for k, p in enumerate(iface["inputs"]):
        decl.append(f"  reg [{p['width'] - 1}:0] i_{k};")
        conn.append(f".{rt._vname(p['name'])}(i_{k})")
    hi, conn_d, conn_r = ow - 1, list(conn), list(conn)
    for p in iface["outputs"]:
        lo = hi - p["width"] + 1
        conn_d.append(f".{rt._vname(p['name'])}(out_dut[{hi}:{lo}])")
        conn_r.append(f".{rt._vname(p['name'])}(out_ref[{hi}:{lo}])")
        hi = lo - 1
    drive = []
    for k, p in enumerate(iface["inputs"]):
        if p["name"] == rst.get("name"):
            on, off = ("1'b0", "1'b1") if rst.get("active_low") else ("1'b1", "1'b0")
            drive.append(f"      i_{k} = (c < 2 || ($random(seed) & 63) == 0) ? {on} : {off};")
        else:
            words = ", ".join(["$random(seed)"] * ((p["width"] + 31) // 32))
            drive.append(f"      i_{k} = {{{words}}};")
    drive = "\n".join(drive) or "      ;"
    if clock:
        step = f"{drive}\n      #4 check;\n      #1 clk = 1'b1;\n      #5 clk = 1'b0;"
    else:
        step = f"{drive}\n      #1 check;\n      #1;"
    pd, pr = ",\n    ".join(conn_d), ",\n    ".join(conn_r)
    decls = "\n".join(decl)
    return f"""// Hidden tests: {cycles} cycles of seeded random inputs (seed {seed}); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = {cycles};
  localparam OW = {ow};
  reg clk;
{decls}
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  {top} dut (
    {pd}
  );
  {top}__ref ref_i (
    {pr}
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = {seed};
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
{step}
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
"""


def skeleton(iface, top):
    ports = []
    if iface.get("clock"):
        ports.append(f"  input {iface['clock']}")
    for d, key in (("input", "inputs"), ("output", "outputs")):
        for p in iface[key]:
            w = f"[{p['width'] - 1}:0] " if p["width"] > 1 else ""
            ports.append(f"  {d} {w}{p['name']}")
    return (f"// Starter skeleton: implement {top} as described in spec.md.\nmodule {top} (\n"
            + ",\n".join(ports) + "\n);\n\nendmodule\n")


def spec_md(t, editable, read_only, top, iface):
    body = t["spec"].rstrip() + "\n"
    for e in editable + read_only:
        body = body.replace("rtl/" + e, e)
    lines = ["", "---", "", "## Files", "",
             "Edit: " + ", ".join(f"`{e}`" for e in editable) + ". Only these files are graded."]
    if read_only:
        lines.append("Read-only (restored before grading): " + ", ".join(f"`{r}`" for r in read_only) + ".")
    lines += ["", "## Interface of `%s`" % top, "", "| port | dir | width | note |", "|---|---|---|---|"]
    if iface.get("clock"):
        lines.append(f"| `{iface['clock']}` | in | 1 | clock, rising edge |")
    rst = iface.get("reset") or {}
    for p in iface["inputs"]:
        note = ("reset, active " + ("low" if rst.get("active_low") else "high")) if p["name"] == rst.get("name") else ""
        lines.append(f"| `{p['name']}` | in | {p['width']} | {note} |")
    for p in iface["outputs"]:
        lines.append(f"| `{p['name']}` | out | {p['width']} | |")
    files = " ".join(f for f in editable + read_only if f.endswith((".v", ".sv")))
    lines += ["", "## Testing", "",
              f"    iverilog -g2012 -s tb -o sim public_tb.v {files} && vvp sim", "",
              "It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal",
              "equivalence check against the reference, so passing the public tests is not enough on its own.", ""]
    return body + "\n".join(lines)


def build(task_path, out_root):
    t = rt.fill_defaults(rt.load_task(task_path))
    top = t["top_module"]
    timeout = rt.tool_timeout(t)
    if not rt.interface_ok(t.get("interface")):
        t["interface"] = rt.derive_interface(rt.reference_tree(t), rt.reference_top(t), timeout)
    iface = t["interface"]
    if not iface["outputs"]:
        return {"ok": False, "reasons": ["top module has no outputs"]}
    pub_stim = rt.gen_stimulus(iface, rt.DEFAULT_PUBLIC_CYCLES, rt.stable_seed(t["task_id"]))
    pub_exp = rt.reference_expected(t, iface, pub_stim)
    if all(set(w) == {"x"} for w in pub_exp):
        return {"ok": False, "reasons": ["reference outputs are all x on the public inputs"]}

    editable = [flat(e) for e in t["editable"]]
    ref_files = {flat(k): v for k, v in t["hidden"]["reference_files"].items()}
    starter = {flat(k): v for k, v in (t.get("files") or {}).items()}
    read_only = {k: v for k, v in starter.items() if k not in editable}
    for k, v in ref_files.items():
        if k not in editable:
            read_only.setdefault(k, v)
    missing = [e for e in editable if e not in ref_files]
    if missing:
        return {"ok": False, "reasons": [f"no reference for editable {missing}"]}
    if len(editable) == 1 and editable[0] not in starter:
        starter[editable[0]] = skeleton(iface, top)
    ref_name = {e: ("reference.v" if len(editable) == 1 else "reference_" + e.replace("/", "_")) for e in editable}

    group, name = task_path(t["task_id"], t["suite"], t["kind"], t.get("provenance", {}))
    d = Path(out_root) / group / name
    if d.exists():
        shutil.rmtree(d)
    d.mkdir(parents=True)
    (d / "spec.md").write_text(spec_md(t, editable, sorted(read_only), top, iface))
    for k, v in list(starter.items()) + list(read_only.items()):
        (d / k).parent.mkdir(parents=True, exist_ok=True)
        (d / k).write_text(v)
    (d / "public_tb.v").write_text(inline_tb(iface, top, pub_stim, pub_exp))
    seed = rt.stable_seed(t["task_id"] + "/hidden")
    (d / "hidden_tb.v").write_text(hidden_tb(iface, top, HIDDEN_CYCLES, seed))
    for e in editable:
        (d / ref_name[e]).write_text(ref_files[e])
    meta = {
        "task_id": f"{group}/{name}",
        "suite": t["suite"],
        "kind": t["kind"],
        "difficulty": t.get("difficulty", "unknown"),
        "top_module": top,
        "interface": iface,
        "files": {
            "agent": ["spec.md"] + editable + sorted(read_only) + ["public_tb.v"],
            "spec": "spec.md",
            "editable": editable,
            "read_only": sorted(read_only),
            "public": ["public_tb.v"],
            "hidden": ["hidden_tb.v"] + [ref_name[e] for e in editable],
            "reference": ref_name,
        },
        "tools": t.get("tools", rt.DEFAULT_TOOLS),
        "limits": t.get("limits", rt.DEFAULT_LIMITS),
        "grading": {
            "verification": "formal",
            "public_tb": {"file": "public_tb.v", "cycles": len(pub_stim)},
            "hidden_tb": {"file": "hidden_tb.v", "cycles": HIDDEN_CYCLES, "seed": seed},
            "formal": rt.formal_settings(t),
            "reward": "1 if it compiles, public_tb and hidden_tb print PASS, and Yosys proves it equivalent to the "
                      "reference (bounded counts when accept_bounded); else 0",
            "command": "python3 taskgen/harness/grade.py <task dir> <submission dir>",
        },
        "source_task_id": t["task_id"],
        "provenance": t.get("provenance", {}),
    }
    (d / "task.json").write_text(json.dumps(meta, indent=2) + "\n")

    reasons = []
    with tempfile.TemporaryDirectory() as td:
        for e in editable:
            (Path(td) / e).parent.mkdir(parents=True, exist_ok=True)
            (Path(td) / e).write_text(ref_files[e])
        g = gr.grade(d, td, synth=False)
        if g["formal"] == "unknown" and g["compiled"] and all(
                g[k]["total"] and g[k]["passed"] == g[k]["total"] for k in ("public", "hidden")):
            # Formal cannot finish even on the reference against itself: keep the task, graded by simulation only.
            meta["grading"]["verification"] = "sim_only"
            meta["grading"]["reward"] = ("1 if it compiles and public_tb and hidden_tb print PASS; else 0 "
                                         "(sim_only: the formal check times out on this design)")
            (d / "task.json").write_text(json.dumps(meta, indent=2) + "\n")
            g = gr.grade(d, td, synth=False)
    if not g["correct"]:
        reasons.append("reference fails its own grading: " + json.dumps(g)[:400])
    if t["kind"] == "repair" and not reasons:
        s = gr.grade(d, d, synth=False)
        if not s["compiled"]:
            reasons.append("repair starter does not compile")
        elif s["correct"]:
            reasons.append("repair starter already passes")
    if reasons:
        shutil.rmtree(d)
        return {"ok": False, "reasons": reasons}
    return {"ok": True, "name": name}


def safe_build(path, out):
    try:
        r = build(path, out)
    except Exception as e:  # noqa: BLE001
        r = {"ok": False, "reasons": [f"{type(e).__name__}: {e}"[:400]]}
    r["input"] = str(path)
    return r


def write_index(out):
    """index.jsonl: one line per task folder under out."""
    rows = []
    for tj in sorted(Path(out).glob("*/*/task.json")):
        m = json.loads(tj.read_text())
        rows.append({"task": m["task_id"], "suite": m["suite"], "kind": m["kind"], "difficulty": m["difficulty"],
                     "top_module": m["top_module"], "sequential": bool(m["interface"].get("clock")),
                     "verification": m["grading"].get("verification", "formal"),
                     "source": m["provenance"].get("source") or m["source_task_id"]})
    (Path(out) / "index.jsonl").write_text("".join(json.dumps(r) + "\n" for r in rows))
    return rows


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("inputs", nargs="+", help="dirs or files of intermediate task JSONs")
    ap.add_argument("--out", required=True)
    ap.add_argument("--jobs", type=int, default=8)
    ap.add_argument("--excluded", default=str(HERE / "excluded.jsonl"), help="where to list tasks left out")
    args = ap.parse_args()
    paths = []
    for i in args.inputs:
        p = Path(i)
        paths += sorted(p.glob("*.json")) if p.is_dir() else [p]
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    results = []
    with ThreadPoolExecutor(args.jobs) as ex:
        for r in ex.map(lambda p: safe_build(p, out), paths):
            results.append(r)
            if len(results) % 50 == 0:
                print(f"{len(results)}/{len(paths)} ({sum(x['ok'] for x in results)} kept)", flush=True)
    bad = [r for r in results if not r["ok"]]
    Path(args.excluded).write_text("".join(json.dumps(r) + "\n" for r in bad))
    rows = write_index(out)
    print(json.dumps({"inputs": len(paths), "kept": len(paths) - len(bad), "excluded": len(bad),
                      "index_rows": len(rows)}, indent=2))


if __name__ == "__main__":
    main()
