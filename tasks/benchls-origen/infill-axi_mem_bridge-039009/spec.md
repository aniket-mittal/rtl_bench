# Fill in the masked region of `origen_039009`

The file `origen_039009.v` holds a Verilog design whose top module is `origen_039009` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_039009`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_039009.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_039009` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_039009.v`. Only these files are graded.

## Interface of `origen_039009`

| port | dir | width | note |
|---|---|---|---|
| `g_clk` | in | 1 | clock, rising edge |
| `g_resetn` | in | 1 | reset, active low |
| `mem_axi_awready` | in | 1 |  |
| `mem_axi_wready` | in | 1 |  |
| `mem_axi_bvalid` | in | 1 |  |
| `mem_axi_arready` | in | 1 |  |
| `mem_axi_rvalid` | in | 1 |  |
| `mem_axi_rdata` | in | 32 |  |
| `mem_instr` | in | 1 |  |
| `mem_cen` | in | 1 |  |
| `mem_addr` | in | 32 |  |
| `mem_wdata` | in | 32 |  |
| `mem_wstrb` | in | 4 |  |
| `mem_axi_awvalid` | out | 1 | |
| `mem_axi_awaddr` | out | 32 | |
| `mem_axi_awprot` | out | 3 | |
| `mem_axi_wvalid` | out | 1 | |
| `mem_axi_wdata` | out | 32 | |
| `mem_axi_wstrb` | out | 4 | |
| `mem_axi_bready` | out | 1 | |
| `mem_axi_arvalid` | out | 1 | |
| `mem_axi_araddr` | out | 32 | |
| `mem_axi_arprot` | out | 3 | |
| `mem_axi_rready` | out | 1 | |
| `mem_stall` | out | 1 | |
| `mem_error` | out | 1 | |
| `mem_rdata` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_039009.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
