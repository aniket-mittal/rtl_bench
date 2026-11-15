# Fill in the masked region of `autovcoder_096201`

The file `autovcoder_096201.v` holds a Verilog design whose top module is `autovcoder_096201` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `autovcoder_096201`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_096201.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_096201` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_096201.v`. Only these files are graded.

## Interface of `autovcoder_096201`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `rcn_in` | in | 69 |  |
| `cs` | in | 1 |  |
| `seq` | in | 2 |  |
| `wr` | in | 1 |  |
| `mask` | in | 4 |  |
| `addr` | in | 24 |  |
| `wdata` | in | 32 |  |
| `rcn_out` | out | 69 | |
| `busy` | out | 1 | |
| `rdone` | out | 1 | |
| `wdone` | out | 1 | |
| `rsp_seq` | out | 2 | |
| `rsp_mask` | out | 4 | |
| `rsp_addr` | out | 24 | |
| `rsp_data` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_096201.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
