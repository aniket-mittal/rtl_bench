"""Task runners. Each `run_taskN` is the single entry point for a task.

Shape of each runner:
    iterable_of_records = load_taskN(dataset_path)
    for each record:
        prompt the LLM (one or two calls)
        splice / extract Verilog
        call verifier
        emit TaskResult to stdout / JSONL

Failures are caught and surfaced as `passed: False, error: <type>: <message>`.
The output is streamed line by line so a long run is recoverable.
"""
from __future__ import annotations
import json
import sys
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Callable, Iterable

from rtlbenchls.protocols import LLMClient, Verifier, TaskResult
from rtlbenchls.dataset import (
    load_task1, load_task2, load_task3,
    Task1Record, Task2Record, Task3Record,
)
from rtlbenchls.utils import extract_verilog, count_tokens


# ---------- prompt templates (shared, paper-aligned) ----------

T1_SPEC_SYSTEM = (
    "You are an expert hardware design engineer. Describe the behavior, inputs, "
    "outputs, and sub-modules of the given Verilog module. Do NOT include any "
    "Verilog or code in your response."
)
T1_SPEC_USER = (
    "Write a plain-English specification for the following Verilog module.\n\n"
    "```verilog\n{rtl}\n```"
)
T1_REGEN_SYSTEM = (
    "You are an expert Verilog RTL designer. Output only the single Verilog "
    "module. No explanation, no markdown."
)
T1_REGEN_USER = (
    "Generate the Verilog module `{top}` based on the following specification.\n\n"
    "{spec}"
)

T2_DESC_SYSTEM = (
    "You are an expert hardware engineer. Write ONLY a brief description in "
    "plain English (3-10 words). No Verilog code in your response."
)
T2_DESC_USER = (
    "The following Verilog design has a masked region marked as [MASKED].\n\n"
    "Full context:\n```verilog\n{masked_rtl}\n```\n\n"
    "The masked code is:\n```verilog\n{ref_block}\n```\n\n"
    "Write a VERY concise description of what the masked region does."
)
T2_RECOVER_SYSTEM = (
    "You are an expert Verilog designer. Generate ONLY the Verilog RTL code "
    "for the masked region. Preserve all signal names from the surrounding "
    "context. No explanation, no markdown formatting."
)
T2_RECOVER_USER = (
    "The following Verilog design has a [MASKED] region.\n\n"
    "```verilog\n{masked_rtl}\n```\n\n"
    "Description of the masked region: {description}\n\n"
    "Generate ONLY the Verilog code that should replace [MASKED]."
)

T3_FIX_SYSTEM = (
    "You are an expert hardware design engineer specializing in Verilog/"
    "SystemVerilog. Fix the bug described in the issue. Output ONLY the "
    "complete corrected module. Make minimal changes -- do not refactor or "
    "modify unrelated code."
)
T3_FIX_USER = (
    "## Bug Report\n\n"
    "**Title:** {issue_title}\n\n"
    "**Description:**\n{issue_body}\n\n"
    "## Buggy Verilog Design\n\n"
    "```verilog\n{buggy_rtl}\n```\n\n"
    "Fix the bug and output the complete corrected `{top}` module."
)


# ---------- common helpers ----------

_WRITE_LOCK = threading.Lock()


def _emit(result: TaskResult, *, output_path: Path | None) -> None:
    """Write one result to stdout (if `output_path` is None) or append to a JSONL.

    Thread-safe: concurrent workers serialize their appends through a lock so
    lines never interleave.
    """
    line = json.dumps(result)
    if output_path is None:
        with _WRITE_LOCK:
            print(line, flush=True)
    else:
        with _WRITE_LOCK, output_path.open("a") as f:
            f.write(line + "\n")


def _safe_verify(verify, **kw) -> tuple[bool, str]:
    """Catch verifier exceptions so a single bad design doesn't kill the run."""
    try:
        return bool(verify(**kw)), ""
    except Exception as e:
        return False, f"verifier:{type(e).__name__}:{e}"


def _completed_task_ids(output_path: Path | None) -> set[str]:
    """Read an existing output JSONL and return the task_ids already recorded."""
    done: set[str] = set()
    if output_path and output_path.is_file():
        for line in output_path.open():
            line = line.strip()
            if not line:
                continue
            try:
                done.add(json.loads(line)["task_id"])
            except Exception:
                continue
    return done


def _select(records: Iterable[dict], *, offset: int, limit: int | None) -> list[dict]:
    """Materialize records, then apply offset and limit (first-N semantics)."""
    recs = list(records)
    if offset:
        recs = recs[offset:]
    if limit is not None:
        recs = recs[:limit]
    return recs


def _print_progress(i: int, total: int, result: TaskResult) -> None:
    status = "PASS" if result.get("passed") else "FAIL"
    err = f"  ({result['error']})" if result.get("error") else ""
    print(f"[{i}/{total}] {status}  {result.get('task_id', '?')}{err}", file=sys.stderr, flush=True)


def _run_loop(
    records: Iterable[dict],
    process_one: Callable[[dict], TaskResult],
    *,
    output_path: str | Path | None,
    limit: int | None,
    offset: int,
    resume: bool,
    force: bool,
    max_workers: int,
    progress: bool,
) -> list[TaskResult]:
    """Shared driver for all three tasks.

    Handles offset/limit selection, resume (skip task_ids already in the output),
    truncate-vs-append, optional thread-pool concurrency, progress, and emission.
    """
    out = Path(output_path) if output_path else None

    done: set[str] = set()
    if out:
        out.parent.mkdir(parents=True, exist_ok=True)
        if resume and not force and out.is_file():
            done = _completed_task_ids(out)
        else:
            out.write_text("")  # truncate (fresh run or --force)

    work = [r for r in _select(records, offset=offset, limit=limit) if r["task_id"] not in done]
    total = len(work)
    collected: list[TaskResult] = []

    if max_workers <= 1:
        for i, rec in enumerate(work, 1):
            result = process_one(rec)
            _emit(result, output_path=out)
            collected.append(result)
            if progress:
                _print_progress(i, total, result)
    else:
        with ThreadPoolExecutor(max_workers=max_workers) as ex:
            futures = {ex.submit(process_one, rec): rec for rec in work}
            for i, fut in enumerate(as_completed(futures), 1):
                result = fut.result()
                _emit(result, output_path=out)
                collected.append(result)
                if progress:
                    _print_progress(i, total, result)

    return collected


# Shared evaluation knobs documented once; every run_taskN accepts these.
_COMMON_DOC = """
    Common evaluation controls (all tasks):
        output_path:   append each result to this JSONL as produced (None = stdout).
        limit:         run only the first N records after offset (None = all).
        offset:        skip the first `offset` records (for sharding/manual resume).
        resume:        skip task_ids already present in output_path (append mode).
        force:         ignore resume and truncate output_path before running.
        max_workers:   number of concurrent LLM+verify workers (default 1 = serial).
        progress:      print a per-design PASS/FAIL line to stderr.
        save_revised_rtl: include the generated RTL in each emitted record.
        max_designs:   deprecated alias for `limit`.
"""


# ---------- Task 1: round-trip reasoning ----------

def run_task1(
    dataset_path: str | Path = "data/slice_01.jsonl",
    *,
    llm: LLMClient,
    verify: Verifier,
    output_path: str | Path | None = None,
    limit: int | None = None,
    offset: int = 0,
    resume: bool = False,
    force: bool = False,
    max_workers: int = 1,
    progress: bool = False,
    spec_length_ratio: float = 1.0,
    save_revised_rtl: bool = False,
    max_designs: int | None = None,
) -> list[TaskResult]:
    """Run round-trip reasoning (RTL -> NL spec -> RTL).

    spec_length_ratio: max NL-spec tokens / RTL tokens (paper uses 1.0).
    """ + _COMMON_DOC
    if max_designs is not None and limit is None:
        limit = max_designs

    def process_one(rec: Task1Record) -> TaskResult:
        result: TaskResult = {"task_id": rec["task_id"], "verification_type": rec["verification_type"]}
        try:
            spec_budget = max(256, min(int(count_tokens(rec["rtl"]) * spec_length_ratio), 4096))
            spec = llm(T1_SPEC_USER.format(rtl=rec["rtl"]), system=T1_SPEC_SYSTEM, max_tokens=spec_budget)
            revised_raw = llm(T1_REGEN_USER.format(top=rec["top_module"], spec=spec),
                              system=T1_REGEN_SYSTEM, max_tokens=8192)
            revised_rtl = extract_verilog(revised_raw)
            result["intermediate_tokens"] = count_tokens(spec)
            if save_revised_rtl:
                result["revised_rtl"] = revised_rtl
            passed, err = _safe_verify(
                verify, golden_rtl=rec["rtl"], revised_rtl=revised_rtl,
                top_module=rec["top_module"], design_type=rec["design_type"],
                extra_files=rec["extra_files"],
            )
            result["passed"] = passed
            if err:
                result["error"] = err
        except Exception as e:
            result["passed"] = False
            result["error"] = f"runner:{type(e).__name__}:{e}"
        return result

    return _run_loop(
        load_task1(dataset_path), process_one,
        output_path=output_path, limit=limit, offset=offset,
        resume=resume, force=force, max_workers=max_workers, progress=progress,
    )


# ---------- Task 2: masked-content reasoning ----------

def run_task2(
    dataset_path: str | Path = "data/masked_designs.jsonl",
    *,
    llm: LLMClient,
    verify: Verifier,
    output_path: str | Path | None = None,
    limit: int | None = None,
    offset: int = 0,
    resume: bool = False,
    force: bool = False,
    max_workers: int = 1,
    progress: bool = False,
    description_ratio: float = 0.2,
    save_revised_rtl: bool = False,
    max_designs: int | None = None,
) -> list[TaskResult]:
    """Run masked-content reasoning. Two-step: describe → recover → splice.

    description_ratio: max description tokens / masked-block tokens.
    """ + _COMMON_DOC
    if max_designs is not None and limit is None:
        limit = max_designs

    def process_one(rec: Task2Record) -> TaskResult:
        result: TaskResult = {"task_id": rec["task_id"], "verification_type": rec["verification_type"]}
        try:
            desc_budget = max(64, int(count_tokens(rec["ref_block"]) * description_ratio))
            description = llm(T2_DESC_USER.format(masked_rtl=rec["masked_rtl"], ref_block=rec["ref_block"]),
                              system=T2_DESC_SYSTEM, max_tokens=desc_budget)
            recovered_raw = llm(T2_RECOVER_USER.format(masked_rtl=rec["masked_rtl"], description=description),
                                system=T2_RECOVER_SYSTEM, max_tokens=4096)
            recovered_block = extract_verilog(recovered_raw)
            reconstructed = rec["masked_rtl"].replace("[MASKED]", recovered_block, 1)
            result["intermediate_tokens"] = count_tokens(description)
            if save_revised_rtl:
                result["revised_rtl"] = reconstructed
            passed, err = _safe_verify(
                verify, golden_rtl=rec["golden_rtl"], revised_rtl=reconstructed,
                top_module=rec["top_module"], design_type=rec["design_type"],
                extra_files=rec["extra_files"],
            )
            result["passed"] = passed
            if err:
                result["error"] = err
        except Exception as e:
            result["passed"] = False
            result["error"] = f"runner:{type(e).__name__}:{e}"
        return result

    return _run_loop(
        load_task2(dataset_path), process_one,
        output_path=output_path, limit=limit, offset=offset,
        resume=resume, force=force, max_workers=max_workers, progress=progress,
    )


# ---------- Task 3: repository-issue fixing ----------

def run_task3(
    dataset_path: str | Path = "data/repo_issue_108_cases.json",
    *,
    llm: LLMClient,
    verify: Verifier,
    fetch_buggy_rtl: Callable[[dict], str],
    fetch_golden_fix: Callable[[dict], str],
    output_path: str | Path | None = None,
    limit: int | None = None,
    offset: int = 0,
    resume: bool = False,
    force: bool = False,
    max_workers: int = 1,
    progress: bool = False,
    save_revised_rtl: bool = False,
    max_designs: int | None = None,
) -> list[TaskResult]:
    """Run repo-issue fixing.

    Task 3 needs two user-supplied fetchers because the buggy RTL and golden
    fix live in upstream GitHub repositories at specific commits — they aren't
    inlined in the dataset.

        fetch_buggy_rtl(case)  -> str:  buggy Verilog at case["base_commit"].
        fetch_golden_fix(case) -> str:  post-fix Verilog at case["head_commit"].

    `rtlbenchls.make_fetchers(cache_dir="repo_cache")` returns ready-to-use
    fetchers backed by the local clone produced by scripts/clone_repos.py.
    """ + _COMMON_DOC
    if max_designs is not None and limit is None:
        limit = max_designs

    def process_one(rec: Task3Record) -> TaskResult:
        result: TaskResult = {"task_id": rec["task_id"]}
        try:
            buggy = fetch_buggy_rtl(rec)
            golden = fetch_golden_fix(rec)
            top = _detect_top(buggy) or "top_module"
            fix_raw = llm(
                T3_FIX_USER.format(issue_title=rec["issue_title"], issue_body=rec["issue_body"],
                                   buggy_rtl=buggy, top=top),
                system=T3_FIX_SYSTEM, max_tokens=16384,
            )
            fixed_rtl = extract_verilog(fix_raw)
            design_type = "sequential" if _looks_sequential(fixed_rtl) else "combinational"
            result["verification_type"] = "SEC" if design_type == "sequential" else "LEC"
            if save_revised_rtl:
                result["revised_rtl"] = fixed_rtl
            passed, err = _safe_verify(
                verify, golden_rtl=golden, revised_rtl=fixed_rtl,
                top_module=top, design_type=design_type, extra_files={},
            )
            result["passed"] = passed
            if err:
                result["error"] = err
        except Exception as e:
            result["passed"] = False
            result["error"] = f"runner:{type(e).__name__}:{e}"
        return result

    return _run_loop(
        load_task3(dataset_path), process_one,
        output_path=output_path, limit=limit, offset=offset,
        resume=resume, force=force, max_workers=max_workers, progress=progress,
    )


def _detect_top(rtl: str) -> str | None:
    import re
    m = re.search(r"\bmodule\s+(\w+)", rtl)
    return m.group(1) if m else None


def _looks_sequential(rtl: str) -> bool:
    return ("posedge" in rtl) or ("negedge" in rtl)
