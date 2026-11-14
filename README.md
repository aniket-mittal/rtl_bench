# rtl_bench

RTL tasks for TrainRTL: an agent gets a spec and starter Verilog, edits it, runs public tests, and is graded by hidden
tests plus Yosys formal equivalence against a reference.

```
rtl_bench/
  tasks/      the tasks, one folder each, grouped by source (spec.md, starter .v, public_tb.v, hidden_tb.v, reference.v, task.json)
  taskgen/    everything that builds tasks: the LLM bug-injection generator (forked from liveverilogeval) and
              harness/, which converts every source into the task format, validates tasks, and grades submissions
  sources/    the open-source designs and benchmarks tasks are built from, each with its upstream license
```

- `tasks/README.md`: the task format, task kinds, and how to grade a submission.
- `taskgen/README.md`: how tasks are generated and how to regenerate or add them.
- `sources/README.md`: where each design collection comes from, its license, and the pinned commit.

## Quick start

```bash
brew install yosys icarus-verilog
python3 taskgen/harness/grade.py tasks/<group>/<task> <dir with your edited files>
```

The harness is standard-library Python. Only the LLM generator needs `taskgen/requirements.txt`.

## Credits

`taskgen/` is adapted from [agctute/liveverilogeval](https://github.com/agctute/liveverilogeval). Task sources:
[RTL-BenchLS](https://github.com/hkust-zhiyao/RTL-BenchLS), [RTLLM](https://github.com/hkust-zhiyao/RTLLM),
[verilog-eval](https://github.com/NVlabs/verilog-eval), and the open-source cores listed in `sources/README.md`.
Each task's `task.json` records its source and license.
