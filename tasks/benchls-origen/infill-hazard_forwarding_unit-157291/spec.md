# Fill in the masked region of `origen_157291`

The file `origen_157291.v` holds a Verilog design whose top module is `origen_157291` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_157291`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_157291.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_157291` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_157291.v`. Only these files are graded.

## Interface of `origen_157291`

| port | dir | width | note |
|---|---|---|---|
| `rsD` | in | 5 |  |
| `rtD` | in | 5 |  |
| `rsE` | in | 5 |  |
| `rtE` | in | 5 |  |
| `memtoregE` | in | 1 |  |
| `memtoregM` | in | 1 |  |
| `regwriteE` | in | 1 |  |
| `regwriteM` | in | 1 |  |
| `regwriteW` | in | 1 |  |
| `writeregE` | in | 5 |  |
| `writeregM` | in | 5 |  |
| `writeregW` | in | 5 |  |
| `branchD` | in | 1 |  |
| `stallF` | out | 1 | |
| `stallD` | out | 1 | |
| `forwardAD` | out | 1 | |
| `forwardBD` | out | 1 | |
| `forwardAE` | out | 1 | |
| `forwardBE` | out | 1 | |
| `flushE` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_157291.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
