"""
Turn RTL files under ../sources/<collection>/ into a designs.jsonl that main.py can read.

Each .v/.sv file is tried on its own: it is standardized (Pyverilog round-trip, top
module renamed to `dut`) and must elaborate in Yosys. Files that fail either step,
testbenches, and files over --max-lines are skipped. Each kept row records where it
came from.

Usage:
  python prepare_sources.py --out ../tasks/open_source/designs.jsonl \
      basic_verilog verilog-uart verilog-i2c secworks-sha256 secworks-aes verilog-eval
"""
import argparse
import asyncio
import hashlib
import json
from pathlib import Path

from utils.equivalence_check import yosys_sanity_check
from utils.mutate import standardize

SOURCES = Path(__file__).resolve().parent.parent / "sources"


def candidates(collection: str, max_lines: int):
    for path in sorted((SOURCES / collection).rglob("*")):
        if path.suffix not in (".v", ".sv") or "_test" in path.stem or path.stem.endswith("_tb"):
            continue
        text = path.read_text(encoding="utf-8", errors="replace")
        if text.count("\n") > max_lines:
            yield path, None, f"over {max_lines} lines"
            continue
        yield path, text, None


async def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("collections", nargs="+", help="folder names under ../sources")
    ap.add_argument("--out", required=True)
    ap.add_argument("--max-lines", type=int, default=300)
    ap.add_argument("--batch-dir", default="./yosys_files/")
    args = ap.parse_args()

    rows, skipped, seen = [], [], set()
    for collection in args.collections:
        for path, text, reason in candidates(collection, args.max_lines):
            rel = str(path.relative_to(SOURCES))
            if reason is None:
                try:
                    content = standardize(text)
                    if not await yosys_sanity_check(args.batch_dir, content):
                        reason = "yosys elaboration failed"
                except Exception as e:
                    reason = f"standardize failed: {type(e).__name__}"
            if reason:
                skipped.append({"source": rel, "reason": reason})
                continue
            h = hashlib.sha256(content.encode("utf-8")).hexdigest()
            if h in seen:
                skipped.append({"source": rel, "reason": "duplicate"})
                continue
            seen.add(h)
            rows.append({"hash": h, "equivalence_group": h, "content": content,
                         "source": rel, "collection": collection})
            print(f"  ok   {rel}")

    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("".join(json.dumps(r) + "\n" for r in rows), encoding="utf-8")
    out.with_name("skipped.jsonl").write_text("".join(json.dumps(s) + "\n" for s in skipped), encoding="utf-8")
    print(f"\n{len(rows)} designs kept, {len(skipped)} skipped -> {out}")


if __name__ == "__main__":
    asyncio.run(main())
