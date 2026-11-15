# Fill in the masked region of `rtlpp_01291`

The file `rtlpp_01291.v` holds a Verilog design whose top module is `rtlpp_01291` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_01291`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01291.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01291` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01291.v`. Only these files are graded.

## Interface of `rtlpp_01291`

| port | dir | width | note |
|---|---|---|---|
| `ap_clk` | in | 1 | clock, rising edge |
| `ap_rst_n` | in | 1 | reset, active low |
| `s_axilite_AWVALID` | in | 1 |  |
| `s_axilite_AWADDR` | in | 5 |  |
| `s_axilite_WVALID` | in | 1 |  |
| `s_axilite_WDATA` | in | 32 |  |
| `s_axilite_WSTRB` | in | 4 |  |
| `s_axilite_BREADY` | in | 1 |  |
| `s_axilite_ARVALID` | in | 1 |  |
| `s_axilite_ARADDR` | in | 5 |  |
| `s_axilite_RREADY` | in | 1 |  |
| `in0_V_TVALID` | in | 1 |  |
| `in0_V_TDATA` | in | 24 |  |
| `out_V_TREADY` | in | 1 |  |
| `s_axilite_AWREADY` | out | 1 | |
| `s_axilite_WREADY` | out | 1 | |
| `s_axilite_BVALID` | out | 1 | |
| `s_axilite_BRESP` | out | 2 | |
| `s_axilite_ARREADY` | out | 1 | |
| `s_axilite_RVALID` | out | 1 | |
| `s_axilite_RDATA` | out | 32 | |
| `s_axilite_RRESP` | out | 2 | |
| `in0_V_TREADY` | out | 1 | |
| `out_V_TVALID` | out | 1 | |
| `out_V_TDATA` | out | 24 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01291.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
