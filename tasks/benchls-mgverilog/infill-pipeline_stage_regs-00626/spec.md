# Fill in the masked region of `mg_00626`

The file `mg_00626.v` holds a Verilog design whose top module is `mg_00626` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_00626`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_00626.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_00626` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_00626.v`. Only these files are graded.

## Interface of `mg_00626`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `aluop_in` | in | 5 |  |
| `ww_in` | in | 2 |  |
| `memEn_in` | in | 1 |  |
| `memWrEn_in` | in | 1 |  |
| `memAddr_in` | in | 21 |  |
| `wbyteen_in` | in | 16 |  |
| `regwren_in` | in | 1 |  |
| `rwraddrd_in` | in | 5 |  |
| `reginmuxop_in` | in | 1 |  |
| `aluinmuxop_in` | in | 1 |  |
| `immediate_in` | in | 128 |  |
| `wrdata` | in | 128 |  |
| `instruction_in` | in | 32 |  |
| `reset` | in | 1 | reset, active high |
| `aluop_out` | out | 5 | |
| `ww_out` | out | 2 | |
| `memEn_out` | out | 1 | |
| `memWrEn_out` | out | 1 | |
| `memAddr_out` | out | 21 | |
| `wbyteen_out` | out | 16 | |
| `regwren_out` | out | 1 | |
| `rwraddrd_out` | out | 5 | |
| `reginmuxop_out` | out | 1 | |
| `aluinmuxop_out` | out | 1 | |
| `immediate_out` | out | 128 | |
| `hz1data` | out | 128 | |
| `instruction_out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_00626.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
