# sources

Seed designs that tasks are built from. Treat these folders as read-only copies of upstream.

For the open-source repos below, only RTL sources (and, for verilog-eval, prompts and tests) are kept; build files, docs, and testbenches are left out. Each of those folders has the original LICENSE.

| Folder | What | Files | Source | License | Commit |
|---|---|---|---|---|---|
| `rtllm/` | 50 RTLLM designs, each with a spec (`design_description.txt`), reference (`verified_*.v`), and testbench | — | [hkust-zhiyao/RTLLM](https://github.com/hkust-zhiyao/RTLLM) | see upstream (LICENSE not copied) | — |
| `rtl-benchls/` | RTL-BenchLS benchmark: 10,028 designs, masked-content and repo-issue tasks. Verification scripts target commercial tools. | — | [hkust-zhiyao/RTL-BenchLS](https://github.com/hkust-zhiyao/RTL-BenchLS) | CC-BY-4.0 data / MIT code | 5a8d15a |
| `verilog-eval/` | 156 small spec-to-RTL problems, each with prompt, reference `.sv`, and test | 313 | [NVlabs/verilog-eval](https://github.com/NVlabs/verilog-eval) | MIT | c498220 |
| `basic_verilog/` | Standalone utility modules: FIFOs, CDC, counters, encoders, debouncers, UART, SPI | 71 | [pConst/basic_verilog](https://github.com/pConst/basic_verilog) | CC BY-SA 4.0 | 2654273 |
| `verilog-uart/` | UART transmitter/receiver with AXI-stream interface | 3 | [alexforencich/verilog-uart](https://github.com/alexforencich/verilog-uart) | MIT | 1b867e5 |
| `verilog-i2c/` | I2C master and slave, Wishbone and AXI-lite wrappers | 10 | [alexforencich/verilog-i2c](https://github.com/alexforencich/verilog-i2c) | MIT | a65be40 |
| `secworks-sha256/` | SHA-256 core | 4 | [secworks/sha256](https://github.com/secworks/sha256) | BSD-2 | 837c5cc |
| `secworks-aes/` | AES-128/256 encrypt and decrypt core | 7 | [secworks/aes](https://github.com/secworks/aes) | BSD-2 | 80dc471 |
| `serv/` | SERV, a bit-serial RISC-V CPU | 18 | [olofk/serv](https://github.com/olofk/serv) | ISC | f200eb2 |
| `picorv32/` | PicoRV32, a small RISC-V CPU in one file | 1 | [YosysHQ/picorv32](https://github.com/YosysHQ/picorv32) | ISC | ef203c2 |

Sizes range from single-module exercises (verilog-eval, basic_verilog) through small peripherals (UART, I2C) and crypto cores (SHA-256, AES) to full CPUs (SERV, PicoRV32).

`YOSYS_STATUS.md` lists which files Yosys parses out of the box.
