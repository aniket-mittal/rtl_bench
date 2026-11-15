# Fill in the masked region of `origen_152857`

The file `origen_152857.v` holds a Verilog design whose top module is `origen_152857` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_152857`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_152857.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_152857` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_152857.v`. Only these files are graded.

## Interface of `origen_152857`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `ahbls_hready` | in | 1 |  |
| `ahbls_haddr` | in | 32 |  |
| `ahbls_hwrite` | in | 1 |  |
| `ahbls_htrans` | in | 2 |  |
| `ahbls_hsize` | in | 3 |  |
| `ahbls_hburst` | in | 3 |  |
| `ahbls_hprot` | in | 4 |  |
| `ahbls_hmastlock` | in | 1 |  |
| `ahbls_hwdata` | in | 32 |  |
| `apbm_pready` | in | 1 |  |
| `apbm_prdata` | in | 32 |  |
| `apbm_pslverr` | in | 1 |  |
| `ahbls_hready_resp` | out | 1 | |
| `ahbls_hresp` | out | 2 | |
| `ahbls_hrdata` | out | 32 | |
| `apbm_paddr` | out | 32 | |
| `apbm_psel` | out | 1 | |
| `apbm_penable` | out | 1 | |
| `apbm_pwrite` | out | 1 | |
| `apbm_pwdata` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_152857.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
