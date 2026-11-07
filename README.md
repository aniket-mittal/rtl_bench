# rtl_bench

Task generation for TrainRTL: turns open-source RTL into repair and optimization tasks. The grader and RL environment live elsewhere.

```
rtl_bench/
  taskgen/    task generator (adapted from liveverilogeval)
  sources/    seed designs and reference benchmarks, each with its license
  tasks/      generated tasks (format still being defined)
```

- `taskgen/` takes verified Verilog designs, injects bugs with an LLM, and uses Yosys to check that each bug really changes behavior. See `taskgen/README.md`.
- `sources/` holds the designs tasks are built from: RTLLM, verilog-eval, basic_verilog, UART, I2C, SHA-256, AES, SERV, PicoRV32, and the RTL-BenchLS benchmark. See `sources/README.md`.

## Setup

```bash
brew install yosys icarus-verilog verilator
python3 -m venv .venv
.venv/bin/pip install -r taskgen/requirements.txt
cd taskgen && ../.venv/bin/python -W ignore test_pipeline_offline.py   # offline smoke test
```

## Credits

- `taskgen/` is adapted from [agctute/liveverilogeval](https://github.com/agctute/liveverilogeval).
- `sources/rtllm/` is from [RTLLM](https://github.com/hkust-zhiyao/RTLLM).
- `sources/rtl-benchls/` is from [hkust-zhiyao/RTL-BenchLS](https://github.com/hkust-zhiyao/RTL-BenchLS), included unchanged under its original license (see `sources/rtl-benchls/LICENSE`).
- Other `sources/` folders are listed with their licenses in `sources/README.md`.
