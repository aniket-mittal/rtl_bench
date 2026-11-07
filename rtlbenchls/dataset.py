"""Loaders for the three task datasets.

Each loader is a generator over typed dicts. The dataset paths default to
the release layout (`data/slice_01.jsonl`, `data/masked_designs.jsonl`,
`data/repo_issue_108_cases.json`) but can be overridden.
"""
from __future__ import annotations
import json
from pathlib import Path
from typing import Iterator, TypedDict, Literal


class Task1Record(TypedDict):
    task_id: str
    design_name: str
    top_module: str
    origin: str
    loc: int
    design_type: Literal["combinational", "sequential"]
    verification_type: Literal["LEC", "SEC"]
    rtl: str                  # the golden RTL (extracted from files[design_name+".v"])
    extra_files: dict[str, str]  # lib.v + embedded TCL/DO script + sources.json


class Task2Record(TypedDict):
    task_id: str
    parent_design: str
    top_module: str
    origin: str
    loc: int
    design_type: Literal["combinational", "sequential"]
    mask_type: Literal["block", "module"]
    mask_index: int
    verification_type: Literal["LEC", "SEC"]
    golden_rtl: str           # full original (unmasked) design
    masked_rtl: str           # design with the masked region (the LLM sees this)
    ref_block: str            # golden contents of the masked region
    extra_files: dict[str, str]


class Task3Record(TypedDict):
    task_id: str
    repository: str
    pr_number: int
    issue_number: int
    issue_title: str
    issue_body: str
    pr_title: str
    pr_body: str
    verilog_files: list[str]   # paths in the upstream repo
    patches: list[dict]        # unified diffs of the golden fix
    base_commit: str           # buggy revision (checkout this to get buggy RTL)
    head_commit: str           # golden / post-merge revision


def _pick_rtl_key(files: dict[str, str], design_name: str) -> str | None:
    """Pick the root .v file (prefer <design_name>.v)."""
    candidate = f"{design_name}.v"
    if candidate in files:
        return candidate
    for k in files:
        if k.endswith(".v") and "/" not in k and "_combined" not in k:
            return k
    return None


def _extra_files(files: dict[str, str], rtl_key: str) -> dict[str, str]:
    """All non-RTL files: lib.v, scripts, sources.json."""
    out = {}
    for k, v in files.items():
        if "/" in k or k == rtl_key:
            continue
        if k.endswith("_combined.v"):
            continue
        out[k] = v
    return out


def load_task1(path: str | Path = "data/slice_01.jsonl") -> Iterator[Task1Record]:
    """Stream Task 1 records (round-trip reasoning, slice 1)."""
    with Path(path).open() as f:
        for line in f:
            rec = json.loads(line)
            files = rec.get("files", {})
            rtl_key = _pick_rtl_key(files, rec["design_name"])
            if rtl_key is None:
                continue
            yield Task1Record(
                task_id=rec["task_id"],
                design_name=rec["design_name"],
                top_module=rec.get("top_module", rec["design_name"]),
                origin=rec.get("origin", ""),
                loc=rec.get("loc", 0),
                design_type=rec.get("design_type", "combinational"),
                verification_type=rec.get("verification_type", "LEC"),
                rtl=files[rtl_key],
                extra_files=_extra_files(files, rtl_key),
            )


def load_task2(path: str | Path = "data/masked_designs.jsonl") -> Iterator[Task2Record]:
    """Stream Task 2 records (masked-content reasoning).

    Each record carries both the full golden RTL and a masked variant where
    the region to be inferred is replaced with `[MASKED]`. The framework
    splices the LLM's recovered block back in and asks the verifier whether
    the reconstructed design is equivalent to the golden.
    """
    with Path(path).open() as f:
        for line in f:
            rec = json.loads(line)
            files = rec.get("files", {})
            parent = rec.get("parent_design") or rec.get("design_name", "")
            rtl_key = _pick_rtl_key(files, parent)
            if rtl_key is None:
                continue
            # The release-build step pre-computes the canonical golden + masked .v
            # files and records their keys. Fall back to legacy guessing only if
            # those keys are absent (older release archives).
            golden_key = rec.get("golden_rtl_key") or rtl_key
            masked_key = rec.get("masked_rtl_key") or f"{parent}_masked.v"
            golden_rtl = files.get(golden_key, files[rtl_key])
            ref_block = rec.get("ref_rtl") or ""
            masked_rtl = files.get(masked_key) or _synth_masked(golden_rtl, ref_block)
            yield Task2Record(
                task_id=rec["task_id"],
                parent_design=parent,
                top_module=rec.get("top_module", parent),
                origin=rec.get("origin", ""),
                loc=rec.get("loc", 0),
                design_type=rec.get("design_type", "sequential"),
                mask_type=rec.get("mask_type", "block"),
                mask_index=rec.get("mask_index", 0),
                verification_type=rec.get("verification_type", "SEC"),
                golden_rtl=golden_rtl,
                masked_rtl=masked_rtl,
                ref_block=ref_block,
                extra_files=_extra_files(files, rtl_key),
            )


def _synth_masked(golden_rtl: str, ref_block: str) -> str:
    """Synthesize a masked RTL by removing the ref block (best-effort).

    Used as a fallback when the upstream record didn't pre-compute a masked .v file.
    The user can override the masked text by setting files["<design>_masked.v"]
    directly in the JSONL record.
    """
    if ref_block and ref_block in golden_rtl:
        return golden_rtl.replace(ref_block, "[MASKED]", 1)
    return golden_rtl  # no diff; framework will warn at run time


def load_task3(path: str | Path = "data/repo_issue_108_cases.json") -> Iterator[Task3Record]:
    """Stream Task 3 records (repository-issue fixing)."""
    data = json.loads(Path(path).read_text())
    cases = data.get("cases", data) if isinstance(data, dict) else data
    for c in cases:
        yield Task3Record(
            task_id=c.get("task_id") or c.get("id", ""),
            repository=c.get("repository", ""),
            pr_number=c.get("pr_number", 0),
            issue_number=c.get("issue_number", 0),
            issue_title=(c.get("issue_info") or {}).get("title", ""),
            issue_body=(c.get("issue_info") or {}).get("body", ""),
            pr_title=(c.get("pr_info") or {}).get("title", ""),
            pr_body=(c.get("pr_info") or {}).get("body", ""),
            verilog_files=c.get("verilog_files", []),
            patches=c.get("patches", []),
            base_commit=c.get("base_commit", ""),
            head_commit=c.get("head_commit", ""),
        )
