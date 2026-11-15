# Fill in the masked region of `rtlpp_11212`

The file `rtlpp_11212.v` holds a Verilog design whose top module is `rtlpp_11212` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_11212`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_11212.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_11212` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_11212.v`. Only these files are graded.

## Interface of `rtlpp_11212`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `scan_en` | in | 1 |  |
| `periph_tx_req` | in | 31 |  |
| `periph_rx_req` | in | 31 |  |
| `pclken` | in | 1 |  |
| `psel` | in | 1 |  |
| `penable` | in | 1 |  |
| `paddr` | in | 13 |  |
| `pwrite` | in | 1 |  |
| `pwdata` | in | 32 |  |
| `AWREADY0` | in | 1 |  |
| `WREADY0` | in | 1 |  |
| `BID0` | in | 4 |  |
| `BRESP0` | in | 2 |  |
| `BVALID0` | in | 1 |  |
| `ARREADY0` | in | 1 |  |
| `RID0` | in | 4 |  |
| `RDATA0` | in | 64 |  |
| `RRESP0` | in | 2 |  |
| `RLAST0` | in | 1 |  |
| `RVALID0` | in | 1 |  |
| `idle` | out | 1 | |
| `INT` | out | 1 | |
| `periph_tx_clr` | out | 31 | |
| `periph_rx_clr` | out | 31 | |
| `prdata` | out | 32 | |
| `pslverr` | out | 1 | |
| `pready` | out | 1 | |
| `AWID0` | out | 4 | |
| `AWADDR0` | out | 32 | |
| `AWLEN0` | out | 8 | |
| `AWSIZE0` | out | 3 | |
| `AWVALID0` | out | 1 | |
| `WID0` | out | 4 | |
| `WDATA0` | out | 64 | |
| `WSTRB0` | out | 8 | |
| `WLAST0` | out | 1 | |
| `WVALID0` | out | 1 | |
| `BREADY0` | out | 1 | |
| `ARID0` | out | 4 | |
| `ARADDR0` | out | 32 | |
| `ARLEN0` | out | 8 | |
| `ARSIZE0` | out | 3 | |
| `ARVALID0` | out | 1 | |
| `RREADY0` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_11212.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
