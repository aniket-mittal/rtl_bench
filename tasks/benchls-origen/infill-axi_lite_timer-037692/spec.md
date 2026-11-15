# Fill in the masked region of `origen_037692`

The file `origen_037692.v` holds a Verilog design whose top module is `origen_037692` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_037692`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_037692.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_037692` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_037692.v`. Only these files are graded.

## Interface of `origen_037692`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `s_axil_awaddr` | in | 32 |  |
| `s_axil_awprot` | in | 3 |  |
| `s_axil_awvalid` | in | 1 |  |
| `s_axil_wdata` | in | 32 |  |
| `s_axil_wstrb` | in | 4 |  |
| `s_axil_wvalid` | in | 1 |  |
| `s_axil_bready` | in | 1 |  |
| `s_axil_araddr` | in | 32 |  |
| `s_axil_arprot` | in | 3 |  |
| `s_axil_arvalid` | in | 1 |  |
| `s_axil_rready` | in | 1 |  |
| `s_axil_awready` | out | 1 | |
| `s_axil_wready` | out | 1 | |
| `s_axil_bresp` | out | 2 | |
| `s_axil_bvalid` | out | 1 | |
| `s_axil_arready` | out | 1 | |
| `s_axil_rdata` | out | 32 | |
| `s_axil_rresp` | out | 2 | |
| `s_axil_rvalid` | out | 1 | |
| `time_intr` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_037692.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
