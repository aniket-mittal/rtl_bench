# Fill in the masked region of `mg_07515`

The file `mg_07515.v` holds a Verilog design whose top module is `mg_07515` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_07515`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_07515.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_07515` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_07515.v`. Only these files are graded.

## Interface of `mg_07515`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `debugEnable` | in | 1 |  |
| `debugReset` | in | 1 |  |
| `syncClr` | in | 1 |  |
| `rs` | in | 5 |  |
| `rt` | in | 5 |  |
| `rd` | in | 5 |  |
| `sa` | in | 5 |  |
| `aluOperation` | in | 4 |  |
| `sigExt` | in | 32 |  |
| `readData1` | in | 32 |  |
| `readData2` | in | 32 |  |
| `aluSrc` | in | 1 |  |
| `aluShiftImm` | in | 1 |  |
| `regDst` | in | 1 |  |
| `loadImm` | in | 1 |  |
| `memWrite` | in | 4 |  |
| `memToReg` | in | 1 |  |
| `memReadWidth` | in | 2 |  |
| `regWrite` | in | 1 |  |
| `eop` | in | 1 |  |
| `aluOperationOut` | out | 4 | |
| `sigExtOut` | out | 32 | |
| `readData1Out` | out | 32 | |
| `readData2Out` | out | 32 | |
| `aluSrcOut` | out | 1 | |
| `aluShiftImmOut` | out | 1 | |
| `memWriteOut` | out | 4 | |
| `memToRegOut` | out | 1 | |
| `memReadWidthOut` | out | 2 | |
| `rsOut` | out | 5 | |
| `rtOut` | out | 5 | |
| `rdOut` | out | 5 | |
| `saOut` | out | 5 | |
| `regDstOut` | out | 1 | |
| `loadImmOut` | out | 1 | |
| `regWriteOut` | out | 1 | |
| `eopOut` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_07515.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
