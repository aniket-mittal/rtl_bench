# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Design a Byte-Addressable Shift/Data Register with Shift Counter**

Implement a module named `dut` with parameters `W` (default 1) and `B = W - 1`. Only `W = 1` and `W = 4` need to be supported.

**Ports**
- `input i_clk`
- `input i_en`, `i_init`, `i_cnt7`, `i_cnt_done`, `i_sh_right`, `i_op_b_sel`, `i_shift_op`, `i_load` (1 bit each)
- `input [1:0] i_lsb`, `input [1:0] i_bytecnt`
- `input [B:0] i_rs2`, `input [B:0] i_imm`
- `input [31:0] i_dat`
- `output o_sh_done`
- `output [B:0] o_op_b`, `output [B:0] o_q`
- `output [31:0] o_dat`

**Behavior**

The module holds a 32-bit register, with no reset, clocked on the rising edge of `i_clk`. `o_dat` is its current value. Call its top byte H (bits 31:24) and the remaining 24 bits L.

- `o_op_b` is `i_rs2` when `i_op_b_sel` is 1, otherwise `i_imm`. It is combinational.
- `o_q` is combinational. It is the `W`-bit field of `o_dat` starting at bit `8*i_lsb`.
- Define `byte_valid` as true when `i_bytecnt + i_lsb <= 3`, treating both as unsigned integers.
- Define `shift_en` as follows. If `i_shift_op` is 1, it is `i_en & i_init & (i_bytecnt == 0)`. Otherwise it is `i_en & byte_valid`.
- Define `cnt_en = (i_shift_op & (~i_init | i_cnt_done)) | i_sh_right`.
- Define an 8-bit candidate value `D`. If `cnt_en` is 1, `D` is a counter-update word. Its low 6 bits are H[5:0] minus `W`, modulo 64. Its upper 2 bits are, for `W=1`, `{i_op_b[0], H[7]}`, and for `W=4`, `i_op_b[3:2]`. If `cnt_en` is 0, `D` is `{o_op_b, H[7:W]}`.
- `o_sh_done` is combinational and equals bit 5 of `D`.

**Register update** (priority: load first)
- If `i_load` is 1, the register takes `i_dat`.
- Otherwise, H updates when `shift_en | cnt_en`. It takes `D`, except that bit 5 is forced to 0 when `i_shift_op & i_cnt7 & ~cnt_en` is true.
- Otherwise, L updates only when `shift_en` is 1. It takes `{H[B:0], L[23:W]}`.
- In all other cases the register holds its value.
- H and L update under their own separate conditions. For example, H can change on `cnt_en` while L holds.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `i_clk` | in | 1 | clock, rising edge |
| `i_en` | in | 1 |  |
| `i_init` | in | 1 |  |
| `i_cnt7` | in | 1 |  |
| `i_cnt_done` | in | 1 |  |
| `i_sh_right` | in | 1 |  |
| `i_lsb` | in | 2 |  |
| `i_bytecnt` | in | 2 |  |
| `i_op_b_sel` | in | 1 |  |
| `i_shift_op` | in | 1 |  |
| `i_rs2` | in | 1 |  |
| `i_imm` | in | 1 |  |
| `i_load` | in | 1 |  |
| `i_dat` | in | 32 |  |
| `o_sh_done` | out | 1 | |
| `o_op_b` | out | 1 | |
| `o_q` | out | 1 | |
| `o_dat` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
