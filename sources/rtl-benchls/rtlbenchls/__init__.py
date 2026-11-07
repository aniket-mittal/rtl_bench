"""RTL-BenchLS evaluation framework.

Public API:
    from rtlbenchls import run_task1, run_task2, run_task3, aggregate

User-supplied callables:
    llm(prompt, *, system="", max_tokens=4096, temperature=0.0) -> str
    verify(golden_rtl, revised_rtl, top_module, *, design_type, extra_files={}) -> bool

See `tasks/task1_round_trip/example_run.py` for a minimal end-to-end example.
"""
from rtlbenchls.runner import run_task1, run_task2, run_task3
from rtlbenchls.protocols import LLMClient, Verifier, TaskResult
from rtlbenchls.dataset import load_task1, load_task2, load_task3
from rtlbenchls.aggregate import aggregate
from rtlbenchls.verify_noop import verify_noop
from rtlbenchls.fetch_repo import make_fetchers

__all__ = [
    "run_task1", "run_task2", "run_task3",
    "LLMClient", "Verifier", "TaskResult",
    "load_task1", "load_task2", "load_task3",
    "aggregate",
    "verify_noop",
    "make_fetchers",
]
