# tasks

One folder per RTL task for an agent, grouped by where the task came from. `index.jsonl` lists every task (path,
kind, difficulty, top module, sequential or not, verification, source).

```
generated/           repair-<design>-bug<k>, spec2rtl-<design>-bug<k>   taskgen: an LLM-injected bug; the spec describes the bugged variant
verilog-eval/        spec2rtl-<problem>                                  verilog-eval problem statements
rtllm/               spec2rtl-<design>                                   RTLLM design descriptions
github-issues/       repair-<repo>-pr<n>                                 real bug fixes from GitHub (RTL-BenchLS Task 3)
benchls-<dataset>/   infill-<name>-<number>                              RTL-BenchLS designs with one block masked (Task 1 and 2), split by upstream
                                                                          dataset: origen, rtlpp, mgverilog, autovcoder, github. Upstream renamed most
                                                                          modules to row ids, so <name> was written by Claude from the code; <number>
                                                                          is the upstream id (full id in task.json)
```

## Inside a task

```
<task>/
  spec.md        what the module must do, which file to edit, the interface, how to run the public tests
  <module>.v     starter code: buggy design (repair), design with a [MASKED] region (infill), or port skeleton (spec2rtl)
  lib.v ...      read-only support files, when the design needs them
  public_tb.v    public tests: self-checking testbench with inputs and expected outputs written in
  hidden_tb.v    hidden tests (verifier only): submission and reference side by side on 5000 cycles of seeded random inputs
  reference.v    correct solution (verifier only)
  task.json      top module, interface, editable / read-only / hidden files, tools, step and time limits, grading, provenance
```

Give the agent only the files in `task.json` `files.agent`: `spec.md`, the starter and read-only `.v` files, and
`public_tb.v`. Keep `hidden_tb.v`, `reference.v` and `task.json` itself on the grader side; `task.json` provenance
names the injected bug. The agent edits the files in `files.editable` and can run the public tests itself:

```bash
iverilog -g2012 -s tb -o sim public_tb.v <module>.v [lib.v] && vvp sim     # prints PASS, or MISMATCH lines and FAIL
```

## Grading

```bash
python3 taskgen/harness/grade.py tasks/<group>/<task> <submission dir>
```

`<submission dir>` holds the agent's edited files. The grader prints JSON. `reward` is 1 only when the design
compiles, `public_tb.v` and `hidden_tb.v` both print PASS, and Yosys proves the design equivalent to the reference
(`sat -tempinduct`; `bounded` counts when `accept_bounded` is true, a timeout never counts). It also reports the
synthesized cell count, for area work. Every task was checked when it was built: its reference scores reward 1, and a
repair starter scores 0.

## Kinds

`spec2rtl` in folder names is `spec_to_rtl` in `task.json`.

| kind | starter | the agent must | from |
|---|---|---|---|
| `repair` | design that disagrees with the spec | fix it to match `spec.md` | `verilog-eval` / other open-source designs mutated by `taskgen` (the spec describes the mutated behavior, the starter is the original), RTL-BenchLS GitHub issue fixes (`github-issues/`) |
| `spec_to_rtl` | port skeleton | write the module from `spec.md` | `taskgen` specs, RTLLM and verilog-eval problem statements |
| `infill` | design with one block replaced by `[MASKED]` | fill it in so the design does what it evidently should | RTL-BenchLS designs (`benchls-*/`) |

`grading.verification` is `formal` for almost every task. It is `sim_only` when Yosys cannot finish the formal check
even on the reference against itself; those tasks are graded by the two testbenches alone.

`difficulty` is set only for `generated/` tasks, from the solve rate of the validation model (Haiku): easy >= 0.75,
medium >= 0.4, hard < 0.4. Everything else is `unknown`.

Provenance (source file, upstream license, generator, bug type, commits) is in each `task.json`. Do not hand-edit
task folders; regenerate them with `taskgen/harness/` (see `taskgen/README.md`).
