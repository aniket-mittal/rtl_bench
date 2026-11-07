"""Small text utilities shared across tasks."""
from __future__ import annotations
import re


_VERILOG_FENCE = re.compile(
    r"```(?:verilog|systemverilog|sv|v)?\s*\n(.*?)```",
    re.DOTALL | re.IGNORECASE,
)


def extract_verilog(text: str) -> str:
    """Extract a Verilog code block from a possibly-fenced LLM response.

    If the response contains one or more ```verilog ... ``` blocks, returns
    the first one's contents. Otherwise returns the stripped raw text.
    """
    match = _VERILOG_FENCE.search(text)
    return match.group(1).strip() if match else text.strip()


def count_tokens(text: str) -> int:
    """Approximate token count.

    Uses tiktoken's cl100k_base when available; falls back to a 4-chars-per-token
    heuristic. Useful for setting `max_tokens` on the LLM call.
    """
    try:
        import tiktoken  # type: ignore
        enc = tiktoken.get_encoding("cl100k_base")
        return len(enc.encode(text))
    except Exception:
        return max(1, len(text) // 4)


_MODULE_HEADER = re.compile(r"\bmodule\s+(\w+)")


def find_top_module(rtl_text: str, hint: str = "") -> str:
    """Return the top module name. Prefer `hint` if it appears in the RTL."""
    names = _MODULE_HEADER.findall(rtl_text)
    if hint and hint in names:
        return hint
    return names[0] if names else hint
