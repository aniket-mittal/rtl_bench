# Fill in the masked region of `origen_152760`

The file `origen_152760.v` holds a Verilog design whose top module is `origen_152760` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_152760`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_152760.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_152760` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_152760.v`. Only these files are graded.

## Interface of `origen_152760`

| port | dir | width | note |
|---|---|---|---|
| `HCLK` | in | 1 | clock, rising edge |
| `HRESETn` | in | 1 | reset, active low |
| `HSEL` | in | 1 |  |
| `HADDR` | in | 32 |  |
| `HTRANS` | in | 2 |  |
| `HSIZE` | in | 3 |  |
| `HPROT` | in | 4 |  |
| `HWRITE` | in | 1 |  |
| `HWDATA` | in | 32 |  |
| `HREADY` | in | 1 |  |
| `SLEEPing` | in | 1 |  |
| `HREADYOUT` | out | 1 | |
| `HRDATA` | out | 32 | |
| `HRESP` | out | 2 | |
| `DMAstart` | out | 1 | |
| `DMAsrc` | out | 32 | |
| `DMAdst` | out | 32 | |
| `DMAsize` | out | 2 | |
| `DMAlen` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_152760.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
