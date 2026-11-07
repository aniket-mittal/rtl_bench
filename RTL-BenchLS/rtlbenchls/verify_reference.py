"""Reference verifier — adapt to your EDA setup.

This module shows the integration pattern for wiring formal-equivalence
backends (Cadence Conformal LEC, Synopsys Formality, Cadence JasperGold SEC)
into the framework. The example invocations below run the tools locally via
subprocess; for a remote SSH server or Docker container, replace those
subprocess calls with your transport (see docs/formal_verification.md).

This module is OPTIONAL. The default `verify_noop` from `verify_noop.py`
is sufficient for development. Wire your own backend before measuring
real LLM accuracy.
"""
from __future__ import annotations
import os
import shutil
import subprocess
import tempfile
from pathlib import Path
from typing import Literal, Mapping


def verify_reference(
    golden_rtl: str,
    revised_rtl: str,
    top_module: str,
    *,
    design_type: Literal["combinational", "sequential"],
    extra_files: Mapping[str, str] = {},
    timeout: int = 600,
) -> bool:
    """Run LEC (combinational) or SEC (sequential) and return pass/fail.

    Uses the embedded `conformal_rtl_<top>.do` / `sec_<top>.tcl` script if one
    is present under `extra_files`; falls back to a minimal generated script.
    """
    with tempfile.TemporaryDirectory(prefix=f"rtlbenchls_{top_module}_") as td:
        work = Path(td)
        golden_path = work / "golden.v"
        revised_path = work / "revised.v"
        golden_path.write_text(golden_rtl)
        revised_path.write_text(revised_rtl)

        # Drop any auxiliary files (lib.v, source manifest) into the work dir.
        for name, content in extra_files.items():
            if name.endswith(".v") or name == "lib.v":
                (work / name).write_text(content)

        if design_type == "sequential":
            return _run_sec(work, top_module, extra_files, timeout)
        return _run_lec(work, top_module, extra_files, timeout)


# ---------- Conformal LEC (combinational) ----------

def _run_lec(work: Path, top: str, extra: Mapping[str, str], timeout: int) -> bool:
    """Run Cadence Conformal LEC. Replace with Formality if that's your flow."""
    # Pick or generate a dofile.
    do_key = next((k for k in extra if k.startswith("conformal_rtl_") and k.endswith(".do")), None)
    if do_key:
        dofile = work / "conformal_rtl.do"
        dofile.write_text(extra[do_key])
    else:
        dofile = work / "conformal_rtl.do"
        dofile.write_text(_minimal_conformal_dofile(top))

    lec_bin = os.environ.get("CONFORMAL_LEC", shutil.which("lec"))
    if not lec_bin:
        raise RuntimeError("Conformal LEC not found. Set $CONFORMAL_LEC or add `lec` to PATH.")

    log_path = work / "lec.log"
    proc = subprocess.run(
        [lec_bin, "-nogui", "-dofile", "conformal_rtl.do"],
        cwd=work, stdin=subprocess.DEVNULL,
        capture_output=True, text=True, timeout=timeout,
    )
    log_path.write_text(proc.stdout + proc.stderr)
    return _parse_lec_log(log_path)


def _minimal_conformal_dofile(top: str) -> str:
    return f"""\
read design golden.v -verilog2k -golden -top {top}
read design revised.v -verilog2k -revised -top {top}
add compared points -all
compare
report verification
exit -force
"""


def _parse_lec_log(log: Path) -> bool:
    """Look for Conformal's "Equivalent" / "0 non-equivalent" summary."""
    if not log.is_file():
        return False
    text = log.read_text(errors="replace").lower()
    # Match only the summary section, not progress lines.
    return ("equivalent" in text) and ("non-equivalent" not in text or "0 non-equivalent" in text)


# ---------- JasperGold SEC (sequential) ----------

def _run_sec(work: Path, top: str, extra: Mapping[str, str], timeout: int) -> bool:
    """Run Cadence JasperGold SEC."""
    tcl_key = next((k for k in extra if k.startswith("sec_") and k.endswith(".tcl")), None)
    if tcl_key:
        tcl = work / "sec.tcl"
        tcl.write_text(extra[tcl_key])
    else:
        tcl = work / "sec.tcl"
        tcl.write_text(_minimal_sec_tcl(top))

    jg_bin = os.environ.get("JASPERGOLD_BIN", shutil.which("jaspergold"))
    if not jg_bin:
        raise RuntimeError("JasperGold not found. Set $JASPERGOLD_BIN or add `jaspergold` to PATH.")

    log_path = work / "sec.log"
    proc = subprocess.run(
        [jg_bin, "-sec", "-batch", "-tcl", "sec.tcl"],
        cwd=work, stdin=subprocess.DEVNULL,
        capture_output=True, text=True, timeout=timeout,
    )
    log_path.write_text(proc.stdout + proc.stderr)
    return _parse_sec_log(log_path)


def _minimal_sec_tcl(top: str) -> str:
    return f"""\
analyze -sv09 golden.v -spec
analyze -sv09 revised.v -impl
elaborate -top {top}
clock -auto
reset -auto
check_sec -prove -strategy proof
exit
"""


def _parse_sec_log(log: Path) -> bool:
    """JasperGold prints a literal `proven` line on success."""
    if not log.is_file():
        return False
    for line in log.read_text(errors="replace").splitlines():
        if line.strip() == "proven":
            return True
    return False
