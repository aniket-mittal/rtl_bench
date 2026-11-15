# Fill in the masked region of `autovcoder_091785`

The file `autovcoder_091785.v` holds a Verilog design whose top module is `autovcoder_091785` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_091785`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_091785.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_091785` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_091785.v`. Only these files are graded.

## Interface of `autovcoder_091785`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `busywait` | in | 1 |  |
| `des_register` | in | 5 |  |
| `Funct3` | in | 3 |  |
| `rs1` | in | 5 |  |
| `rs2` | in | 5 |  |
| `mux_5_sel` | in | 1 |  |
| `writeEnable` | in | 1 |  |
| `mux_3_sel` | in | 1 |  |
| `memWrite` | in | 1 |  |
| `memRead` | in | 1 |  |
| `ALUop` | in | 5 |  |
| `mux_4_sel` | in | 2 |  |
| `branch` | in | 1 |  |
| `jump` | in | 1 |  |
| `mux_1_sel` | in | 1 |  |
| `PC` | in | 32 |  |
| `nextPC` | in | 32 |  |
| `data1` | in | 32 |  |
| `data2` | in | 32 |  |
| `mux_2_out` | in | 32 |  |
| `Insthit` | in | 1 |  |
| `B_address` | in | 32 |  |
| `des_register_out` | out | 5 | |
| `Funct3_out` | out | 3 | |
| `rs1_out` | out | 5 | |
| `rs2_out` | out | 5 | |
| `mux_5_sel_out` | out | 1 | |
| `writeEnable_out` | out | 1 | |
| `mux_3_sel_out` | out | 1 | |
| `memWrite_out` | out | 1 | |
| `memRead_out` | out | 1 | |
| `ALUop_out` | out | 5 | |
| `mux_4_sel_out` | out | 2 | |
| `branch_out` | out | 1 | |
| `jump_out` | out | 1 | |
| `mux_1_sel_out` | out | 1 | |
| `PC_out` | out | 32 | |
| `nextPC_out` | out | 32 | |
| `data1_out` | out | 32 | |
| `data2_out` | out | 32 | |
| `mux_2_out_out` | out | 32 | |
| `Insthit_out` | out | 1 | |
| `B_address_out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_091785.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
