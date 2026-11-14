#!/usr/bin/env python3
"""
rtltask.py: harness CLI for standard RTL tasks (see harness/FORMAT.md, schema_version 1).

Subcommands
    prepare <task.json> <dir>            write the agent workspace (never any hidden data)
    grade <task.json> <dir>              grade a finished workspace, print the grade JSON
    finalize <task.json> [--write]       derive interface + public tests from the reference, then validate
    validate <task.json>                 print {"valid": bool, "reasons": [...]}
    finalize-all <dir_or_glob> [--jobs N]  finalize --write many tasks in parallel, print a summary JSON

Standard library only. Shells out to iverilog, vvp and yosys (override with $IVERILOG, $VVP, $YOSYS).
"""
import argparse
import concurrent.futures
import copy
import fnmatch
import glob
import hashlib
import json
import os
import random
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

IVERILOG = os.environ.get("IVERILOG", "iverilog")
VVP = os.environ.get("VVP", "vvp")
YOSYS = os.environ.get("YOSYS", "yosys")

SCHEMA_VERSION = 1
DEFAULT_PUBLIC_CYCLES = 64
DEFAULT_HIDDEN_CYCLES = 1000
DEFAULT_LIMITS = {"max_agent_steps": 50, "wall_time_s": 1800, "tool_timeout_s": 120}
DEFAULT_FORMAL = {"method": "yosys_sat_tempinduct", "max_steps": 60, "timeout_s": 120, "accept_bounded": True}
DEFAULT_TOOLS = ["iverilog", "vvp", "yosys"]
HDL_EXTS = (".v", ".sv")
RESET_PROB = 0.02
RESET_HOLD_CYCLES = 2


class TaskError(Exception):
    pass


# --------------------------------------------------------------------------- utilities

def load_task(path):
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def write_json_atomic(path, obj):
    path = Path(path)
    tmp = path.with_name(path.name + ".tmp%d" % os.getpid())
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(obj, f, indent=2, ensure_ascii=False)
        f.write("\n")
    os.replace(tmp, path)


def stable_seed(text):
    return int(hashlib.sha256(text.encode("utf-8")).hexdigest()[:8], 16)


def run(cmd, cwd=None, timeout=None):
    """Run a command. Returns (returncode or None on timeout, combined output)."""
    try:
        p = subprocess.run(cmd, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                           stdin=subprocess.DEVNULL, timeout=timeout)
        return p.returncode, p.stdout.decode("utf-8", errors="replace")
    except subprocess.TimeoutExpired as e:
        out = e.stdout.decode("utf-8", errors="replace") if e.stdout else ""
        return None, out
    except OSError as e:
        return 127, "could not run %s: %s" % (cmd[0], e)


def tool_timeout(task):
    return float((task.get("limits") or {}).get("tool_timeout_s") or DEFAULT_LIMITS["tool_timeout_s"])


def formal_settings(task):
    s = dict(DEFAULT_FORMAL)
    s.update(((task.get("hidden") or {}).get("formal")) or {})
    return s


def hidden_vector_settings(task):
    hv = dict(((task.get("hidden") or {}).get("hidden_vectors")) or {})
    hv.setdefault("cycles", DEFAULT_HIDDEN_CYCLES)
    hv.setdefault("seed", stable_seed(task["task_id"] + "/hidden"))
    return hv


def reference_top(task):
    return (task.get("hidden") or {}).get("reference_top") or task["top_module"]


def safe_relpath(p):
    p = p.replace("\\", "/")
    parts = [x for x in p.split("/") if x not in ("", ".")]
    if not parts or ".." in parts or p.startswith("/"):
        raise TaskError("unsafe file path in task: %r" % p)
    return "/".join(parts)


def is_editable(task, path):
    path = safe_relpath(path)
    for pat in task.get("editable") or []:
        pat = pat.replace("\\", "/")
        if pat.startswith("./"):
            pat = pat[2:]
        if path == pat or fnmatch.fnmatchcase(path, pat):
            return True
    return False


def write_tree(root, files):
    root = Path(root)
    for rel, text in files.items():
        dst = root / safe_relpath(rel)
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_text(text, encoding="utf-8")


def hdl_files(root):
    """All .v/.sv files under root/ (sorted relative paths), as absolute Paths."""
    root = Path(root)
    out = []
    for p in sorted(root.rglob("*")):
        if p.is_file() and p.suffix in HDL_EXTS:
            out.append(p)
    return out


def include_dirs(root, files):
    dirs = {str(Path(root))}
    for f in files:
        dirs.add(str(f.parent))
    return sorted(dirs)


def reference_tree(task):
    """Read-only starter files overlaid with the hidden reference files."""
    tree = {}
    for rel, text in (task.get("files") or {}).items():
        if not is_editable(task, rel):
            tree[safe_relpath(rel)] = text
    for rel, text in ((task.get("hidden") or {}).get("reference_files") or {}).items():
        tree[safe_relpath(rel)] = text
    return tree


def starter_tree(task):
    return {safe_relpath(k): v for k, v in (task.get("files") or {}).items()}


def submission_tree(task, workspace):
    """Editable files as found in the workspace + read-only files restored from the task."""
    ws = Path(workspace)
    tree = {}
    for rel, text in (task.get("files") or {}).items():
        if not is_editable(task, rel):
            tree[safe_relpath(rel)] = text
    for p in sorted(ws.rglob("*")):
        if not p.is_file():
            continue
        rel = p.relative_to(ws).as_posix()
        if rel.startswith("tests/") or rel == "TASK.md":
            continue
        if is_editable(task, rel):
            try:
                tree[rel] = p.read_text(encoding="utf-8", errors="replace")
            except OSError:
                pass
    return tree


def rtl_only(tree):
    """Only files under rtl/ are compiled; keep everything else out of the design."""
    return {k: v for k, v in tree.items() if k.startswith("rtl/")}


# --------------------------------------------------------------------------- interface discovery

CLOCK_RE = re.compile(r"^(i_|in_)?(clk|clock|clk_in|sys_clk|aclk|hclk|pclk)(_i|_in)?$")
RESET_RE = re.compile(r"(rst|reset)")


def _yosys_read_cmds(root, files):
    incs = " ".join("-I" + _q(d) for d in include_dirs(root, files))
    return "\n".join("read_verilog -sv %s %s" % (incs, _q(str(f))) for f in files)


def _q(s):
    # yosys script quoting
    if re.match(r"^[A-Za-z0-9_./+\-=:@]+$", s):
        return s
    return '"' + s.replace('"', '\\"') + '"'


def yosys_ports(tree, top, timeout):
    """Return (ports [(name, dir, width)], clocks set, async_resets {name: active_low}) for `top`."""
    with tempfile.TemporaryDirectory(prefix="rtltask_ports_") as td:
        write_tree(td, rtl_only(tree))
        files = hdl_files(td)
        if not files:
            raise TaskError("no .v/.sv files under rtl/")
        out_json = os.path.join(td, "ports.json")
        script = "%s\nhierarchy -check -top %s\nproc\nflatten\nopt_clean\nwrite_json %s\n" % (
            _yosys_read_cmds(td, files), _q(top), _q(out_json))
        sp = os.path.join(td, "ports.ys")
        Path(sp).write_text(script)
        rc, out = run([YOSYS, "-q", "-s", sp], cwd=td, timeout=timeout)
        if rc is None:
            raise TaskError("yosys timed out during port discovery")
        if rc != 0 or not os.path.exists(out_json):
            raise TaskError("yosys failed on reference: " + _error_excerpt(out))
        data = json.loads(Path(out_json).read_text())
    mods = data.get("modules", {})
    mod = mods.get(top) or mods.get("\\" + top)
    if mod is None:
        raise TaskError("top module %r not found" % top)
    ports = []
    bit_owner = {}
    for name, p in mod.get("ports", {}).items():
        ports.append((name, p["direction"], len(p["bits"])))
        if len(p["bits"]) == 1:
            bit_owner[p["bits"][0]] = name
    clocks, aresets = set(), {}
    for cell in mod.get("cells", {}).values():
        conn = cell.get("connections", {})
        for b in conn.get("CLK", []):
            if b in bit_owner:
                clocks.add(bit_owner[b])
        for b in conn.get("ARST", []):
            if b in bit_owner:
                pol = str(cell.get("parameters", {}).get("ARST_POLARITY", "1"))
                aresets[bit_owner[b]] = (int(pol, 2) if set(pol) <= {"0", "1"} else 1) == 0
    return ports, clocks, aresets


def _active_low_name(name):
    n = name.lower()
    return n.endswith("_n") or n.endswith("_ni") or n.endswith("_b") or n.endswith("n")


def derive_interface(tree, top, timeout):
    ports, clocks, aresets = yosys_ports(tree, top, timeout)
    inputs = [(n, w) for n, d, w in ports if d == "input"]
    outputs = [(n, w) for n, d, w in ports if d == "output"]
    inouts = [n for n, d, w in ports if d == "inout"]
    if inouts:
        raise TaskError("inout ports not supported: %s" % ", ".join(inouts))
    one_bit = [n for n, w in inputs if w == 1]

    clock = None
    named = [n for n in one_bit if CLOCK_RE.match(n.lower())]
    if named:
        clock = named[0]
    else:
        structural = [n for n in one_bit if n in clocks]
        if len(structural) >= 1:
            clock = structural[0]
        else:
            loose = [n for n in one_bit if "clk" in n.lower() or "clock" in n.lower()]
            if len(loose) == 1:
                clock = loose[0]

    reset = None
    cands = [n for n in one_bit if n != clock and RESET_RE.search(n.lower())]
    if cands:
        # prefer the plainest names first
        cands.sort(key=lambda n: (0 if n.lower() in ("rst", "reset", "rst_n", "rstn", "reset_n", "resetn",
                                                       "rst_ni", "areset", "arst", "arst_n") else 1, len(n)))
        name = cands[0]
        reset = {"name": name, "active_low": _active_low_name(name)}
    else:
        ar = [n for n in one_bit if n in aresets and n != clock]
        if ar:
            reset = {"name": ar[0], "active_low": aresets[ar[0]]}

    return {
        "clock": clock,
        "reset": reset,
        "inputs": [{"name": n, "width": w} for n, w in inputs if n != clock],
        "outputs": [{"name": n, "width": w} for n, w in outputs],
    }


# --------------------------------------------------------------------------- stimulus + testbench

def in_width(iface):
    return sum(p["width"] for p in iface["inputs"])


def out_width(iface):
    return sum(p["width"] for p in iface["outputs"])


def hex_digits(width):
    return max(1, (width + 3) // 4)


def gen_stimulus(iface, cycles, seed):
    rng = random.Random(seed)
    reset = iface.get("reset") or None
    rname = reset["name"] if reset else None
    words = []
    iw = in_width(iface)
    nd = hex_digits(iw)
    for c in range(cycles):
        word = 0
        if rname:
            assert_reset = c < RESET_HOLD_CYCLES or rng.random() < RESET_PROB
        for p in iface["inputs"]:
            w = p["width"]
            if p["name"] == rname:
                v = (0 if reset["active_low"] else 1) if assert_reset else (1 if reset["active_low"] else 0)
                v &= (1 << w) - 1
            else:
                v = rng.getrandbits(w)
            word = (word << w) | v
        words.append(format(word, "0%dx" % nd))
    return words


def _vname(name):
    """Verilog-safe reference to a port name."""
    if re.match(r"^[A-Za-z_][A-Za-z0-9_$]*$", name):
        return name
    return "\\" + name + " "


def gen_testbench(iface, top, cycles):
    """Self-checking vector testbench.

    Plusargs (all optional): +stim=<file> (default stimulus.hex), +expected=<file> (default expected.hex),
    +actual=<file> (dump sampled outputs, one hex word per cycle), +nocheck (skip comparison).
    """
    iw = max(1, in_width(iface))
    ow = out_width(iface)
    if ow == 0:
        raise TaskError("top module has no outputs")
    clock = iface.get("clock")
    conns = []
    if clock:
        conns.append(".%s(clk)" % _vname(clock))
    hi = in_width(iface) - 1
    for p in iface["inputs"]:
        lo = hi - p["width"] + 1
        conns.append(".%s(in_vec[%d:%d])" % (_vname(p["name"]), hi, lo))
        hi = lo - 1
    hi = ow - 1
    for p in iface["outputs"]:
        lo = hi - p["width"] + 1
        conns.append(".%s(out_vec[%d:%d])" % (_vname(p["name"]), hi, lo))
        hi = lo - 1
    conn_str = ",\n    ".join(conns)
    if clock:
        step = ("      #1 in_vec = stim[c];\n"
                "      #3 sample;\n"
                "      #1 clk = 1'b1;\n"
                "      #5 clk = 1'b0;\n")
    else:
        step = ("      in_vec = stim[c];\n"
                "      #1 sample;\n"
                "      #1;\n")
    return f"""// Generated by harness/rtltask.py. Do not edit.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = {cycles};
  localparam IW = {iw};
  localparam OW = {ow};
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  {top} dut (
    {conn_str}
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {{IW{{1'b0}}}};
    if (!$value$plusargs("stim=%s", stim_file)) stim_file = "stimulus.hex";
    if (!$value$plusargs("expected=%s", exp_file)) exp_file = "expected.hex";
    $readmemh(stim_file, stim);
    for (c = 0; c < N; c = c + 1) begin
{step}    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      $readmemh(exp_file, expv);
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
"""


def normalize_word(word, nd):
    w = word.strip().lower()
    w = re.sub(r"[xz?]", "x", w)
    if len(w) < nd:
        w = w.rjust(nd, "0")
    elif len(w) > nd:
        w = w[-nd:]
    return w


def compare_words(actual, expected):
    """Number of cycles whose outputs match (expected 'x' digit = don't care)."""
    passed = 0
    for a, e in zip(actual, expected):
        ok = len(a) == len(e) and all(ed == "x" or ad == ed for ad, ed in zip(a, e))
        passed += ok
    return passed


def compile_tree(tree, tb_text, workdir, timeout):
    """Write tree + tb into workdir, compile. Returns (ok, log)."""
    wd = Path(workdir)
    write_tree(wd, rtl_only(tree))
    (wd / "tb.v").write_text(tb_text)
    files = hdl_files(wd / "rtl") if (wd / "rtl").exists() else []
    if not files:
        return False, "no .v/.sv files under rtl/"
    cmd = [IVERILOG, "-g2012", "-s", "tb", "-o", str(wd / "sim.vvp")]
    for d in include_dirs(wd / "rtl", files):
        cmd.append("-I" + d)
    cmd.append(str(wd / "tb.v"))
    cmd += [str(f) for f in files]
    rc, out = run(cmd, cwd=wd, timeout=timeout)
    if rc is None:
        return False, "iverilog timeout"
    return rc == 0, out


def simulate(workdir, stim_words, iface, timeout):
    """Run the compiled sim with stimulus; return list of normalized output words or None on failure."""
    wd = Path(workdir)
    (wd / "stim.hex").write_text("\n".join(stim_words) + "\n")
    act = wd / "actual.hex"
    if act.exists():
        act.unlink()
    rc, out = run([VVP, "-n", str(wd / "sim.vvp"), "+stim=stim.hex", "+actual=actual.hex", "+nocheck"],
                  cwd=wd, timeout=timeout)
    if rc is None or rc != 0 or not act.exists():
        return None, out
    nd = hex_digits(out_width(iface))
    words = [normalize_word(l, nd) for l in act.read_text().split() if l.strip()]
    if len(words) != len(stim_words):
        return None, out
    return words, out


def run_vectors(tree, iface, top, stim_words, timeout):
    """Compile + simulate tree on stim. Returns (compiled, words or None, log)."""
    with tempfile.TemporaryDirectory(prefix="rtltask_sim_") as td:
        ok, log = compile_tree(tree, gen_testbench(iface, top, len(stim_words)), td, timeout)
        if not ok:
            return False, None, log
        words, out = simulate(td, stim_words, iface, timeout)
        return True, words, out


def reference_expected(task, iface, stim_words):
    compiled, words, log = run_vectors(reference_tree(task), iface, reference_top(task), stim_words,
                                       tool_timeout(task))
    if not compiled:
        raise TaskError("reference does not compile in iverilog: " + _error_excerpt(log, iverilog=True))
    if words is None:
        raise TaskError("reference simulation failed or timed out")
    return words


# --------------------------------------------------------------------------- yosys formal / synth

def _error_excerpt(output, iverilog=False):
    lines = [l.strip() for l in output.splitlines()
             if "ERROR" in l or (iverilog and ("error" in l.lower() or "syntax" in l.lower()))]
    if lines:
        return lines[-1][:300] if not iverilog else " | ".join(lines[:3])[:300]
    tail = [l.strip() for l in output.splitlines() if l.strip()]
    return tail[-1][:300] if tail else ""


def classify_sat(rc, output):
    if "Induction step proven: SUCCESS!" in output:
        return "equivalent"
    if "model found for base case: FAIL!" in output or "SAT temporal induction proof finished - model found" in output:
        return "different"
    if "Reached maximum number of time steps" in output:
        return "bounded"
    if rc == 0:
        return "unknown"
    return "error"


def _load_design_script(root, top, newname):
    files = hdl_files(root)
    return ("%s\nhierarchy -check -top %s\nproc\nflatten\nhierarchy -top %s\nopt_clean\nmemory\nopt_clean\n"
            "rename %s %s\n" % (_yosys_read_cmds(root, files), _q(top), _q(top), _q(top), newname))


STRUCTURAL_TIMEOUT_S = 60


def _load_pair_script(gold_root, gold_top, gate_root, gate_top):
    return (
        _load_design_script(gold_root, gold_top, "rtltask_gold")
        + "design -stash gold\ndesign -reset-vlog\n"
        + _load_design_script(gate_root, gate_top, "rtltask_gate")
        + "design -stash gate\ndesign -reset-vlog\n"
        + "design -copy-from gold -as rtltask_gold rtltask_gold\n"
        + "design -copy-from gate -as rtltask_gate rtltask_gate\n"
    )


def structural_equiv(td, gold_root, gold_top, gate_root, gate_top, timeout):
    """Fast first pass: Yosys equiv_make/equiv_simple/equiv_induct. Matches signals by name, so it proves
    near-identical designs (most correct infill/repair submissions) in seconds. True only if every $equiv cell
    is proven; anything else (unproven, error, timeout) returns False and the caller falls back to the SAT miter."""
    script = (_load_pair_script(gold_root, gold_top, gate_root, gate_top)
              + "async2sync\n"
              + "equiv_make rtltask_gold rtltask_gate rtltask_equiv\n"
              + "hierarchy -top rtltask_equiv\n"
              + "equiv_simple -seq 5\nequiv_induct -seq 5\nequiv_status -assert\n")
    sp = Path(td) / "structural.ys"
    sp.write_text(script)
    rc, out = run([YOSYS, "-q", "-s", str(sp)], cwd=td, timeout=timeout)
    return rc == 0


def formal_check(task, sub_tree, sub_top=None):
    """Submission vs reference: structural equivalence first, then Yosys miter + sat -tempinduct.
    Returns (status, detail)."""
    fs = formal_settings(task)
    sub_top = sub_top or task["top_module"]
    with tempfile.TemporaryDirectory(prefix="rtltask_formal_") as td:
        gold_root = Path(td) / "gold"
        gate_root = Path(td) / "gate"
        write_tree(gold_root, rtl_only(reference_tree(task)))
        write_tree(gate_root, rtl_only(sub_tree))
        if not hdl_files(gold_root):
            return "error", "reference has no HDL files"
        if not hdl_files(gate_root):
            return "error", "submission has no HDL files"
        if structural_equiv(td, gold_root, reference_top(task), gate_root, sub_top,
                            min(STRUCTURAL_TIMEOUT_S, float(fs.get("timeout_s", 120)))):
            return "equivalent", "structural (equiv_induct)"
        script = (
            _load_pair_script(gold_root, reference_top(task), gate_root, sub_top)
            + "clk2fflogic\n"
            + "miter -equiv -flatten -ignore_gold_x rtltask_gold rtltask_gate rtltask_miter\n"
            + "hierarchy -top rtltask_miter\n"
            + "sat -tempinduct -verify -prove trigger 0 -set-init-zero -maxsteps %d rtltask_miter\n"
            % int(fs.get("max_steps", 60))
        )
        sp = Path(td) / "equiv.ys"
        sp.write_text(script)
        rc, out = run([YOSYS, "-s", str(sp)], cwd=td, timeout=float(fs.get("timeout_s", 120)))
        if rc is None:
            return "unknown", "timeout after %ss" % fs.get("timeout_s")
        status = classify_sat(rc, out)
        return status, (_error_excerpt(out) if status == "error" else "")


def formal_ok(task, status):
    if status == "equivalent":
        return True
    return status == "bounded" and bool(formal_settings(task).get("accept_bounded", True))


def yosys_elaborates(tree, top, timeout):
    with tempfile.TemporaryDirectory(prefix="rtltask_elab_") as td:
        write_tree(td, rtl_only(tree))
        files = hdl_files(td)
        if not files:
            return False, "no HDL files"
        sp = Path(td) / "elab.ys"
        sp.write_text("%s\nhierarchy -check -top %s\nproc\n" % (_yosys_read_cmds(td, files), _q(top)))
        rc, out = run([YOSYS, "-q", "-s", str(sp)], cwd=td, timeout=timeout)
        if rc is None:
            return False, "yosys timeout"
        return rc == 0, _error_excerpt(out)


def synth_cells(tree, top, timeout):
    with tempfile.TemporaryDirectory(prefix="rtltask_synth_") as td:
        write_tree(td, rtl_only(tree))
        files = hdl_files(td)
        if not files:
            return None
        stat = Path(td) / "stat.json"
        sp = Path(td) / "synth.ys"
        sp.write_text("%s\nsynth -flatten -top %s\ntee -q -o %s stat -json\n"
                      % (_yosys_read_cmds(td, files), _q(top), _q(str(stat))))
        rc, _ = run([YOSYS, "-q", "-s", str(sp)], cwd=td, timeout=timeout)
        if rc != 0 or not stat.exists():
            return None
        try:
            data = json.loads(stat.read_text())
        except ValueError:
            return None
        if "design" in data and "num_cells" in data["design"]:
            return int(data["design"]["num_cells"])
        mods = data.get("modules", {})
        m = mods.get("\\" + top) or mods.get(top)
        return int(m["num_cells"]) if m and "num_cells" in m else None


# --------------------------------------------------------------------------- grading

def get_interface(task):
    iface = task.get("interface")
    if not iface or iface.get("inputs") is None or iface.get("outputs") is None:
        raise TaskError("task has no interface; run finalize first")
    return iface


def grade_tree(task, tree, always_formal=False, with_synth=True):
    """Grade a design tree (path -> text). Returns the grade dict."""
    iface = get_interface(task)
    top = task["top_module"]
    timeout = tool_timeout(task)
    result = {"task_id": task["task_id"], "compiled": False,
              "public": {"passed": 0, "total": 0},
              "hidden_vectors": {"passed": 0, "total": 0},
              "formal": "skipped", "correct": False, "reward": 0.0, "synth": {"cells": None}}
    pt = task.get("public_tests") or {}
    pub_stim = list(pt.get("stimulus") or [])
    pub_exp = [normalize_word(w, hex_digits(out_width(iface))) for w in (pt.get("expected") or [])]
    result["public"]["total"] = len(pub_stim)
    hv = hidden_vector_settings(task)
    hid_stim = gen_stimulus(iface, int(hv["cycles"]), int(hv["seed"]))
    result["hidden_vectors"]["total"] = len(hid_stim)

    with tempfile.TemporaryDirectory(prefix="rtltask_grade_") as td:
        tb_pub = gen_testbench(iface, top, max(1, len(pub_stim)))
        ok, log = compile_tree(tree, tb_pub, os.path.join(td, "pub"), timeout)
        if not ok:
            result["compile_log"] = _error_excerpt(log, iverilog=True)
            return result
        result["compiled"] = True
        if pub_stim:
            words, _ = simulate(os.path.join(td, "pub"), pub_stim, iface, timeout)
            if words is not None:
                result["public"]["passed"] = compare_words(words, pub_exp)
        hid_exp = reference_expected(task, iface, hid_stim)
        ok, log = compile_tree(tree, gen_testbench(iface, top, len(hid_stim)), os.path.join(td, "hid"), timeout)
        if ok:
            words, _ = simulate(os.path.join(td, "hid"), hid_stim, iface, timeout)
            if words is not None:
                result["hidden_vectors"]["passed"] = compare_words(words, hid_exp)

    vectors_ok = (result["public"]["passed"] == result["public"]["total"]
                  and result["hidden_vectors"]["passed"] == result["hidden_vectors"]["total"])
    if vectors_ok or always_formal:
        status, detail = formal_check(task, tree)
        result["formal"] = status
        if detail:
            result["formal_detail"] = detail
    if with_synth:
        result["synth"]["cells"] = synth_cells(tree, top, timeout)
    result["correct"] = bool(result["compiled"] and vectors_ok and formal_ok(task, result["formal"]))
    result["reward"] = 1.0 if result["correct"] else 0.0
    return result


def cmd_grade(task, workspace):
    tree = submission_tree(task, workspace)
    try:
        return grade_tree(task, tree)
    except TaskError as e:
        return {"task_id": task.get("task_id"), "compiled": False, "public": {"passed": 0, "total": 0},
                "hidden_vectors": {"passed": 0, "total": 0}, "formal": "error", "correct": False,
                "reward": 0.0, "synth": {"cells": None}, "error": str(e)}


# --------------------------------------------------------------------------- prepare

def task_md(task):
    iface = get_interface(task)
    lines = ["# Task: %s" % task["task_id"], "",
             "Kind: `%s`  |  Difficulty: `%s`  |  Top module: `%s`" % (task.get("kind"), task.get("difficulty", "unknown"), task["top_module"]),
             "", "## Specification", "", (task.get("spec") or "").rstrip(), "",
             "## Interface of `%s`" % task["top_module"], "",
             "| port | direction | width | role |", "|---|---|---|---|"]
    if iface.get("clock"):
        lines.append("| `%s` | input | 1 | clock (rising edge) |" % iface["clock"])
    rst = iface.get("reset") or {}
    for p in iface["inputs"]:
        role = ""
        if p["name"] == rst.get("name"):
            role = "reset (active %s)" % ("low" if rst.get("active_low") else "high")
        lines.append("| `%s` | input | %d | %s |" % (p["name"], p["width"], role))
    for p in iface["outputs"]:
        lines.append("| `%s` | output | %d | |" % (p["name"], p["width"]))
    editable = task.get("editable") or []
    readonly = [k for k in (task.get("files") or {}) if not is_editable(task, k)]
    lines += ["", "## Files", "",
              "Editable (only these are graded; create them if missing):"]
    lines += ["- `%s`" % e for e in editable] or ["- (none)"]
    if readonly:
        lines += ["", "Read-only (restored from the task before grading; changes are ignored):"]
        lines += ["- `%s`" % r for r in readonly]
    if task.get("kind") == "infill":
        lines += ["", "Replace the `[MASKED]` region so the design behaves as intended."]
    lim = dict(DEFAULT_LIMITS)
    lim.update(task.get("limits") or {})
    lines += ["", "## Tools and limits", "",
              "Tools: %s" % ", ".join("`%s`" % t for t in (task.get("tools") or DEFAULT_TOOLS)),
              "",
              "Limits: max agent steps %s, wall time %ss, per-tool timeout %ss."
              % (lim.get("max_agent_steps"), lim.get("wall_time_s"), lim.get("tool_timeout_s")),
              "", "## Testing", "",
              "Run `sh tests/public/run.sh`. It compiles every `.v`/`.sv` file under `rtl/` together with the",
              "generated testbench (`iverilog -g2012`) and prints `PASS` or the first mismatching cycles.",
              "",
              "- `tests/public/stimulus.hex`: one hex word per cycle; all inputs (excluding the clock) packed",
              "  MSB-first in the order of the interface table.",
              "- `tests/public/expected.hex`: one hex word per cycle; all outputs packed MSB-first; `x` digits are",
              "  don't care.",
              ]
    if iface.get("clock"):
        lines.append("- Sequential timing: inputs change just after the falling clock edge; outputs are sampled just "
                     "before the next rising edge (clock period 10).")
        if rst:
            lines.append("- Reset is asserted for the first 2 cycles, then occasionally at random.")
    else:
        lines.append("- Combinational timing: inputs are applied, outputs sampled 1 time unit later.")
    lines += ["", "Grading also uses additional hidden tests and a formal equivalence check, so passing the public",
              "tests is necessary but not sufficient.", ""]
    return "\n".join(lines)


RUN_SH = """#!/bin/sh
# Compile rtl/ + the public testbench and run the public vectors.
cd "$(dirname "$0")" || exit 2
ROOT=../..
FILES=$(find "$ROOT/rtl" -type f \\( -name '*.v' -o -name '*.sv' \\) 2>/dev/null | sort)
if [ -z "$FILES" ]; then echo "COMPILE ERROR: no .v/.sv files under rtl/"; exit 2; fi
INCS="-I$ROOT/rtl"
for d in $(find "$ROOT/rtl" -type d); do INCS="$INCS -I$d"; done
# shellcheck disable=SC2086
iverilog -g2012 -s tb $INCS -o sim.vvp tb.v $FILES || { echo "COMPILE ERROR"; exit 2; }
OUT=$(vvp -n sim.vvp +stim=stimulus.hex +expected=expected.hex) ; RC=$?
echo "$OUT"
rm -f sim.vvp
[ $RC -ne 0 ] && exit $RC
echo "$OUT" | grep -q '^PASS' && exit 0
exit 1
"""


def cmd_prepare(task, dest):
    iface = get_interface(task)
    pt = task.get("public_tests")
    if not pt or not pt.get("stimulus"):
        raise TaskError("task has no public_tests; run finalize first")
    dest = Path(dest)
    dest.mkdir(parents=True, exist_ok=True)
    write_tree(dest, starter_tree(task))
    (dest / "rtl").mkdir(exist_ok=True)
    tp = dest / "tests" / "public"
    tp.mkdir(parents=True, exist_ok=True)
    (tp / "tb.v").write_text(gen_testbench(iface, task["top_module"], len(pt["stimulus"])))
    (tp / "stimulus.hex").write_text("\n".join(pt["stimulus"]) + "\n")
    (tp / "expected.hex").write_text("\n".join(pt["expected"]) + "\n")
    (tp / "run.sh").write_text(RUN_SH)
    os.chmod(tp / "run.sh", 0o755)
    (dest / "TASK.md").write_text(task_md(task))
    return {"task_id": task["task_id"], "workspace": str(dest)}


# --------------------------------------------------------------------------- finalize / validate

def fill_defaults(task):
    t = copy.deepcopy(task)
    t.setdefault("schema_version", SCHEMA_VERSION)
    t.setdefault("difficulty", "unknown")
    t.setdefault("files", {})
    t.setdefault("tools", list(DEFAULT_TOOLS))
    lim = dict(DEFAULT_LIMITS)
    lim.update(t.get("limits") or {})
    t["limits"] = lim
    h = t.setdefault("hidden", {})
    h.setdefault("reference_top", t.get("top_module"))
    h["hidden_vectors"] = hidden_vector_settings(t)
    fs = dict(DEFAULT_FORMAL)
    fs.update(h.get("formal") or {})
    h["formal"] = fs
    return t


def interface_ok(iface):
    return bool(iface) and isinstance(iface.get("inputs"), list) and isinstance(iface.get("outputs"), list) \
        and "clock" in iface and "reset" in iface


def cmd_finalize(task, cycles=None):
    """Returns (new_task, report)."""
    t = fill_defaults(task)
    if not t.get("top_module"):
        raise TaskError("task has no top_module")
    if not (t.get("hidden") or {}).get("reference_files"):
        raise TaskError("task has no hidden.reference_files")
    timeout = tool_timeout(t)
    if not interface_ok(t.get("interface")):
        t["interface"] = derive_interface(reference_tree(t), reference_top(t), timeout)
    iface = t["interface"]
    n = int(cycles or (t.get("public_tests") or {}).get("cycles") or DEFAULT_PUBLIC_CYCLES)
    stim = gen_stimulus(iface, n, stable_seed(t["task_id"]))
    exp = reference_expected(t, iface, stim)
    t["public_tests"] = {"kind": "vectors", "cycles": n, "stimulus": stim, "expected": exp}
    return t, cmd_validate(t)


def cmd_validate(task):
    reasons = []
    try:
        for k in ("task_id", "top_module", "spec", "kind"):
            if not task.get(k):
                reasons.append("missing field: %s" % k)
        if task.get("schema_version") != SCHEMA_VERSION:
            reasons.append("schema_version must be %d" % SCHEMA_VERSION)
        if task.get("kind") not in ("repair", "spec_to_rtl", "infill"):
            reasons.append("unknown kind: %r" % task.get("kind"))
        if not task.get("editable"):
            reasons.append("no editable files")
        ref_files = (task.get("hidden") or {}).get("reference_files") or {}
        if not ref_files:
            reasons.append("no hidden.reference_files")
        if reasons:
            return {"task_id": task.get("task_id"), "valid": False, "reasons": reasons}
        for rel in list(task.get("files") or {}) + list(ref_files):
            safe_relpath(rel)

        timeout = tool_timeout(task)
        rtree = reference_tree(task)
        ok, why = yosys_elaborates(rtree, reference_top(task), timeout)
        if not ok:
            reasons.append("reference does not elaborate in yosys: %s" % why)
            return {"task_id": task["task_id"], "valid": False, "reasons": reasons}

        iface = task.get("interface")
        if not interface_ok(iface):
            reasons.append("interface missing or incomplete")
            return {"task_id": task["task_id"], "valid": False, "reasons": reasons}
        try:
            derived = derive_interface(rtree, reference_top(task), timeout)
            names = lambda i: ([(p["name"], p["width"]) for p in i["inputs"]],
                               [(p["name"], p["width"]) for p in i["outputs"]])
            dports = sorted(names(derived)[0] + ([(derived["clock"], 1)] if derived["clock"] else []))
            iports = sorted(names(iface)[0] + ([(iface["clock"], 1)] if iface.get("clock") else []))
            if dports != iports or sorted(names(derived)[1]) != sorted(names(iface)[1]):
                reasons.append("interface does not match reference ports")
        except TaskError as e:
            reasons.append(str(e))

        pt = task.get("public_tests")
        if not pt or not pt.get("stimulus"):
            reasons.append("public_tests missing")
        else:
            n = len(pt["stimulus"])
            if len(pt.get("expected") or []) != n or pt.get("cycles", n) != n:
                reasons.append("public_tests stimulus/expected/cycles lengths disagree")
            idig, odig = hex_digits(in_width(iface)), hex_digits(out_width(iface))
            if any(len(w) != idig or not re.match(r"^[0-9a-fA-F]+$", w) for w in pt["stimulus"]):
                reasons.append("public_tests stimulus words have wrong width (want %d hex digits)" % idig)
            if any(len(w) != odig or not re.match(r"^[0-9a-fA-FxX]+$", w) for w in pt.get("expected") or []):
                reasons.append("public_tests expected words have wrong width (want %d hex digits)" % odig)
            if all(set(w.lower()) == {"x"} for w in pt.get("expected") or []):
                reasons.append("public expected outputs are all don't-care (x)")
        if reasons:
            return {"task_id": task["task_id"], "valid": False, "reasons": reasons}

        g = grade_tree(task, rtree, always_formal=True, with_synth=False)
        if not g["compiled"]:
            reasons.append("reference does not compile in iverilog: %s" % g.get("compile_log", ""))
        else:
            if g["public"]["passed"] != g["public"]["total"]:
                reasons.append("reference fails its public tests (%d/%d)" % (g["public"]["passed"], g["public"]["total"]))
            if g["hidden_vectors"]["passed"] != g["hidden_vectors"]["total"]:
                reasons.append("reference fails its hidden vectors (%d/%d)"
                               % (g["hidden_vectors"]["passed"], g["hidden_vectors"]["total"]))
            if not formal_ok(task, g["formal"]):
                reasons.append("reference vs itself formal check: %s %s" % (g["formal"], g.get("formal_detail", "")))

        if task.get("kind") == "repair" and not reasons:
            st = submission_tree_from_files(task)
            sg = grade_tree(task, st, always_formal=True, with_synth=False)
            if not sg["compiled"]:
                reasons.append("repair starter does not compile")
            elif sg["correct"] or (sg["hidden_vectors"]["passed"] == sg["hidden_vectors"]["total"]
                                   and sg["public"]["passed"] == sg["public"]["total"]
                                   and formal_ok(task, sg["formal"])):
                reasons.append("repair starter already passes every hidden check")
    except TaskError as e:
        reasons.append(str(e))
    return {"task_id": task.get("task_id"), "valid": not reasons, "reasons": reasons}


def submission_tree_from_files(task):
    """The starter as the agent would submit it unchanged."""
    return starter_tree(task)


def _finalize_one(path):
    try:
        task = load_task(path)
    except (OSError, ValueError) as e:
        return {"file": str(path), "task_id": None, "suite": None, "kind": None,
                "valid": False, "reasons": ["cannot read task: %s" % e]}
    try:
        new, rep = cmd_finalize(task)
        write_json_atomic(path, new)
    except TaskError as e:
        rep = {"valid": False, "reasons": [str(e)]}
    except Exception as e:  # keep the batch going
        rep = {"valid": False, "reasons": ["internal error: %r" % e]}
    return {"file": str(path), "task_id": task.get("task_id"), "suite": task.get("suite"),
            "kind": task.get("kind"), "valid": rep["valid"], "reasons": rep["reasons"]}


def expand_paths(spec):
    p = Path(spec)
    if p.is_dir():
        return sorted(str(x) for x in p.rglob("*.json"))
    if p.is_file():
        return [str(p)]
    return sorted(glob.glob(spec, recursive=True))


def cmd_finalize_all(spec, jobs):
    paths = expand_paths(spec)
    results = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=max(1, jobs)) as ex:
        for r in ex.map(_finalize_one, paths):
            results.append(r)
            print("%s %s" % ("ok  " if r["valid"] else "FAIL", r["task_id"] or r["file"]), file=sys.stderr, flush=True)
    summary = {"total": len(results), "valid": sum(r["valid"] for r in results),
               "invalid": sum(not r["valid"] for r in results), "by_suite": {}, "by_kind": {}, "invalid_tasks": []}
    for r in results:
        for key, bucket in (("suite", "by_suite"), ("kind", "by_kind")):
            b = summary[bucket].setdefault(str(r[key]), {"total": 0, "valid": 0, "invalid": 0})
            b["total"] += 1
            b["valid" if r["valid"] else "invalid"] += 1
        if not r["valid"]:
            summary["invalid_tasks"].append({"task_id": r["task_id"], "file": r["file"], "reasons": r["reasons"]})
    return summary


# --------------------------------------------------------------------------- CLI

def main(argv=None):
    ap = argparse.ArgumentParser(prog="rtltask.py", description=__doc__.split("\n\n")[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("prepare"); p.add_argument("task"); p.add_argument("dir")
    p = sub.add_parser("grade"); p.add_argument("task"); p.add_argument("dir")
    p = sub.add_parser("finalize"); p.add_argument("task"); p.add_argument("--write", action="store_true")
    p.add_argument("--cycles", type=int, default=None, help="public test cycles (default: existing or 64)")
    p = sub.add_parser("validate"); p.add_argument("task")
    p = sub.add_parser("finalize-all"); p.add_argument("spec"); p.add_argument("--jobs", type=int, default=os.cpu_count() or 4)
    a = ap.parse_args(argv)

    try:
        if a.cmd == "finalize-all":
            out = cmd_finalize_all(a.spec, a.jobs)
            print(json.dumps(out, indent=2))
            return 0 if out["invalid"] == 0 else 1
        task = load_task(a.task)
        if a.cmd == "prepare":
            out = cmd_prepare(task, a.dir)
        elif a.cmd == "grade":
            out = cmd_grade(task, a.dir)
        elif a.cmd == "validate":
            out = cmd_validate(task)
        elif a.cmd == "finalize":
            new, rep = cmd_finalize(task, a.cycles)
            if a.write:
                write_json_atomic(a.task, new)
            out = dict(rep, written=bool(a.write))
            if not a.write:
                out["public_tests"] = new["public_tests"]
                out["interface"] = new["interface"]
        print(json.dumps(out, indent=2))
        if a.cmd in ("validate", "finalize"):
            return 0 if out["valid"] else 1
        return 0
    except TaskError as e:
        print(json.dumps({"error": str(e)}), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
