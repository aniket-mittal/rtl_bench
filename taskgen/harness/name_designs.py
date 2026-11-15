"""
Give RTL-BenchLS designs readable names.

Upstream renamed most modules to row ids (autovcoder_009039, origen_178933, ...), so nothing in the data says
what a design is. This asks Claude (Haiku, headless `claude -p`, no tools) to read each design's ports and
first lines of code and return a short snake_case name such as uart_tx or sync_fifo. Designs whose top module
already has a real name keep it. Results are cached in taskgen/runs/benchls_names.json (design id -> name),
which export_tasks.py uses for folder names: infill-<name>-<number>.

  python3 name_designs.py [--jobs 8] [--batch 40]
"""
import argparse
import json
import os
import re
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
BUILD = [REPO / "taskgen/build/rtl-benchls", REPO / "taskgen/build/rtl-benchls-task1"]
OUT = REPO / "taskgen/runs/benchls_names.json"
OPAQUE = re.compile(r"^(mg|origen|rtlpp|autovcoder)_\d+$")
CLAUDE = os.environ.get("CLAUDE_BIN", str(Path.home() / ".local/bin/claude"))

PROMPT = """You name Verilog designs. For each design below, reply with a short snake_case name (1 to 4 words,
lowercase, letters/digits/underscores, at most 30 characters) saying what the hardware does, e.g. uart_tx,
sync_fifo, seg7_decoder, alu_8bit, pwm_generator, crc32, apb_slave, debounce. Be specific when the code makes it
clear; if it is generic glue logic use a plain description like mux_4to1 or reg_bank. Never use the id itself.
Reply with only a JSON object mapping each id to its name, no prose.

"""


def design_id(task):
    tid = task["task_id"].split("/")[-1]
    return task["provenance"].get("parent_design") or re.sub(r"_(block|module)_\d+$", "", tid)


def snippet(task):
    ref = next(iter(task["hidden"]["reference_files"].values()))
    lines = [l.rstrip() for l in ref.splitlines() if l.strip()]
    return "\n".join(lines[:45])[:2500]


def slug(s):
    s = re.sub(r"[^a-z0-9_]+", "_", s.lower()).strip("_")
    return re.sub(r"_+", "_", s)[:30].strip("_") or "design"


def ask(batch):
    text = PROMPT + "\n\n".join(f"### id: {i}\n{code}" for i, code in batch)
    for _ in range(3):
        try:
            r = subprocess.run([CLAUDE, "-p", "--model", "haiku", "--tools", "", "--no-session-persistence",
                                "--strict-mcp-config", "--setting-sources", ""],
                               input=text, capture_output=True, text=True, timeout=300, cwd="/tmp")
            raw = r.stdout[r.stdout.find("{"): r.stdout.rfind("}") + 1]
            got = json.loads(raw)
            return {i: slug(got[i]) for i, _ in batch if i in got and got[i]}
        except (subprocess.TimeoutExpired, ValueError):
            continue
    return {}


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--jobs", type=int, default=8)
    ap.add_argument("--batch", type=int, default=40)
    a = ap.parse_args()
    names = json.loads(OUT.read_text()) if OUT.exists() else {}
    todo = {}
    for d in BUILD:
        for p in sorted(d.glob("*.json")):
            t = json.loads(p.read_text())
            did = design_id(t)
            if did in names or did in todo:
                continue
            top = t["top_module"]
            if not OPAQUE.match(did) and not OPAQUE.match(top):
                names[did] = slug(top if not OPAQUE.match(top) else did)
            else:
                todo[did] = snippet(t)
    items = list(todo.items())
    batches = [items[i:i + a.batch] for i in range(0, len(items), a.batch)]
    print(f"{len(names)} named from module names, {len(items)} to name in {len(batches)} batches", flush=True)
    with ThreadPoolExecutor(a.jobs) as ex:
        for k, got in enumerate(ex.map(ask, batches), 1):
            names.update(got)
            if k % 10 == 0 or k == len(batches):
                OUT.write_text(json.dumps(names, indent=0, sort_keys=True) + "\n")
                print(f"{k}/{len(batches)} batches, {len(names)} named", flush=True)
    OUT.write_text(json.dumps(names, indent=0, sort_keys=True) + "\n")
    missing = [i for i, _ in items if i not in names]
    print(f"done: {len(names)} named, {len(missing)} without a name (they keep their id)")


if __name__ == "__main__":
    sys.exit(main())
