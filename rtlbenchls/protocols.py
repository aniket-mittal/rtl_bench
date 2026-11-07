"""Typed protocols the user implements."""
from __future__ import annotations
from typing import Protocol, TypedDict, Literal, Mapping


class LLMClient(Protocol):
    """A text-completion callable.

    Implementations may wrap any provider (OpenAI, Anthropic, vLLM, local HF, ...).
    The framework calls this with the prompt and keyword arguments; the implementation
    decides retries, rate-limiting, and provider-specific options.
    """

    def __call__(
        self,
        prompt: str,
        *,
        system: str = "",
        max_tokens: int = 4096,
        temperature: float = 0.0,
    ) -> str: ...


class Verifier(Protocol):
    """A formal-equivalence backend (LEC for combinational, SEC for sequential).

    Receives the golden and revised RTL as strings, the top module name, the
    design type, and any extra files (lib.v, embedded TCL/DO scripts) carried
    by the dataset record. Returns True iff the two designs are proven equivalent.

    The framework treats False as "fail" and any exception as "fail with error".
    """

    def __call__(
        self,
        golden_rtl: str,
        revised_rtl: str,
        top_module: str,
        *,
        design_type: Literal["combinational", "sequential"],
        extra_files: Mapping[str, str] = ...,
    ) -> bool: ...


class TaskResult(TypedDict, total=False):
    """One row of a per-task per-design JSONL output.

    The schema matches `results/task_<n>/<model>.jsonl` so downstream
    aggregators (e.g. `aggregate()`) can consume both.
    """
    task_id: str
    passed: bool
    verification_type: str           # "LEC" | "SEC" | "missing"
    error: str                       # populated on exceptions; empty otherwise
    intermediate_tokens: int         # NL spec / description token count (Task 1, 2)
    revised_rtl: str                 # the LLM's final RTL (optional; off by default)
