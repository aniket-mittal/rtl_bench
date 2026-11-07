"""A no-op verifier that always returns True.

Useful for:
  - Smoke-testing the framework without an EDA setup.
  - Measuring LLM throughput / token cost in isolation.
  - CI runs where formal tools are unavailable.

Substitute with your own verifier for real evaluation. See
`rtlbenchls.protocols.Verifier` for the expected signature, and
`rtlbenchls/verify_reference.py` for a wired-up template.
"""
from __future__ import annotations
from typing import Literal, Mapping


def verify_noop(
    golden_rtl: str,
    revised_rtl: str,
    top_module: str,
    *,
    design_type: Literal["combinational", "sequential"],
    extra_files: Mapping[str, str] = {},
) -> bool:
    """Always returns True. Use only for development."""
    return True
