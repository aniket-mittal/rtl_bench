# Fill in the masked region of `rtlpp_06909`

The file `rtlpp_06909.v` holds a Verilog design whose top module is `rtlpp_06909` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_06909`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_06909.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_06909` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_06909.v`. Only these files are graded.

## Interface of `rtlpp_06909`

| port | dir | width | note |
|---|---|---|---|
| `HCLK` | in | 1 | clock, rising edge |
| `HRESETn` | in | 1 | reset, active low |
| `READ` | in | 1 |  |
| `HRDATA` | in | 16 |  |
| `HREADY` | in | 1 |  |
| `HRESP` | in | 2 |  |
| `DATAOUT` | out | 16 | |
| `HADDR` | out | 32 | |
| `HTRANS` | out | 2 | |
| `HWRITE` | out | 1 | |
| `HSIZE` | out | 3 | |
| `HBURST` | out | 3 | |
| `HPROT` | out | 4 | |
| `HWDATA` | out | 32 | |
| `RESP_err` | out | 2 | |
| `AHB_BUSY` | out | 1 | |
| `VALID` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_06909.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
