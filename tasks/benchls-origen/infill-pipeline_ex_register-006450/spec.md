# Fill in the masked region of `origen_006450`

The file `origen_006450.v` holds a Verilog design whose top module is `origen_006450` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_006450`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_006450.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_006450` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_006450.v`. Only these files are graded.

## Interface of `origen_006450`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `clrn` | in | 1 | reset, active low |
| `dwreg` | in | 1 |  |
| `dm2reg` | in | 1 |  |
| `dwmem` | in | 1 |  |
| `djal` | in | 1 |  |
| `D_WZ` | in | 1 |  |
| `D_BRANCH` | in | 1 |  |
| `daluc` | in | 5 |  |
| `D_BDEPEND` | in | 2 |  |
| `D_ADEPEND` | in | 2 |  |
| `da` | in | 32 |  |
| `db` | in | 32 |  |
| `dimm` | in | 32 |  |
| `dpc4` | in | 32 |  |
| `drn` | in | 5 |  |
| `ewreg` | out | 1 | |
| `em2reg` | out | 1 | |
| `ewmem` | out | 1 | |
| `ejal` | out | 1 | |
| `E_WZ` | out | 1 | |
| `DE_BRANCH` | out | 1 | |
| `ealuc` | out | 5 | |
| `E_BDEPEND` | out | 2 | |
| `E_ADEPEND` | out | 2 | |
| `ea` | out | 32 | |
| `eb` | out | 32 | |
| `eimm` | out | 32 | |
| `epc4` | out | 32 | |
| `ern` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_006450.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
