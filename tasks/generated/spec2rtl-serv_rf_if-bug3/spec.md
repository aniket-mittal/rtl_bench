# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Register-File Interface Controller**

Design a combinational module `dut` with parameters `WITH_CSR` (default 1), `W` (default 1) and `B = W-1`. Let `R = 4+WITH_CSR`, so register-index buses are `[R:0]` and data buses are `[B:0]`.

**Ports**
- Inputs, 1 bit: `i_cnt_en`, `i_trap`, `i_mret`, `i_mtval_pc`, `i_csr_en`, `i_rd_wen`, `i_rd_alu_en`, `i_rd_csr_en`, `i_rd_mem_en`
- Inputs, `[B:0]`: `i_rdata0`, `i_rdata1`, `i_mepc`, `i_bufreg_q`, `i_bad_pc`, `i_csr`, `i_ctrl_rd`, `i_alu_rd`, `i_csr_rd`, `i_mem_rd`
- Inputs, other: `i_csr_addr` [1:0]; `i_rd_waddr`, `i_rs1_raddr`, `i_rs2_raddr` [4:0]
- Outputs, `[R:0]`: `o_wreg0`, `o_wreg1`, `o_rreg0`, `o_rreg1`
- Outputs, 1 bit: `o_wen0`, `o_wen1`
- Outputs, `[B:0]`: `o_wdata0`, `o_wdata1`, `o_csr_pc`, `o_csr`, `o_rs1`, `o_rs2`

**Common behavior:** `o_rs1 = i_rdata0` and `o_rs2 = i_rdata1`. Define the effective write-enable as `i_rd_wen` AND `i_rd_waddr` nonzero.

**WITH_CSR = 0:**
- The write data is `i_ctrl_rd` ORed with `i_alu_rd` gated by `i_rd_alu_en` and `i_mem_rd` gated by `i_rd_mem_en`. It drives `o_wdata0`.
- `o_wdata1`, `o_wreg1`, `o_wen1`, `o_csr` and `o_csr_pc` are all 0.
- `o_wreg0 = i_rd_waddr`, `o_rreg0 = i_rs1_raddr`, `o_rreg1 = i_rs2_raddr`.
- `o_wen0 = i_cnt_en` AND the effective write-enable.

**WITH_CSR ≠ 0:**
- The register write data is the OR of `i_ctrl_rd`, `i_alu_rd` gated by `i_rd_alu_en`, `i_mem_rd` gated by `i_rd_csr_en`, and `i_mem_rd` gated by `i_rd_mem_en`. `i_csr_rd` is never used. This is intentional.
- On `i_trap`:
  - `o_wdata0` is `i_bad_pc` if `i_mtval_pc` is set, otherwise `i_bufreg_q`. `o_wdata1 = i_mepc`. `o_wreg0 = 6'b100011`. `o_wreg1 = 6'b100010`.
- Otherwise:
  - `o_wdata0` is the register write data and `o_wdata1 = i_csr`.
  - `o_wreg0 = {1'b0, i_rd_waddr}` and `o_wreg1 = {4'b1000, i_csr_addr}`.
- `o_wen0 = i_cnt_en` AND (`i_trap` OR the effective write-enable). `o_wen1 = i_cnt_en` AND (`i_trap` OR `i_csr_en`).
- `o_rreg0 = {1'b0, i_rs1_raddr}`.
- Define `sel = NOT(i_trap OR i_mret OR i_csr_en)`. `o_rreg1` is built as follows:
  - Bit 5 is `~sel`.
  - Bits [4:2] are `i_rs2_raddr[4:2]` gated by `sel`.
  - Bits [1:0] are the bitwise OR of three terms: `{i_mret, i_trap}`, `i_csr_addr` gated by `i_csr_en`, and `i_rs2_raddr[1:0]` gated by `sel`. Several terms can be active at once, and they are simply ORed.
- `o_csr = i_rdata1` gated by `i_csr_en`, and `o_csr_pc = i_rdata1`.

All outputs are purely combinational.

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
