# Fill in the masked region of `origen_119989`

The file `origen_119989.v` holds a Verilog design whose top module is `origen_119989` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_119989`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_119989.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_119989` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_119989.v`. Only these files are graded.

## Interface of `origen_119989`

| port | dir | width | note |
|---|---|---|---|
| `iClk` | in | 1 | clock, rising edge |
| `iClrn` | in | 1 | reset, active low |
| `iData` | in | 8 |  |
| `iValid` | in | 1 |  |
| `iReq` | in | 1 |  |
| `iPsync` | in | 1 |  |
| `oData` | out | 8 | |
| `oValid` | out | 1 | |
| `oEmpty` | out | 1 | |
| `oFull` | out | 1 | |
| `oPSync` | out | 1 | |
| `oCheck` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_119989.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
