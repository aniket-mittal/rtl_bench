# Fill in the masked region of `rtlpp_06424`

The file `rtlpp_06424.v` holds a Verilog design whose top module is `rtlpp_06424` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_06424` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_06424.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_06424` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_06424.v`. Only these files are graded.

## Interface of `rtlpp_06424`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rx_clk_in` | in | 1 |  |
| `rx_frame_in` | in | 1 |  |
| `rx_data_in` | in | 12 |  |
| `dac_sync_in` | in | 1 |  |
| `tdd_sync` | in | 1 |  |
| `gps_pps` | in | 1 |  |
| `delay_clk` | in | 1 |  |
| `adc_dovf` | in | 1 |  |
| `dac_data_i0` | in | 16 |  |
| `dac_data_q0` | in | 16 |  |
| `dac_data_i1` | in | 16 |  |
| `dac_data_q1` | in | 16 |  |
| `dac_dunf` | in | 1 |  |
| `s_axi_aclk` | in | 1 |  |
| `s_axi_aresetn` | in | 1 | reset, active low |
| `s_axi_awvalid` | in | 1 |  |
| `s_axi_awaddr` | in | 16 |  |
| `s_axi_awprot` | in | 3 |  |
| `s_axi_wvalid` | in | 1 |  |
| `s_axi_wdata` | in | 32 |  |
| `s_axi_wstrb` | in | 4 |  |
| `s_axi_bready` | in | 1 |  |
| `s_axi_arvalid` | in | 1 |  |
| `s_axi_araddr` | in | 16 |  |
| `s_axi_arprot` | in | 3 |  |
| `s_axi_rready` | in | 1 |  |
| `up_enable` | in | 1 |  |
| `up_txnrx` | in | 1 |  |
| `up_dac_gpio_in` | in | 32 |  |
| `up_adc_gpio_in` | in | 32 |  |
| `tx_clk_out` | out | 1 | |
| `tx_frame_out` | out | 1 | |
| `tx_data_out` | out | 12 | |
| `enable` | out | 1 | |
| `txnrx` | out | 1 | |
| `dac_sync_out` | out | 1 | |
| `tdd_sync_cntr` | out | 1 | |
| `gps_pps_irq` | out | 1 | |
| `l_clk` | out | 1 | |
| `rst` | out | 1 | |
| `adc_enable_i0` | out | 1 | |
| `adc_valid_i0` | out | 1 | |
| `adc_data_i0` | out | 16 | |
| `adc_enable_q0` | out | 1 | |
| `adc_valid_q0` | out | 1 | |
| `adc_data_q0` | out | 16 | |
| `adc_enable_i1` | out | 1 | |
| `adc_valid_i1` | out | 1 | |
| `adc_data_i1` | out | 16 | |
| `adc_enable_q1` | out | 1 | |
| `adc_valid_q1` | out | 1 | |
| `adc_data_q1` | out | 16 | |
| `adc_r1_mode` | out | 1 | |
| `dac_enable_i0` | out | 1 | |
| `dac_valid_i0` | out | 1 | |
| `dac_enable_q0` | out | 1 | |
| `dac_valid_q0` | out | 1 | |
| `dac_enable_i1` | out | 1 | |
| `dac_valid_i1` | out | 1 | |
| `dac_enable_q1` | out | 1 | |
| `dac_valid_q1` | out | 1 | |
| `dac_r1_mode` | out | 1 | |
| `s_axi_awready` | out | 1 | |
| `s_axi_wready` | out | 1 | |
| `s_axi_bvalid` | out | 1 | |
| `s_axi_bresp` | out | 2 | |
| `s_axi_arready` | out | 1 | |
| `s_axi_rvalid` | out | 1 | |
| `s_axi_rdata` | out | 32 | |
| `s_axi_rresp` | out | 2 | |
| `up_dac_gpio_out` | out | 32 | |
| `up_adc_gpio_out` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_06424.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
