# Fill in the masked region of `rtlpp_05913`

The file `rtlpp_05913.v` holds a Verilog design whose top module is `rtlpp_05913` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_05913` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_05913.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_05913` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_05913.v`. Only these files are graded.

## Interface of `rtlpp_05913`

| port | dir | width | note |
|---|---|---|---|
| `Clk` | in | 1 | clock, rising edge |
| `Reset` | in | 1 | reset, active high |
| `Interrupt` | in | 1 |  |
| `Interrupt_Address` | in | 32 |  |
| `Instr` | in | 32 |  |
| `IReady` | in | 1 |  |
| `IWAIT` | in | 1 |  |
| `ICE` | in | 1 |  |
| `IUE` | in | 1 |  |
| `Data_Read` | in | 32 |  |
| `DReady` | in | 1 |  |
| `DWait` | in | 1 |  |
| `DCE` | in | 1 |  |
| `DUE` | in | 1 |  |
| `M_AXI_DP_AWREADY` | in | 1 |  |
| `M_AXI_DP_WREADY` | in | 1 |  |
| `M_AXI_DP_BRESP` | in | 2 |  |
| `M_AXI_DP_BVALID` | in | 1 |  |
| `M_AXI_DP_ARREADY` | in | 1 |  |
| `M_AXI_DP_RDATA` | in | 32 |  |
| `M_AXI_DP_RRESP` | in | 2 |  |
| `M_AXI_DP_RVALID` | in | 1 |  |
| `Dbg_Clk` | in | 1 |  |
| `Dbg_TDI` | in | 1 |  |
| `Dbg_Reg_En` | in | 8 |  |
| `Dbg_Shift` | in | 1 |  |
| `Dbg_Capture` | in | 1 |  |
| `Dbg_Update` | in | 1 |  |
| `Debug_Rst` | in | 1 |  |
| `Dbg_Disable` | in | 1 |  |
| `Interrupt_Ack` | out | 2 | |
| `Instr_Addr` | out | 32 | |
| `IFetch` | out | 1 | |
| `I_AS` | out | 1 | |
| `Data_Addr` | out | 32 | |
| `Data_Write` | out | 32 | |
| `D_AS` | out | 1 | |
| `Read_Strobe` | out | 1 | |
| `Write_Strobe` | out | 1 | |
| `Byte_Enable` | out | 4 | |
| `M_AXI_DP_AWADDR` | out | 32 | |
| `M_AXI_DP_AWPROT` | out | 3 | |
| `M_AXI_DP_AWVALID` | out | 1 | |
| `M_AXI_DP_WDATA` | out | 32 | |
| `M_AXI_DP_WSTRB` | out | 4 | |
| `M_AXI_DP_WVALID` | out | 1 | |
| `M_AXI_DP_BREADY` | out | 1 | |
| `M_AXI_DP_ARADDR` | out | 32 | |
| `M_AXI_DP_ARPROT` | out | 3 | |
| `M_AXI_DP_ARVALID` | out | 1 | |
| `M_AXI_DP_RREADY` | out | 1 | |
| `Dbg_TDO` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_05913.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
