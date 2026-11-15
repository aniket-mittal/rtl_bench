# Fill in the masked region of `rtlpp_03524`

The file `rtlpp_03524.v` holds a Verilog design whose top module is `rtlpp_03524` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_03524` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_03524.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_03524` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_03524.v`. Only these files are graded.

## Interface of `rtlpp_03524`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `s_axi_awaddr` | in | 32 |  |
| `s_axi_awprot` | in | 3 |  |
| `s_axi_awvalid` | in | 1 |  |
| `s_axi_wdata` | in | 32 |  |
| `s_axi_wstrb` | in | 4 |  |
| `s_axi_wvalid` | in | 1 |  |
| `s_axi_bready` | in | 1 |  |
| `s_axi_araddr` | in | 32 |  |
| `s_axi_arprot` | in | 3 |  |
| `s_axi_arvalid` | in | 1 |  |
| `s_axi_rready` | in | 1 |  |
| `m_axi_awready` | in | 4 |  |
| `m_axi_wready` | in | 4 |  |
| `m_axi_bresp` | in | 8 |  |
| `m_axi_bvalid` | in | 4 |  |
| `m_axi_arready` | in | 4 |  |
| `m_axi_rdata` | in | 128 |  |
| `m_axi_rresp` | in | 8 |  |
| `m_axi_rvalid` | in | 4 |  |
| `s_axi_awready` | out | 1 | |
| `s_axi_wready` | out | 1 | |
| `s_axi_bresp` | out | 2 | |
| `s_axi_bvalid` | out | 1 | |
| `s_axi_arready` | out | 1 | |
| `s_axi_rdata` | out | 32 | |
| `s_axi_rresp` | out | 2 | |
| `s_axi_rvalid` | out | 1 | |
| `m_axi_awaddr` | out | 128 | |
| `m_axi_awprot` | out | 12 | |
| `m_axi_awvalid` | out | 4 | |
| `m_axi_wdata` | out | 128 | |
| `m_axi_wstrb` | out | 16 | |
| `m_axi_wvalid` | out | 4 | |
| `m_axi_bready` | out | 4 | |
| `m_axi_araddr` | out | 128 | |
| `m_axi_arprot` | out | 12 | |
| `m_axi_arvalid` | out | 4 | |
| `m_axi_rready` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_03524.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
