"""Aggregate per-design JSONL results into pass-rate summaries.

The output shape matches `results/results_summary.json` so users can plug a
fresh run into the same dashboard / comparison pipeline as the shipped runs.
"""
from __future__ import annotations
import json
from pathlib import Path


def aggregate(jsonl_path: str | Path, denominator: int | None = None) -> dict:
    """Read a per-task JSONL and return {n, pass, pass_pct, errors, by_type}.

    Args:
        jsonl_path: Path to a per-task per-model JSONL (e.g. produced by `run_task1`).
        denominator: If set, compute pass_pct as pass / denominator (paper-aligned).
            If None, use len(records).
    """
    path = Path(jsonl_path)
    records = [json.loads(line) for line in path.open() if line.strip()]
    n = len(records)
    n_pass = sum(1 for r in records if r.get("passed"))
    n_err = sum(1 for r in records if r.get("error"))
    by_type: dict[str, dict[str, int]] = {}
    for r in records:
        t = r.get("verification_type") or "unknown"
        d = by_type.setdefault(t, {"n": 0, "pass": 0})
        d["n"] += 1
        if r.get("passed"):
            d["pass"] += 1
    denom = denominator if denominator is not None else n
    return {
        "n": n,
        "pass": n_pass,
        "errors": n_err,
        "pass_pct": round(100 * n_pass / max(denom, 1), 2),
        "denominator": denom,
        "by_verification_type": by_type,
    }
