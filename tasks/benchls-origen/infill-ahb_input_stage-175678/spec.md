# Fill in the masked region of `origen_175678`

The file `origen_175678.v` holds a Verilog design whose top module is `origen_175678` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_175678`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_175678.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_175678` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_175678.v`. Only these files are graded.

## Interface of `origen_175678`

| port | dir | width | note |
|---|---|---|---|
| `HCLK` | in | 1 | clock, rising edge |
| `HRESETn` | in | 1 | reset, active low |
| `HADDR` | in | 32 |  |
| `HTRANS` | in | 2 |  |
| `HWRITE` | in | 1 |  |
| `HSIZE` | in | 3 |  |
| `HBURST` | in | 3 |  |
| `HPROT` | in | 4 |  |
| `HREADY` | in | 1 |  |
| `ACTIVE_Decoder` | in | 1 |  |
| `HREADYOUT_Decoder` | in | 1 |  |
| `HRESP_Decoder` | in | 2 |  |
| `HREADYOUT` | out | 1 | |
| `HRESP` | out | 2 | |
| `HADDR_Inputstage` | out | 32 | |
| `HTRANS_Inputstage` | out | 2 | |
| `HWRITE_Inputstage` | out | 1 | |
| `HSIZE_Inputstage` | out | 3 | |
| `HBURST_Inputstage` | out | 3 | |
| `HPROT_Inputstage` | out | 4 | |
| `TRANS_HOLD` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_175678.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
