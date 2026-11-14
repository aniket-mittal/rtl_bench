#!/usr/bin/env python3
"""Convert RTLLM and verilog-eval into standard `spec_to_rtl` task JSONs (schema_version 1).

Inputs : sources/rtllm/<design>/{design_description.txt, verified_*.v}
         sources/verilog-eval/ProbNNN_<name>_{prompt.txt, ref.sv}
Outputs: taskgen/build/rtllm/rtllm__<design>__spec_to_rtl.json
         taskgen/build/verilog-eval/verilog-eval__<ProbNNN_name>__spec_to_rtl.json

Standard library only. Idempotent: both output directories are cleared and rewritten on every run.
`interface` is left out and `public_tests` is null; the exporter (`rtltask.py finalize`) derives them.

RTLLM: the top module is the one the description names under "Module name:". The reference is the
verified file with its top module renamed to that name when they differ (most are `verified_<name>`;
a few use another spelling, e.g. freq_divbyeven vs the requested freq_diveven). The top is the module
of that name, else `verified_<name>`, else the single module no other module instantiates.

verilog-eval: the reference module `RefModule` is renamed to `TopModule`, the name the prompt asks for.

Skipped (reasons grouped in the printed summary): references Yosys rejects (sources/YOSYS_STATUS.md list,
then `read_verilog -sv; hierarchy -check -top <top>`), references iverilog -g2012 rejects, tops with inout
ports, and references whose port names do not all appear in the spec text.

Usage: python3 harness/convert_specs.py [--only rtllm|verilog-eval] [--jobs N]
"""
from __future__ import annotations

import argparse
import collections
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import convert_rtlbenchls as t2  # noqa: E402  (lexer helpers and defaults)

REPO = t2.REPO
SRC = REPO / "sources"
OUT = REPO / "taskgen" / "build"
TIMEOUT_S = 20

LICENSES = {
    "rtllm": {"license": "see upstream", "upstream": "https://github.com/hkust-zhiyao/RTLLM",
              "note": "Per sources/README.md: RTLLM LICENSE was not copied; see upstream."},
    "verilog-eval": {"license": "MIT", "upstream": "https://github.com/NVlabs/verilog-eval",
                     "upstream_commit": "c498220"},
}


def seed_for(task_id: str) -> int:
    return t2.seed_for(task_id)


def yosys_rejects() -> set[str]:
    """verilog-eval `_ref.sv` names that sources/YOSYS_STATUS.md lists as rejected."""
    text = (SRC / "YOSYS_STATUS.md").read_text()
    m = re.search(r"## verilog-eval files Yosys rejects(.*?)(?:\n## |\Z)", text, re.S)
    return set(re.findall(r"Prob\w+_ref\.sv", m.group(1))) if m else set()


def rename_module(text: str, old: str, new: str) -> str:
    """Rename the definition `module old` (and any instantiation of it) to `new`, outside comments."""
    if old == new:
        return text
    toks = t2.tokenize(t2.blank_comments(text))
    spans = [(s, e) for (t, s, e) in toks if t == old]
    for s, e in reversed(spans):
        text = text[:s] + new + text[e:]
    return text


def check_reference(path_name: str, text: str, top: str):
    """(ports, None) if Yosys and iverilog accept the reference, else (None, (category, detail))."""
    with tempfile.TemporaryDirectory(prefix="specs_") as td:
        src = os.path.join(td, path_name)
        js = os.path.join(td, "ports.json")
        with open(src, "w") as f:
            f.write(text)
        script = (f'read_verilog -sv "{src}"; hierarchy -check -top {top}; '
                  f"select -assert-none {top}/i:* {top}/o:* %i; proc; write_json \"{js}\"")
        try:
            r = subprocess.run(["yosys", "-q", "-p", script], capture_output=True, text=True, timeout=TIMEOUT_S)
        except subprocess.TimeoutExpired:
            return None, ("yosys timeout", "")
        if r.returncode != 0:
            msg = (r.stderr + r.stdout).replace(td + "/", "")
            errs = [ln.strip() for ln in msg.splitlines() if "ERROR" in ln] or msg.strip().splitlines()[-1:]
            if any("selection is not empty" in e for e in errs):
                return None, ("top has inout ports (unsupported by the harness)", "")
            return None, ("yosys rejects reference", (errs[0] if errs else "yosys failed")[:300])
        try:
            r = subprocess.run(["iverilog", "-g2012", "-s", top, "-o", os.path.join(td, "a.out"), src],
                               capture_output=True, text=True, timeout=TIMEOUT_S)
        except subprocess.TimeoutExpired:
            return None, ("iverilog timeout", "")
        if r.returncode != 0:
            msg = (r.stderr + r.stdout).replace(td + "/", "").strip().splitlines()
            return None, ("iverilog rejects reference", (msg[0] if msg else "iverilog failed")[:300])
        mod = json.load(open(js))["modules"].get(top) or {}
        return list(mod.get("ports", {})), None


def missing_ports(ports, spec_text):
    words = set(re.findall(r"[A-Za-z_][A-Za-z0-9_$]*", spec_text))
    return [p for p in ports if p not in words]


def make_task(suite, task_id, top, path, reference, spec, provenance):
    return {
        "schema_version": 1,
        "task_id": task_id,
        "suite": suite,
        "kind": "spec_to_rtl",
        "difficulty": "unknown",
        "spec": spec,
        "top_module": top,
        "interface": None,
        "files": {},
        "editable": [path],
        "tools": list(t2.DEFAULT_TOOLS),
        "limits": dict(t2.DEFAULT_LIMITS),
        "public_tests": None,
        "hidden": {
            "reference_files": {path: reference},
            "reference_top": top,
            "hidden_vectors": {"cycles": t2.HIDDEN_CYCLES, "seed": seed_for(task_id)},
            "formal": dict(t2.DEFAULT_FORMAL),
        },
        "provenance": provenance,
    }


RULES = (
    "- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.\n"
    "- Keep the module name and every port name, direction and width exactly as specified. "
    "You may add helper modules in the same file.\n"
    "- Grading simulates your design against a hidden reference and checks formal equivalence with it. "
    "Only behavior at the top-module ports counts.\n"
)


# --------------------------------------------------------------------------- RTLLM

def rtllm_candidates():
    """[(design, payload | None, skip_reason | None)] for every RTLLM design folder."""
    out = []
    for d in sorted(p for p in (SRC / "rtllm").iterdir() if p.is_dir()):
        desc_p = d / "design_description.txt"
        refs = sorted(d.glob("verified_*.v"))
        if not desc_p.exists() or len(refs) != 1:
            out.append((d.name, None, ("missing description or not exactly one verified_*.v", "")))
            continue
        desc = desc_p.read_text()
        m = re.search(r"Module name:\s*([A-Za-z_][A-Za-z0-9_$]*)", desc, re.I)
        if not m:
            out.append((d.name, None, ("description names no module", "")))
            continue
        top = m.group(1)
        ref_text = refs[0].read_text()
        toks = t2.tokenize(t2.blank_comments(ref_text))
        mods = t2.find_modules(toks)
        names = [x[0] for x in mods]
        if top in names:
            ref_top = top
        elif "verified_" + top in names:
            ref_top = "verified_" + top
        else:
            inst = set()
            for name, _, h, e in mods:
                inst |= t2.instantiated(toks, h, e, set(names) - {name})
            roots = [n for n in names if n not in inst]
            if len(roots) != 1:
                out.append((d.name, None, ("cannot identify the reference top module", f"modules {names}")))
                continue
            ref_top = roots[0]
        if ref_top != top and top in names:
            out.append((d.name, None, ("name clash renaming reference top", f"{ref_top}->{top}")))
            continue
        out.append((d.name, {"desc": desc, "desc_path": desc_p, "ref_path": refs[0], "top": top,
                             "ref_top": ref_top, "reference": rename_module(ref_text, ref_top, top)}, None))
    return out


def rtllm_task(design, p, ports):
    top = p["top"]
    path = f"rtl/{top}.v"
    task_id = f"rtllm/{design}/spec_to_rtl"
    spec = (
        f"# Implement `{top}` (RTLLM: {design})\n\n"
        f"Create `{path}` containing a Verilog module named `{top}` that implements the design described "
        f"below, with exactly the ports the description lists (same names, directions and widths).\n\n"
        f"## Rules\n\n{RULES}\n"
        f"## Design description\n\n{p['desc'].strip()}\n"
    )
    prov = {
        "source": "rtllm",
        "design": design,
        "description_file": str(p["desc_path"].relative_to(REPO)),
        "reference_file": str(p["ref_path"].relative_to(REPO)),
        "reference_module_renamed": None if p["ref_top"] == top else {"from": p["ref_top"], "to": top},
        "reference_ports": ports,
        "license": dict(LICENSES["rtllm"]),
        "converter": "harness/convert_specs.py",
    }
    return make_task("rtllm", task_id, top, path, p["reference"], spec, prov)


# --------------------------------------------------------------------------- verilog-eval

def ve_candidates():
    rejects = yosys_rejects()
    out = []
    for prompt_p in sorted((SRC / "verilog-eval").glob("Prob*_prompt.txt")):
        name = prompt_p.name[: -len("_prompt.txt")]
        ref_p = prompt_p.with_name(name + "_ref.sv")
        if not ref_p.exists():
            out.append((name, None, ("missing _ref.sv", "")))
            continue
        if ref_p.name in rejects:
            out.append((name, None, ("listed as Yosys-rejected in sources/YOSYS_STATUS.md",
                                     "latch inferred in always_comb")))
            continue
        ref_text = ref_p.read_text()
        if "RefModule" not in {x[0] for x in t2.find_modules(t2.tokenize(t2.blank_comments(ref_text)))}:
            out.append((name, None, ("reference defines no RefModule", "")))
            continue
        out.append((name, {"prompt": prompt_p.read_text(), "prompt_path": prompt_p, "ref_path": ref_p,
                           "top": "TopModule", "reference": rename_module(ref_text, "RefModule", "TopModule")},
                    None))
    return out


def ve_task(name, p, ports):
    path = "rtl/TopModule.sv"
    task_id = f"verilog-eval/{name}/spec_to_rtl"
    spec = (
        f"# Implement `TopModule` (verilog-eval: {name})\n\n"
        f"Create `{path}` containing a module named `TopModule` that does what the problem below asks, "
        f"with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.\n\n"
        f"## Rules\n\n{RULES}\n"
        f"## Problem\n\n{p['prompt'].strip()}\n"
    )
    prov = {
        "source": "verilog-eval",
        "problem": name,
        "prompt_file": str(p["prompt_path"].relative_to(REPO)),
        "reference_file": str(p["ref_path"].relative_to(REPO)),
        "reference_module_renamed": {"from": "RefModule", "to": "TopModule"},
        "reference_ports": ports,
        "license": dict(LICENSES["verilog-eval"]),
        "converter": "harness/convert_specs.py",
    }
    return make_task("verilog-eval", task_id, "TopModule", path, p["reference"], spec, prov)


# --------------------------------------------------------------------------- driver

def run_suite(suite, cands, build, ext, spec_key, jobs):
    out = OUT / suite
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)
    skipped = [(n, r) for n, p, r in cands if p is None]
    todo = [(n, p) for n, p, r in cands if p is not None]

    def check(item):
        n, p = item
        return n, p, *check_reference(p["top"] + ext, p["reference"], p["top"])

    written = []
    with ThreadPoolExecutor(max_workers=jobs) as ex:
        for n, p, ports, err in ex.map(check, todo):
            if err:
                skipped.append((n, err))
                continue
            miss = missing_ports(ports, p[spec_key])
            if miss:
                skipped.append((n, ("reference port names missing from the spec text", ", ".join(miss))))
                continue
            task = build(n, p, ports)
            (out / (task["task_id"].replace("/", "__") + ".json")).write_text(json.dumps(task, indent=2) + "\n")
            written.append(task["task_id"])
    return {
        "suite": suite,
        "candidates": len(cands),
        "written": len(written),
        "skipped": len(skipped),
        "skipped_by_reason": dict(collections.Counter(r[0] for _, r in skipped).most_common()),
        "skipped_records": [{"name": n, "reason": r[0], "detail": r[1]} for n, r in sorted(skipped)],
        "example_task_id": sorted(written)[0] if written else None,
        "out_dir": str(out),
    }


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--only", choices=("rtllm", "verilog-eval"))
    ap.add_argument("--jobs", type=int, default=4, help="parallel Yosys/iverilog checks (default 4)")
    args = ap.parse_args(argv)
    reports = []
    if args.only in (None, "rtllm"):
        reports.append(run_suite("rtllm", rtllm_candidates(), rtllm_task, ".v", "desc", args.jobs))
    if args.only in (None, "verilog-eval"):
        reports.append(run_suite("verilog-eval", ve_candidates(), ve_task, ".sv", "prompt", args.jobs))
    print(json.dumps(reports, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
