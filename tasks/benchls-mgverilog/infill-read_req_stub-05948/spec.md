# Fill in the masked region of `mg_05948`

The file `mg_05948.v` holds a Verilog design whose top module is `mg_05948` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_05948`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_05948.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_05948` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_05948.v`. Only these files are graded.

## Interface of `mg_05948`

| port | dir | width | note |
|---|---|---|---|
| `iCLOCK` | in | 1 | clock, rising edge |
| `inRESET` | in | 1 | reset, active high |
| `iRESET_SYNC` | in | 1 |  |
| `iREMOVE` | in | 1 |  |
| `iRD_REQ` | in | 1 |  |
| `iRD_ADDR` | in | 32 |  |
| `iRD_BUSY` | in | 1 |  |
| `iWR_REQ` | in | 1 |  |
| `iWR_ADDR` | in | 32 |  |
| `iWR_DATA` | in | 512 |  |
| `iWR_MMU_FLAGS` | in | 256 |  |
| `oRD_BUSY` | out | 1 | |
| `oRD_VALID` | out | 1 | |
| `oRD_HIT` | out | 1 | |
| `oRD_DATA` | out | 64 | |
| `oRD_MMU_FLAGS` | out | 24 | |
| `oWR_BUSY` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_05948.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
