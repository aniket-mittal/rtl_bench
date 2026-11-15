# Fill in the masked region of `origen_179398`

The file `origen_179398.v` holds a Verilog design whose top module is `origen_179398` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_179398`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_179398.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_179398` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_179398.v`. Only these files are graded.

## Interface of `origen_179398`

| port | dir | width | note |
|---|---|---|---|
| `RegWrite_in` | in | 1 |  |
| `Memory_write_in` | in | 1 |  |
| `DR_MDR_immi_in` | in | 1 |  |
| `RegJump_in` | in | 1 |  |
| `RegJump_cond_in` | in | 1 |  |
| `memory_input_in` | in | 1 |  |
| `branchcondition` | in | 4 |  |
| `szcv` | in | 4 |  |
| `DR_in` | in | 32 |  |
| `outerInput` | in | 32 |  |
| `memoryContent` | in | 32 |  |
| `din` | in | 32 |  |
| `Regdst_in` | in | 1 |  |
| `increPC_in` | in | 32 |  |
| `out_PC4` | out | 32 | |
| `MDR` | out | 32 | |
| `DR` | out | 32 | |
| `RegWrite` | out | 1 | |
| `DR_MDR_immi` | out | 1 | |
| `Memory_write` | out | 1 | |
| `RegJump` | out | 1 | |
| `d` | out | 32 | |
| `Regdst` | out | 1 | |
| `increPC_out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_179398.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
