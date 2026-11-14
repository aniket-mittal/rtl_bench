# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Design a Bit-Serial Register File Interface with Optional CSR Support**

Implement a purely combinational module named `dut` with parameters `WITH_CSR` (default 1), `W` (default 1, data width), and `B` (default `W-1`). Let `R = 4 + WITH_CSR`, so register-index ports are `[R:0]` wide.

**Ports**

Inputs: `i_cnt_en`, `i_trap`, `i_mret`, `i_mtval_pc`, `i_csr_en`, `i_rd_wen`, `i_rd_alu_en`, `i_rd_csr_en`, `i_rd_mem_en` (all 1 bit); `i_csr_addr` [1:0]; `i_rd_waddr`, `i_rs1_raddr`, `i_rs2_raddr` [4:0]; `i_rdata0`, `i_rdata1`, `i_mepc`, `i_bufreg_q`, `i_bad_pc`, `i_csr`, `i_ctrl_rd`, `i_alu_rd`, `i_csr_rd`, `i_mem_rd` (all [B:0]).

Outputs: `o_wreg0`, `o_wreg1`, `o_rreg0`, `o_rreg1` [R:0]; `o_wen0`, `o_wen1` (1 bit); `o_wdata0`, `o_wdata1`, `o_csr_pc`, `o_csr`, `o_rs1`, `o_rs2` [B:0].

**Behavior**

Define the write-back value `rd` as the bitwise OR of `i_ctrl_rd` with each of `i_alu_rd`, `i_csr_rd`, `i_mem_rd` gated by its respective enable (`i_rd_alu_en`, `i_rd_csr_en`, `i_rd_mem_en`). Define `rd_wen = i_rd_wen` AND `i_rd_waddr != 0`. In all modes `o_rs1 = i_rdata0` and `o_rs2 = i_rdata1`.

**WITH_CSR = 0:** No CSR/trap features. `o_wdata0 = rd` (without the CSR term), `o_wreg0 = i_rd_waddr`, `o_wen0 = i_cnt_en & rd_wen`. Port 1 write is unused: `o_wdata1 = 0`, `o_wreg1 = 0`, `o_wen1 = 0`. `o_rreg0 = i_rs1_raddr`, `o_rreg1 = i_rs2_raddr`. `o_csr` and `o_csr_pc` are 0.

**WITH_CSR ≠ 0:** The register index has an extra MSB selecting the CSR space (index MSB=1).
- Write port 0: if `i_trap`, write `i_bad_pc` if `i_mtval_pc` else `i_bufreg_q`, to CSR index `6'b100011`; otherwise write `rd` to `{1'b0, i_rd_waddr}`. `o_wen0 = i_cnt_en & (i_trap | rd_wen)`.
- Write port 1: if `i_trap`, write `i_mepc` to index `6'b100010`; otherwise write `i_csr` to `{4'b1000, i_csr_addr}`. `o_wen1 = i_cnt_en & (i_trap | i_csr_en)`.
- Read port 0 index is `{1'b0, i_rs1_raddr}`.
- Read port 1: if none of `i_trap`, `i_mret`, `i_csr_en` is set, read the normal register `{1'b0, i_rs2_raddr}`. Otherwise it reads CSR space (MSB=1, upper address bits 0), with low two bits being: `01` for trap, `10` for mret, `i_csr_addr` for csr_en. When several are asserted, these low-bit contributions are bitwise ORed together.
- `o_csr = i_rdata1` when `i_csr_en` is set, else 0. `o_csr_pc = i_rdata0`.

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
