# Fill in the masked region of `mg_00180`

The file `mg_00180.v` holds a Verilog design whose top module is `mg_00180` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_00180`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_00180.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_00180` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_00180.v`. Only these files are graded.

## Interface of `mg_00180`

| port | dir | width | note |
|---|---|---|---|
| `OPcode` | in | 6 |  |
| `Fun` | in | 6 |  |
| `int_code` | in | 1 |  |
| `MIO_ready` | in | 1 |  |
| `zero` | in | 1 |  |
| `RegDst` | out | 1 | |
| `ALUSrc_B` | out | 1 | |
| `DatatoReg` | out | 2 | |
| `Jal` | out | 1 | |
| `Branch` | out | 2 | |
| `RegWrite` | out | 1 | |
| `mem_w` | out | 1 | |
| `ALU_Control` | out | 3 | |
| `eret` | out | 1 | |
| `CPU_MIO` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_00180.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
