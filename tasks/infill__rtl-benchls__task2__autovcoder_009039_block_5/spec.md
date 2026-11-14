# Fill in the masked region of `autovcoder_009039`

The file `autovcoder_009039.v` holds a Verilog design whose top module is `autovcoder_009039` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_009039`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_009039.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_009039` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_009039.v`. Only these files are graded.

## Interface of `autovcoder_009039`

| port | dir | width | note |
|---|---|---|---|
| `Rs1E` | in | 5 |  |
| `Rs2E` | in | 5 |  |
| `RdM` | in | 5 |  |
| `RdW` | in | 5 |  |
| `RegWriteM` | in | 1 |  |
| `RegWriteW` | in | 1 |  |
| `ResultSrc0` | in | 1 |  |
| `RdE` | in | 5 |  |
| `Rs1D` | in | 5 |  |
| `Rs2D` | in | 5 |  |
| `PCSrcE` | in | 1 |  |
| `intrupt` | in | 1 |  |
| `ret` | in | 1 |  |
| `ForwardAE` | out | 2 | |
| `ForwardBE` | out | 2 | |
| `StallF` | out | 1 | |
| `StallD` | out | 1 | |
| `FlushE` | out | 1 | |
| `FlushD` | out | 1 | |
| `FlushM` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_009039.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
