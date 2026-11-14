"""
Grade a submission for one task folder (layout written by export_tasks.py).

  python3 grade.py <task dir> <submission dir> [--no-synth]

<submission dir> holds the agent's version of the editable file(s) (e.g. dut.v), at the same relative paths.
Only editable files are taken from it; read-only files, testbenches and the reference come from the task folder.
Prints one JSON object:

  {"task_id", "compiled", "public": {"passed", "total"}, "hidden": {"passed", "total"},
   "formal": "equivalent|bounded|different|unknown|error|skipped", "correct", "reward", "synth": {"cells"}}

reward is 1.0 only if the design compiles, public_tb.v and hidden_tb.v both print PASS, and the Yosys formal check
against the reference is ok (equivalent, or bounded when accept_bounded). Formal runs only when both testbenches pass.
hidden_tb.v instantiates the reference as <module>__ref, so the reference's modules are renamed before compiling.
"""
import argparse
import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import rtltask as rt  # noqa: E402

RESULT_RE = re.compile(r"^(?:PASS (\d+)/(\d+)|FAIL (\d+)/(\d+))", re.M)
MODULE_RE = re.compile(r"\bmodule\s+([A-Za-z_][A-Za-z0-9_$]*)")


def renamed_reference(text):
    """Rename every module defined in the reference text to <name>__ref (and its instantiations in that text)."""
    for name in set(MODULE_RE.findall(text)):
        text = re.sub(r"(?<![A-Za-z0-9_$])%s(?![A-Za-z0-9_$])" % re.escape(name), name + "__ref", text)
    return text


def hdl(root):
    return sorted(str(p) for p in Path(root).rglob("*") if p.is_file() and p.suffix in rt.HDL_EXTS)


def run_tb(tb_file, files, incdir, timeout):
    """Compile tb + files, run. Returns (compiled, passed, total, log)."""
    with tempfile.TemporaryDirectory(prefix="grade_sim_") as td:
        sim = str(Path(td) / "sim.vvp")
        try:
            c = subprocess.run([rt.IVERILOG, "-g2012", "-s", "tb", "-I", str(incdir), "-o", sim, str(tb_file)] + files,
                               capture_output=True, text=True, timeout=timeout)
        except subprocess.TimeoutExpired:
            return False, 0, 0, "iverilog timeout"
        if c.returncode != 0:
            return False, 0, 0, (c.stdout + c.stderr)[-800:]
        try:
            r = subprocess.run([rt.VVP, "-n", sim], capture_output=True, text=True, timeout=timeout, cwd=td)
        except subprocess.TimeoutExpired:
            return True, 0, 0, "simulation timeout"
    m = RESULT_RE.search(r.stdout)
    if not m:
        return True, 0, 0, (r.stdout + r.stderr)[-800:]
    if m.group(1):
        return True, int(m.group(1)), int(m.group(2)), ""
    total = int(m.group(4))
    return True, total - int(m.group(3)), total, "\n".join(r.stdout.splitlines()[:12])


def grade(task_dir, submission_dir, synth=True):
    task_dir, submission_dir = Path(task_dir), Path(submission_dir)
    meta = json.loads((task_dir / "task.json").read_text())
    files = meta["files"]
    top = meta["top_module"]
    timeout = float(meta.get("limits", {}).get("tool_timeout_s", 120))
    ref_map = files.get("reference") or {files["editable"][0]: "reference.v"}
    res = {"task_id": meta["task_id"], "compiled": False, "public": {"passed": 0, "total": 0},
           "hidden": {"passed": 0, "total": 0}, "formal": "skipped", "correct": False, "reward": 0.0,
           "synth": {"cells": None}}

    tree = {f: (task_dir / f).read_text() for f in files["read_only"]}
    for f in files["editable"]:
        p = submission_dir / f
        if not p.exists():
            res["error"] = f"missing editable file {f}"
            return res
        tree[f] = p.read_text(errors="replace")

    with tempfile.TemporaryDirectory(prefix="grade_design_") as dd:
        dd = Path(dd)
        rt.write_tree(dd / "design", tree)
        design = hdl(dd / "design")
        # reference side for the hidden testbench: read-only files + reference files, modules renamed
        ref_tree = {f: tree[f] for f in files["read_only"]}
        ref_tree.update({e: (task_dir / r).read_text() for e, r in ref_map.items()})
        rt.write_tree(dd / "ref", {k: renamed_reference(v) for k, v in ref_tree.items()})
        ref_only = [str(dd / "ref" / e) for e in ref_map if e.endswith(rt.HDL_EXTS)]

        compiled, passed, total, log = run_tb(task_dir / files["public"][0], design, dd / "design", timeout)
        if not compiled:
            res["compile_log"] = log
            return res
        res["compiled"] = True
        res["public"] = {"passed": passed, "total": total}
        if log:
            res["public_log"] = log
        compiled, passed, total, log = run_tb(task_dir / "hidden_tb.v", design + ref_only, dd / "design", timeout)
        res["hidden"] = {"passed": passed, "total": total}
        if not compiled:
            res["hidden_log"] = log
        vectors_ok = all(res[k]["total"] > 0 and res[k]["passed"] == res[k]["total"] for k in ("public", "hidden"))

        rtl_tree = {"rtl/" + k: v for k, v in tree.items()}
        task = {"top_module": top, "editable": ["rtl/" + e for e in files["editable"]],
                "files": {"rtl/" + f: tree[f] for f in files["read_only"]},
                "hidden": {"reference_files": {"rtl/" + e: (task_dir / r).read_text() for e, r in ref_map.items()},
                           "formal": meta["grading"]["formal"]},
                "limits": meta.get("limits", {})}
        if vectors_ok:
            status, detail = rt.formal_check(task, rtl_tree)
            res["formal"] = status
            if detail:
                res["formal_detail"] = detail
        if synth:
            res["synth"]["cells"] = rt.synth_cells(rtl_tree, top, timeout)
        res["correct"] = bool(vectors_ok and rt.formal_ok(task, res["formal"]))
        res["reward"] = 1.0 if res["correct"] else 0.0
    return res


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("task_dir")
    ap.add_argument("submission_dir")
    ap.add_argument("--no-synth", action="store_true")
    a = ap.parse_args()
    print(json.dumps(grade(a.task_dir, a.submission_dir, synth=not a.no_synth), indent=2))


if __name__ == "__main__":
    main()
