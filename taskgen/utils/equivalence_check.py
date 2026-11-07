# Credit goes to Yubeaton et al. for some initial functions in this file, source: https://github.com/wilyub/VeriThoughts
"""
Formal equivalence checking with Yosys.

Each check builds a miter between two designs and runs SAT-based temporal
induction (`sat -tempinduct`). The base case of induction is a bounded model
check from the all-zero initial state, so a single run gives one of:

    EQUIVALENT  induction step proven: equivalent for every reachable cycle
    BOUNDED     no counterexample within `max_steps`, but induction did not close
                (common when two correct designs encode internal state differently)
    DIFFERENT   counterexample found: the designs really behave differently
    UNKNOWN     Yosys timed out
    ERROR       a design failed to parse/elaborate, or Yosys crashed

Only EQUIVALENT is a proof. BOUNDED is strong evidence but not a proof; callers
decide whether to accept it (see `accept_bounded`). Timeouts are never treated
as equivalent.

Note on steps: `clk2fflogic` models each clock edge as its own SAT step, so
`max_steps` of N covers roughly N/2 clock cycles.
"""
import asyncio
import os
import re
import uuid
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import List, Optional

from utils.config import Config

DEFAULT_MAX_STEPS = 60      # SAT steps (about 30 clock cycles)
DEFAULT_TIMEOUT_S = 120
DEFAULT_YOSYS_BIN = os.environ.get("YOSYS_BIN", "yosys")


class EquivStatus(str, Enum):
    EQUIVALENT = "equivalent"
    BOUNDED = "bounded"
    DIFFERENT = "different"
    UNKNOWN = "unknown"
    ERROR = "error"


# Worst outcome wins when combining per-module results.
_SEVERITY = {
    EquivStatus.EQUIVALENT: 0,
    EquivStatus.BOUNDED: 1,
    EquivStatus.UNKNOWN: 2,
    EquivStatus.ERROR: 3,
    EquivStatus.DIFFERENT: 4,
}


@dataclass
class EquivResult:
    status: EquivStatus
    per_module: List[EquivStatus] = field(default_factory=list)
    detail: str = ""

    def is_equivalent(self, accept_bounded: bool = False) -> bool:
        if self.status == EquivStatus.EQUIVALENT:
            return True
        return accept_bounded and self.status == EquivStatus.BOUNDED

    @property
    def is_different(self) -> bool:
        return self.status == EquivStatus.DIFFERENT


def equiv_settings(config: Optional[Config]) -> dict:
    """Read equivalence-check settings from a Config, with defaults."""
    return {
        "max_steps": getattr(config, "equiv_max_steps", DEFAULT_MAX_STEPS),
        "timeout_s": getattr(config, "equiv_timeout_s", DEFAULT_TIMEOUT_S),
        "yosys_bin": getattr(config, "yosys_bin", DEFAULT_YOSYS_BIN),
    }


def rename_modules_and_instantiations(verilog_code, obscure_names: bool = False):
    # Step 1: Find all module names (including those with parameters using #(...))
    module_pattern = re.compile(r'\bmodule\s+(\w+)\s*(?:#\s*\(.*?\))?\s*\(', re.DOTALL)
    module_names = module_pattern.findall(verilog_code)

    # Step 2: Create a mapping from old to new names
    if obscure_names:
        rename_map = {}
        for i in range(len(module_names)):
            if i == 0:
                rename_map[module_names[i]] = 'dut'
            else:
                rename_map[module_names[i]] = 'dut_dependency_' + str(i+1)
    else:
        rename_map = {name: 'dut_' + name for name in module_names}
    
    # Step 3: Replace module declarations
    def replace_module_decl(match):
        original_name = match.group(1)
        before = match.group(0)
        return before.replace(original_name, rename_map[original_name], 1)

    verilog_code = module_pattern.sub(replace_module_decl, verilog_code)

    # Step 4: Replace module instantiations (word boundaries)
    for old_name, new_name in rename_map.items():
        instantiation_pattern = re.compile(rf'\b{old_name}\b')
        verilog_code = instantiation_pattern.sub(new_name, verilog_code)

    return verilog_code, rename_map


def _classify(returncode: int, output: str) -> EquivStatus:
    """Map Yosys output from a `sat -tempinduct -verify` run to a status."""
    if "Induction step proven: SUCCESS!" in output:
        return EquivStatus.EQUIVALENT
    if "model found for base case: FAIL!" in output:
        return EquivStatus.DIFFERENT
    if "Reached maximum number of time steps" in output:
        return EquivStatus.BOUNDED
    if returncode == 0:
        # sat exited cleanly without any recognised verdict; do not guess.
        return EquivStatus.UNKNOWN
    return EquivStatus.ERROR


def _error_excerpt(output: str) -> str:
    lines = [l for l in output.splitlines() if "ERROR" in l]
    return lines[-1].strip() if lines else ""


async def _run_yosys(script_path: Path, yosys_bin: str, timeout_s: float):
    process = await asyncio.create_subprocess_exec(
        yosys_bin, "-s", str(script_path),
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.STDOUT,
        stdin=asyncio.subprocess.DEVNULL,
    )
    try:
        stdout, _ = await asyncio.wait_for(process.communicate(), timeout=timeout_s)
    except asyncio.TimeoutError:
        process.kill()
        await process.wait()
        return None, ""
    return process.returncode, stdout.decode(errors="replace")


async def check_equivalence_detailed(
    batch_file_path: str,
    initial_code: str,
    ground_truth: str,
    max_steps: int = DEFAULT_MAX_STEPS,
    timeout_s: float = DEFAULT_TIMEOUT_S,
    yosys_bin: str = DEFAULT_YOSYS_BIN,
) -> EquivResult:
    """Formally compare `initial_code` against `ground_truth` and return an EquivResult."""
    batch_dir = Path(batch_file_path)
    batch_dir.mkdir(parents=True, exist_ok=True)
    instance_id = uuid.uuid4().hex[:8]
    gen_path = batch_dir / f"verilog_gen_{instance_id}.sv"
    truth_path = batch_dir / f"verilog_truth_{instance_id}.sv"
    script_path = batch_dir / f"equivalence_check_{instance_id}.ys"

    gen_code, _ = rename_modules_and_instantiations(initial_code, obscure_names=True)
    golden, _ = rename_modules_and_instantiations(ground_truth, obscure_names=True)
    golden, module_map = rename_modules_and_instantiations(golden)

    if not module_map:
        return EquivResult(EquivStatus.ERROR, detail="no module found in ground truth")

    gen_path.write_text(gen_code, encoding="utf-8")
    truth_path.write_text(golden, encoding="utf-8")

    per_module: List[EquivStatus] = []
    details: List[str] = []
    try:
        for gate_name, gold_name in module_map.items():
            script = (
                f"read_verilog -sv {truth_path}\n"
                f"read_verilog -sv {gen_path}\n"
                "prep; proc; opt; memory;\n"
                "clk2fflogic;\n"
                f"miter -equiv -flatten {gold_name} {gate_name} miter\n"
                "hierarchy -top miter\n"
                f"sat -tempinduct -verify -prove trigger 0 -set-init-zero -maxsteps {max_steps} miter\n"
            )
            script_path.write_text(script)
            try:
                rc, output = await _run_yosys(script_path, yosys_bin, timeout_s)
            except Exception as e:  # e.g. yosys binary missing
                per_module.append(EquivStatus.ERROR)
                details.append(f"{gate_name}: could not run yosys: {e}")
                continue
            if rc is None:
                per_module.append(EquivStatus.UNKNOWN)
                details.append(f"{gate_name}: timeout after {timeout_s}s")
                continue
            status = _classify(rc, output)
            per_module.append(status)
            if status == EquivStatus.ERROR:
                details.append(f"{gate_name}: {_error_excerpt(output)}")
    finally:
        for p in (gen_path, truth_path, script_path):
            try:
                p.unlink(missing_ok=True)
            except OSError:
                pass

    overall = max(per_module, key=lambda s: _SEVERITY[s])
    return EquivResult(overall, per_module, "; ".join(details))


async def check_equivalence(
    batch_file_path: str,
    initial_code: str,
    ground_truth: str,
    accept_bounded: bool = False,
    **kwargs,
) -> bool:
    """
    Backwards-compatible boolean wrapper. True only if the designs are proven
    equivalent (or, with accept_bounded=True, if no counterexample was found
    within the step bound). Timeouts and errors are False.
    """
    result = await check_equivalence_detailed(batch_file_path, initial_code, ground_truth, **kwargs)
    return result.is_equivalent(accept_bounded)


async def check_elaborates(
    batch_file_path: str,
    code: str,
    timeout_s: float = DEFAULT_TIMEOUT_S,
    yosys_bin: str = DEFAULT_YOSYS_BIN,
    **_ignored,
) -> EquivResult:
    """
    Cheap structural check: does the design parse and elaborate in Yosys?
    Returns EQUIVALENT on success (meaning "ok"), ERROR or UNKNOWN otherwise.
    Use this, not a self-equivalence proof, to decide whether code is usable:
    a design is not always *provable* against itself by induction (hidden state
    in the two miter copies can start out different), and that says nothing
    about whether it compiles.
    """
    batch_dir = Path(batch_file_path)
    batch_dir.mkdir(parents=True, exist_ok=True)
    instance_id = uuid.uuid4().hex[:8]
    code_path = batch_dir / f"verilog_elab_{instance_id}.sv"
    script_path = batch_dir / f"elaborate_{instance_id}.ys"
    renamed, _ = rename_modules_and_instantiations(code, obscure_names=True)
    code_path.write_text(renamed, encoding="utf-8")
    script_path.write_text(f"read_verilog -sv {code_path}\nhierarchy -check -top dut\nprep -top dut\n")
    try:
        rc, output = await _run_yosys(script_path, yosys_bin, timeout_s)
    except Exception as e:
        return EquivResult(EquivStatus.ERROR, detail=f"could not run yosys: {e}")
    finally:
        for p in (code_path, script_path):
            p.unlink(missing_ok=True)
    if rc is None:
        return EquivResult(EquivStatus.UNKNOWN, detail="timeout")
    if rc != 0:
        return EquivResult(EquivStatus.ERROR, detail=_error_excerpt(output))
    return EquivResult(EquivStatus.EQUIVALENT)


async def yosys_sanity_check(batch_file_path: str, code: str, **kwargs) -> bool:
    """True if the design parses and elaborates in Yosys."""
    result = await check_elaborates(batch_file_path, code, **kwargs)
    return result.status == EquivStatus.EQUIVALENT


async def test_check_equivalence(config_path: str = "config.yaml"):
    """
    Run each verified RTLLM design against itself. Every design should elaborate
    and never come back DIFFERENT; BOUNDED is expected for designs with hidden
    state, and UNKNOWN means the step bound or timeout was too small.
    """
    config = Config(config_path)
    settings = equiv_settings(config)
    rtllm_dir = Path("../sources/rtllm").absolute()
    total, counts = 0, {}
    for design_dir in sorted(rtllm_dir.iterdir()):
        verified_file = design_dir / f"verified_{design_dir.name}.v"
        if not verified_file.exists():
            continue
        total += 1
        code = verified_file.read_text()
        result = await check_equivalence_detailed(config.batch_dir_path, code, code, **settings)
        counts[result.status] = counts.get(result.status, 0) + 1
        print(f"{design_dir.name:28s} {result.status.value:10s} {result.detail}", flush=True)
    print("\n" + ", ".join(f"{s.value}: {n}" for s, n in counts.items()) + f" (of {total})")
    return EquivStatus.DIFFERENT not in counts and EquivStatus.ERROR not in counts


if __name__ == "__main__":
    asyncio.run(test_check_equivalence())
