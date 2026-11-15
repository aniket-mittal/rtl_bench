# Fill in the masked region of `origen_153648`

The file `origen_153648.v` holds a Verilog design whose top module is `origen_153648` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_153648`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_153648.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_153648` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_153648.v`. Only these files are graded.

## Interface of `origen_153648`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `carryout` | in | 1 |  |
| `result` | in | 8 |  |
| `read1` | in | 8 |  |
| `read2` | in | 8 |  |
| `instruction` | in | 8 |  |
| `data` | in | 8 |  |
| `ctrl0` | out | 2 | |
| `ctrl1` | out | 1 | |
| `clear` | out | 1 | |
| `reg1` | out | 1 | |
| `reg2` | out | 1 | |
| `write` | out | 1 | |
| `opcode` | out | 4 | |
| `address` | out | 8 | |
| `input1` | out | 8 | |
| `input2` | out | 8 | |
| `datareg` | out | 8 | |
| `out` | out | 8 | |
| `jump` | out | 1 | |
| `jumpaddress` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_153648.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
