# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Parameterized Shift/Count Data Register (`dut`)**

Design a module named `dut` with parameter `W` (default 1; only W=1 and W=4 need to be supported) and `B = W - 1`.

**Ports**
- `input i_clk`
- `input i_en, i_init, i_cnt7, i_cnt_done, i_sh_right`
- `input [1:0] i_lsb, i_bytecnt`
- `output o_sh_done`
- `input i_op_b_sel, i_shift_op`
- `input [B:0] i_rs2, i_imm`
- `output [B:0] o_op_b, o_q`
- `output [31:0] o_dat`
- `input i_load`
- `input [31:0] i_dat`

**Behavior**

The module holds a 32-bit register with no reset, exposed on `o_dat`. Its top 8 bits double as a shift-amount counter. Updates occur on the rising edge of `i_clk`.

- `o_op_b` is `i_rs2` when `i_op_b_sel` is 1, otherwise `i_imm`.
- `o_q` is a W-bit window of `o_dat` starting at bit `8*i_lsb`, so `i_lsb` selects bits `[W-1:0]`, `[W+7:8]`, `[W+15:16]` or `[W+23:24]`.
- "Byte valid" is true when `i_bytecnt == 0`. Otherwise it is true when `i_lsb == 0`, or `i_bytecnt` is 1 and `i_lsb != 3`, or `i_bytecnt` is 2 and `i_lsb` is 0 or 1.
- Shift enable is `i_en & i_init & (i_bytecnt == 0)` when `i_shift_op` is set, and `i_en & byte_valid` otherwise.
- Count enable is `i_shift_op & (!i_init | (i_cnt_done & i_sh_right))`.
- A candidate 8-bit upper value is chosen combinationally.
  - If count enable is set, it is the top byte with its low 6 bits decremented by 1 for W=1, or by 4 for W=4. The upper bits are `{o_op_b, top_byte[6]}` for W=1, or `o_op_b[3:2]` for W=4.
  - Otherwise it is `{o_op_b, top_byte[7:W]}`.
- `o_sh_done` is bit 5 of this candidate (combinational).

**Register update**
- If `i_load` is high, the register loads `i_dat` (all 32 bits). This takes priority, and the top byte is also updated whenever `i_load` is high.
- Otherwise the top byte takes the candidate value when shift enable or count enable is set. Its bit 5 is forced to 0 if `i_shift_op & i_cnt7 & !count_enable`.
- Otherwise the lower 24 bits shift right by W when shift enable is set. The W bits shifted in at the top are the low W bits of the top byte.
- With no load, no shift enable and no count enable, the register holds its value.
- If shift enable is set without count enable, the top byte is updated as described above while the lower 24 bits shift.
- If only count enable is set, only the top byte changes.

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
