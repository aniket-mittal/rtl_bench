# rtl_bench

Three folders:

- `liveverilogeval/` — pipeline that takes existing verified Verilog designs, mutates them into new designs, writes a spec for each mutant, and formally checks (Yosys) that the spec matches the mutant. Use this to generate fresh RTL tasks from existing designs.
- `RTL-BenchLS/` — the RTL-BenchLS benchmark: 10,028 formally verified Verilog designs and three evaluation tasks. Use this to evaluate models.
- `open_source_designs/` — open-source Verilog designs (verilog-eval, basic_verilog, UART, I2C, SHA-256, AES, SERV, PicoRV32) collected as seed material. Separate from the benchmark. See its README for sources and licenses.

Each folder has its own README with setup and run instructions.

## Credits

- `liveverilogeval/` is adapted from [agctute/liveverilogeval](https://github.com/agctute/liveverilogeval). Its seed designs come from [RTLLM](https://github.com/hkust-zhiyao/RTLLM).
- `RTL-BenchLS/` is from [hkust-zhiyao/RTL-BenchLS](https://github.com/hkust-zhiyao/RTL-BenchLS), included unchanged under its original license (see `RTL-BenchLS/LICENSE`).
