# Fill in the masked region of `pcie_hip_core_logic`

The file `pcie_hip_core_logic.v` holds a Verilog design whose top module is `pcie_hip_core_logic` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `pcie_hip_core_logic`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `pcie_hip_core_logic.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `pcie_hip_core_logic` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `pcie_hip_core_logic.v`. Only these files are graded.

## Interface of `pcie_hip_core_logic`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `free_100MHz` | in | 1 |  |
| `local_rstn` | in | 1 |  |
| `pcie_rstn` | in | 1 | reset, active low |
| `pipe_mode` | in | 1 |  |
| `pld_clk` | in | 1 |  |
| `refclk` | in | 1 |  |
| `rx_in0` | in | 1 |  |
| `rx_in1` | in | 1 |  |
| `rx_in2` | in | 1 |  |
| `rx_in3` | in | 1 |  |
| `test_in` | in | 40 |  |
| `gen2_speed` | out | 1 | |
| `lane_width_code` | out | 4 | |
| `phy_sel_code` | out | 4 | |
| `phystatus_ext` | out | 1 | |
| `powerdown_ext` | out | 2 | |
| `ref_clk_sel_code` | out | 4 | |
| `rxdata0_ext` | out | 8 | |
| `rxdata1_ext` | out | 8 | |
| `rxdata2_ext` | out | 8 | |
| `rxdata3_ext` | out | 8 | |
| `rxdatak0_ext` | out | 1 | |
| `rxdatak1_ext` | out | 1 | |
| `rxdatak2_ext` | out | 1 | |
| `rxdatak3_ext` | out | 1 | |
| `rxelecidle0_ext` | out | 1 | |
| `rxelecidle1_ext` | out | 1 | |
| `rxelecidle2_ext` | out | 1 | |
| `rxelecidle3_ext` | out | 1 | |
| `rxpolarity0_ext` | out | 1 | |
| `rxpolarity1_ext` | out | 1 | |
| `rxpolarity2_ext` | out | 1 | |
| `rxpolarity3_ext` | out | 1 | |
| `rxstatus0_ext` | out | 3 | |
| `rxstatus1_ext` | out | 3 | |
| `rxstatus2_ext` | out | 3 | |
| `rxstatus3_ext` | out | 3 | |
| `rxvalid0_ext` | out | 1 | |
| `rxvalid1_ext` | out | 1 | |
| `rxvalid2_ext` | out | 1 | |
| `rxvalid3_ext` | out | 1 | |
| `test_out_icm` | out | 9 | |
| `tx_out0` | out | 1 | |
| `tx_out1` | out | 1 | |
| `tx_out2` | out | 1 | |
| `tx_out3` | out | 1 | |
| `txcompl0_ext` | out | 1 | |
| `txcompl1_ext` | out | 1 | |
| `txcompl2_ext` | out | 1 | |
| `txcompl3_ext` | out | 1 | |
| `txdata0_ext` | out | 8 | |
| `txdata1_ext` | out | 8 | |
| `txdata2_ext` | out | 8 | |
| `txdata3_ext` | out | 8 | |
| `txdatak0_ext` | out | 1 | |
| `txdatak1_ext` | out | 1 | |
| `txdatak2_ext` | out | 1 | |
| `txdatak3_ext` | out | 1 | |
| `txdetectrx_ext` | out | 1 | |
| `txelecidle0_ext` | out | 1 | |
| `txelecidle1_ext` | out | 1 | |
| `txelecidle2_ext` | out | 1 | |
| `txelecidle3_ext` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v pcie_hip_core_logic.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
