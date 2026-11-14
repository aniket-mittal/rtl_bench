# Standard RTL task format (schema_version 1)

Every task, whatever its source, is **one JSON file**. It holds everything: the spec the agent reads,
the starter Verilog, which files the agent may edit, the public tests, and the hidden grading data.
`taskgen/harness/rtltask.py` turns a task JSON into an agent workspace (without the hidden part) and grades
a finished workspace against the hidden part. This follows the task contract in `RTLBot_Proposal.txt`
(spec + interfaces, starter RTL + editable files, tools + limits, public tests, hidden checks).

Task files live in `taskgen/build/<suite>/<task_slug>.json`.

## Task JSON

```jsonc
{
  "schema_version": 1,
  "task_id": "open_source/verilog-eval/Prob072_thermostat/mutant_1/repair",  // unique; slug = task_id with "/" -> "__"
  "suite": "open_source",                 // open_source | rtl-benchls
  "kind": "repair",                       // repair | spec_to_rtl | infill  (see Kinds)
  "difficulty": "easy",                   // easy | medium | hard | unknown

  // ---- agent-visible ----
  "spec": "markdown ...",                 // what the hardware must do; written for the agent
  "top_module": "dut",                    // module the grader treats as the design top
  "interface": {                          // ports of top_module (from the reference)
    "clock": "clk",                       // null if purely combinational
    "reset": {"name": "rst_n", "active_low": true},   // null if none
    "inputs":  [{"name": "a", "width": 8}],            // excludes clock; includes reset
    "outputs": [{"name": "y", "width": 8}]
  },
  "files": {"rtl/dut.v": "module dut(...); ... endmodule\n"},   // starter files, path -> text
  "editable": ["rtl/dut.v"],              // paths the agent may change (may include files not in `files`)
  "tools": ["iverilog", "vvp", "yosys"],
  "limits": {"max_agent_steps": 50, "wall_time_s": 1800, "tool_timeout_s": 120},
  "public_tests": {                       // null until `rtltask.py finalize` fills it
    "kind": "vectors",
    "cycles": 64,
    "stimulus": ["0a3", ...],             // one hex word per cycle: all non-clock inputs packed MSB-first in `interface.inputs` order
    "expected": ["1f", ...]               // one hex word per cycle: all outputs packed MSB-first in `interface.outputs` order; "x" digits = don't care
  },

  // ---- hidden (never written into the agent workspace) ----
  "hidden": {
    "reference_files": {"rtl/dut.v": "..."},   // correct solution; same paths as `files`/`editable` where they overlap
    "reference_top": "dut",
    "hidden_vectors": {"cycles": 1000, "seed": 7},        // regenerated at grade time from the reference
    "formal": {"method": "yosys_sat_tempinduct", "max_steps": 60, "timeout_s": 120, "accept_bounded": true}
  },

  "provenance": { ... }                   // source file, license, generator info, bug type, solve rate, etc.
}
```

## Kinds

| kind | starter `files` | agent must | source |
|---|---|---|---|
| `repair` | a design that disagrees with `spec` | edit it until it matches `spec` | open_source: starter = original seed design, reference = mutant the spec describes |
| `spec_to_rtl` | none (or an empty port skeleton) | write `top_module` from `spec` | open_source: same spec + reference, no starter |
| `infill` | design with a `[MASKED]` region | fill the region so the design matches the intended behavior | rtl-benchls Task 2 (masked_designs.jsonl) |

## Workspace (`rtltask.py prepare <task.json> <dir>`)

```
<dir>/
  TASK.md                 spec, interface table, editable files, limits, how to run tests
  rtl/...                 starter files (and any read-only support files such as lib.v)
  tests/public/
      tb.v                generated vector testbench
      stimulus.hex, expected.hex
      run.sh              compiles rtl/ + tb with iverilog, runs vvp, prints PASS or the first mismatches
```

No hidden data (reference, hidden seeds, formal settings) is ever written to the workspace.

## Testbench convention

- One stimulus word per cycle drives every input in `interface.inputs` (packed MSB-first, declaration order).
- Sequential designs: inputs change on the falling edge; outputs are sampled just before the next rising edge.
  Cycle 0..N follow whatever the stimulus says, including the reset input (generators hold reset asserted for the
  first 2 cycles, then randomize it rarely, ~2%).
- Combinational designs: apply stimulus, wait 1 time unit, sample outputs.

## Grading (`rtltask.py grade <task.json> <workspace_dir>`)

Prints one JSON object:

```json
{"task_id": "...", "compiled": true,
 "public":  {"passed": 64,  "total": 64},
 "hidden_vectors": {"passed": 1000, "total": 1000},
 "formal": "equivalent",          // equivalent | bounded | different | unknown | error | skipped
 "correct": true,                 // compiled && all public && all hidden vectors && formal ok
 "reward": 1.0,                   // 1.0 if correct else 0.0
 "synth": {"cells": 42}}          // yosys `synth; stat` cell count of the submission (for area work later)
```

`formal` ok means `equivalent`, or `bounded` when `accept_bounded` is true. `unknown` (timeout) is never ok.

## Validation (`rtltask.py validate <task.json>`)

A task is valid only if: the reference compiles in iverilog and yosys; the reference passes its own public and hidden
tests and formal check; and for `repair`, the starter compiles but fails at least one hidden check.
`rtltask.py finalize` = generate `public_tests` from the reference, then validate.

## Harness behavior and optional extensions (implemented by `rtltask.py`)

These are additions to schema_version 1; no field above changes meaning.

- `editable` entries may be `fnmatch` glob patterns (e.g. `"rtl/*.v"`), so an agent can add helper files.
- Grading builds the submission from the workspace files that match `editable`, plus every non-editable entry of
  `files` restored from the task. Anything else in the workspace (edited read-only files, stray files) is ignored.
  Only `.v`/`.sv` files under `rtl/` are compiled (`iverilog -g2012`, every directory under `rtl/` on the include path).
- The reference design is the non-editable `files` overlaid with `hidden.reference_files`.
- Grade JSON may carry extra optional keys: `compile_log` (first iverilog errors), `formal_detail`, `error`
  (task-level problem). `formal` is `skipped` when the submission did not compile or already failed a vector test.
  `synth.cells` is `null` when Yosys cannot synthesize the submission.
- Formal: reference and submission are elaborated in separate Yosys designs (`design -stash`/`-copy-from`, tops renamed),
  flattened, `memory`, `clk2fflogic`, `miter -equiv -ignore_gold_x`, `sat -tempinduct -set-init-zero`. Yosys
  timeout => `unknown`.
- `finalize` fills defaults when absent: `schema_version`, `difficulty: "unknown"`, `tools`, `limits`,
  `hidden.reference_top = top_module`, `hidden.hidden_vectors = {cycles: 1000, seed: sha256(task_id + "/hidden")}`,
  `hidden.formal` (values shown above). The public seed is the first 8 hex digits of `sha256(task_id)`.
  Public tests are always regenerated (cycles: existing `public_tests.cycles`, else 64, or `--cycles N`).
- Interface discovery (only when `interface` is missing): ports from Yosys `write_json` in declaration order.
  Clock = 1-bit input named like `clk`/`clock`/`i_clk`/`clk_i` (else the input that drives flip-flop clocks).
  Reset = 1-bit input containing `rst`/`reset` (else an async-reset pin of a flip-flop); active-low when the name
  ends in `n`, `_n`, `_ni` or `_b`. `inout` ports are not supported.
- Expected words: reference outputs that are X/Z at a cycle are stored as `x` (per hex digit; a digit with any X/Z
  bit becomes fully don't care). A design with no inputs other than the clock gets stimulus word `"0"` each cycle.
- Extra validation reasons: interface must match the reference ports; public words must have the right hex width;
  public `expected` must not be entirely `x` (such tests check nothing).
- Generated `tb.v` plusargs: `+stim=<file>` (default `stimulus.hex`), `+expected=<file>` (default `expected.hex`),
  `+actual=<file>` (dump sampled outputs), `+nocheck`.
- `finalize-all <dir_or_glob> [--jobs N]` prints `{total, valid, invalid, by_suite, by_kind, invalid_tasks[]}`;
  exit code 1 if any task is invalid. `finalize`/`validate` exit 1 when the task is invalid, 2 on a usage/task error.
