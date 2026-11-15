# Fill in the masked region of `Deserializer`

The file `Deserializer.v` holds a Verilog design whose top module is `Deserializer` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `Deserializer`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `Deserializer.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `Deserializer` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `Deserializer.v`. Only these files are graded.

## Interface of `Deserializer`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `datain` | in | 16 |  |
| `dataout0` | out | 16 | |
| `dataout1` | out | 16 | |
| `dataout2` | out | 16 | |
| `dataout3` | out | 16 | |
| `dataout4` | out | 16 | |
| `dataout5` | out | 16 | |
| `dataout6` | out | 16 | |
| `dataout7` | out | 16 | |
| `dataout8` | out | 16 | |
| `dataout9` | out | 16 | |
| `dataout10` | out | 16 | |
| `dataout11` | out | 16 | |
| `dataout12` | out | 16 | |
| `dataout13` | out | 16 | |
| `dataout14` | out | 16 | |
| `dataout15` | out | 16 | |
| `dataout16` | out | 16 | |
| `dataout17` | out | 16 | |
| `dataout18` | out | 16 | |
| `dataout19` | out | 16 | |
| `dataout20` | out | 16 | |
| `dataout21` | out | 16 | |
| `dataout22` | out | 16 | |
| `dataout23` | out | 16 | |
| `dataout24` | out | 16 | |
| `dataout25` | out | 16 | |
| `dataout26` | out | 16 | |
| `dataout27` | out | 16 | |
| `dataout28` | out | 16 | |
| `dataout29` | out | 16 | |
| `dataout30` | out | 16 | |
| `dataout31` | out | 16 | |
| `finish` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v Deserializer.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
