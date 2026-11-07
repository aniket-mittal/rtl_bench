"""Default RTL fetchers for Task 3.

Task 3 cases reference real GitHub PRs: the buggy RTL lives at
`case["base_commit"]` and the golden fix at `case["head_commit"]`. The
release ships per-case metadata, not the RTL itself — users run
`scripts/clone_repos.py` once to populate `repo_cache/` (gitignored), then
use the fetchers here to extract the buggy and golden files.

Usage:
    from rtlbenchls import run_task3
    from rtlbenchls.fetch_repo import make_fetchers
    fetch_buggy, fetch_golden = make_fetchers(cache_dir="repo_cache")
    run_task3("data/repo_issue_108_cases.json",
              llm=my_llm, verify=my_verify,
              fetch_buggy_rtl=fetch_buggy, fetch_golden_fix=fetch_golden,
              output_path="results/task_3_repo_issue/my-model.jsonl")
"""
from __future__ import annotations
import subprocess
from pathlib import Path
from typing import Callable


def _slug(repository: str) -> str:
    return repository.replace("/", "_")


def _git_show(repo_dir: Path, commit: str, path: str) -> str:
    """Return the file contents at the given commit. Raises on missing commit/path."""
    res = subprocess.run(
        ["git", "-C", str(repo_dir), "show", f"{commit}:{path}"],
        capture_output=True, text=True,
    )
    if res.returncode != 0:
        raise FileNotFoundError(
            f"git show failed for {repo_dir.name}@{commit[:8]}:{path}: {res.stderr.strip()}"
        )
    return res.stdout


def make_fetchers(cache_dir: str | Path = "repo_cache") -> tuple[Callable, Callable]:
    """Return (fetch_buggy_rtl, fetch_golden_fix) bound to a local cache dir.

    Both fetchers look up `repo_cache/<owner>_<repo>/`, find the file listed
    in `case["verilog_files"][0]`, and `git show` it at the appropriate commit.
    For cases with multiple `verilog_files`, the buggy/golden are concatenated
    in listed order so the LLM and the verifier see the same composite text.

    If your case data has a different verilog-file shape (e.g., per-module
    splits), write your own fetchers using `_git_show` as a primitive.
    """
    cache = Path(cache_dir).resolve()

    def fetch_buggy_rtl(case: dict) -> str:
        return _read_files(case, cache, case["base_commit"])

    def fetch_golden_fix(case: dict) -> str:
        return _read_files(case, cache, case["head_commit"])

    return fetch_buggy_rtl, fetch_golden_fix


def _read_files(case: dict, cache: Path, commit: str) -> str:
    repo_dir = cache / _slug(case["repository"])
    if not repo_dir.is_dir():
        raise FileNotFoundError(
            f"Repo cache missing for {case['repository']}. "
            f"Run `python scripts/clone_repos.py` first."
        )
    files = case.get("verilog_files", [])
    if not files:
        raise ValueError(f"case {case.get('task_id')} has no verilog_files")
    chunks = []
    for path in files:
        try:
            chunks.append(_git_show(repo_dir, commit, path))
        except FileNotFoundError:
            # File may have been added/removed in the PR; skip silently.
            continue
    if not chunks:
        raise FileNotFoundError(
            f"None of {files} resolvable at {commit[:8]} in {repo_dir.name}."
        )
    return "\n".join(chunks)
