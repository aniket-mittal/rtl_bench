# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**RV32C Instruction Expander**

Design a module named `dut` that expands a 16-bit RISC-V compressed (RV32C) instruction into its 32-bit RV32I equivalent.

**Ports**
- `input wire i_clk`: clock
- `input wire [31:0] i_instr`: instruction word. For a compressed instruction, only bits `[15:0]` are meaningful.
- `input wire i_ack`
- `output wire [31:0] o_instr`
- `output reg o_iscomp`

**Behavior**

`o_instr` is combinational. It is the 32-bit expansion of `i_instr[15:0]` according to the standard RV32C-to-RV32I mapping. This covers the quadrant 0 loads and stores, ADDI4SPN, the quadrant 1 ALU, immediate, LUI/ADDI16SP, jump and branch forms, and the quadrant 2 SLLI, stack loads and stores, JR/JALR/MV/ADD, and EBREAK. Immediate bit orderings and register mappings are those of the standard.

An instruction is *illegal* if `i_instr[1:0] == 2'b11` (already 32-bit), or if it is in quadrant 0 with `i_instr[15:14] == 2'b10`. For an illegal instruction, `o_instr` passes `i_instr` through unchanged.

Deviations from the standard that must be reproduced:
- In quadrants 0 and 2, only `i_instr[15:14]` selects the operation. Bit 13 is ignored, so floating-point encodings alias to the integer forms.
- ADDI4SPN uses `x1` as its source register, not `x2`.
- No reserved-encoding checks are made. Zero immediates, `rd = x0`, and similar cases expand with the same formula as any other value. The one exception is that a quadrant 1 `funct3 = 011` instruction with `rd = x2` is ADDI16SP, and otherwise it is LUI.
- In the shift-immediate forms (SLLI, SRLI, SRAI), the shift amount is 5 bits, so shamt[5] is 0. `i_instr[12]` is ignored.
- Quadrant 1 `funct3` values 001 and 101 both expand to JAL. The link register is `x1` for 001 and `x0` for 101.
- In quadrant 2, with `i_instr[15:14] == 2'b10` and `i_instr[12] == 0`, `rs2 == 0` gives `JALR x0, rs1, 0`. This applies even if `rs1 = x0`.
- With `i_instr[12] == 1` and `rs2 == 0`, `rd == x0` gives EBREAK (`32'h00100073`). Otherwise it gives `JALR x1, rs1, 0`.

**Sequential output**

`o_iscomp` is a flop updated on the rising edge of `i_clk`. When `i_ack` is high it captures 1 if the current `i_instr` is not illegal, and 0 otherwise. When `i_ack` is low it holds its value. There is no reset.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `i_clk` | in | 1 | clock, rising edge |
| `i_instr` | in | 32 |  |
| `i_ack` | in | 1 |  |
| `o_instr` | out | 32 | |
| `o_iscomp` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
