# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Register-File Interface Controller (with optional CSR support)**

Design a purely combinational module named `dut` that sits between a RISC-V-style core and a register file with two write ports and two read ports. It has parameters `WITH_CSR` (default 1), `W` (default 1, data width in bits) and `B = W - 1`.

Let `RW = 5 + WITH_CSR` (so register-index buses are `[4+WITH_CSR:0]`, i.e. `RW` bits wide).

**Ports**
Inputs: `i_cnt_en`, `i_trap`, `i_mret`, `i_mtval_pc`, `i_csr_en`, `i_rd_wen`, `i_rd_alu_en`, `i_rd_csr_en`, `i_rd_mem_en` (all 1 bit); `i_csr_addr` [1:0]; `i_rd_waddr`, `i_rs1_raddr`, `i_rs2_raddr` [4:0]; `i_rdata0`, `i_rdata1`, `i_mepc`, `i_bufreg_q`, `i_bad_pc`, `i_csr`, `i_ctrl_rd`, `i_alu_rd`, `i_csr_rd`, `i_mem_rd` [B:0].
Outputs: `o_wreg0`, `o_wreg1`, `o_rreg0`, `o_rreg1` [4+WITH_CSR:0]; `o_wen0`, `o_wen1` (1 bit); `o_wdata0`, `o_wdata1`, `o_csr_pc`, `o_csr`, `o_rs1`, `o_rs2` [B:0].

**Common behavior**
`o_rs1 = i_rdata0` and `o_rs2 = i_rdata1`. An internal register write is enabled only when `i_rd_wen` is set and `i_rd_waddr` is all ones (a quirk: it is not a general write enable).

**WITH_CSR = 0**
- The rd value is `i_ctrl_rd` ORed with `i_alu_rd` gated by `i_rd_alu_en` and `i_mem_rd` gated by `i_rd_mem_en` (`i_csr_rd` is ignored). Port 0 writes this value.
- `o_wreg0 = i_rd_waddr`, `o_wen0 = i_cnt_en` AND the write enable above.
- Write port 1 is unused: `o_wdata1 = 0`, `o_wreg1 = 0`, `o_wen1 = 0`.
- `o_rreg0 = i_rs1_raddr`, `o_rreg1 = i_rs2_raddr`; `o_csr = 0`, `o_csr_pc = 0`.

**WITH_CSR ≠ 0**
- rd is the OR of `i_ctrl_rd` and the three gated sources, now including `i_csr_rd` gated by `i_rd_csr_en`.
- Write port 0: on `i_trap`, data is the mtval value (`i_bad_pc` if `i_mtval_pc` else `i_bufreg_q`) and `o_wreg0 = 6'b100011`; otherwise data is rd and `o_wreg0 = {1'b0, i_rd_waddr}`. `o_wen0 = i_cnt_en & (i_trap | write enable)`.
- Write port 1: on `i_trap`, data is `i_mepc` and `o_wreg1 = 6'b100010`; otherwise data is `i_csr` and `o_wreg1 = {4'b1000, i_csr_addr}`. `o_wen1 = i_cnt_en & (i_trap | i_csr_en)`.
- `o_rreg0 = {1'b0, i_rs1_raddr}`.
- Read port 1 selects a normal rs2 read only when none of `i_trap`, `i_mret`, `i_csr_en` is active. Then `o_rreg1 = {1'b0, i_rs2_raddr}`. Otherwise bit 5 is 1, bits [4:2] are 0, and bits [1:0] are the bitwise OR of: `{0, i_trap}`, `{i_mret, 0}`, and `i_csr_addr` if `i_csr_en`.
- `o_csr = i_rdata1` if `i_csr_en`, else 0. `o_csr_pc = i_rdata1`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `i_cnt_en` | in | 1 |  |
| `i_rdata0` | in | 1 |  |
| `i_rdata1` | in | 1 |  |
| `i_trap` | in | 1 |  |
| `i_mret` | in | 1 |  |
| `i_mepc` | in | 1 |  |
| `i_mtval_pc` | in | 1 |  |
| `i_bufreg_q` | in | 1 |  |
| `i_bad_pc` | in | 1 |  |
| `i_csr_en` | in | 1 |  |
| `i_csr_addr` | in | 2 |  |
| `i_csr` | in | 1 |  |
| `i_rd_wen` | in | 1 |  |
| `i_rd_waddr` | in | 5 |  |
| `i_ctrl_rd` | in | 1 |  |
| `i_alu_rd` | in | 1 |  |
| `i_rd_alu_en` | in | 1 |  |
| `i_csr_rd` | in | 1 |  |
| `i_rd_csr_en` | in | 1 |  |
| `i_mem_rd` | in | 1 |  |
| `i_rd_mem_en` | in | 1 |  |
| `i_rs1_raddr` | in | 5 |  |
| `i_rs2_raddr` | in | 5 |  |
| `o_wreg0` | out | 6 | |
| `o_wreg1` | out | 6 | |
| `o_wen0` | out | 1 | |
| `o_wen1` | out | 1 | |
| `o_wdata0` | out | 1 | |
| `o_wdata1` | out | 1 | |
| `o_rreg0` | out | 6 | |
| `o_rreg1` | out | 6 | |
| `o_csr_pc` | out | 1 | |
| `o_csr` | out | 1 | |
| `o_rs1` | out | 1 | |
| `o_rs2` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
