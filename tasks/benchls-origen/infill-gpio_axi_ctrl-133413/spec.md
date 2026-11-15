# Fill in the masked region of `origen_133413`

The file `origen_133413.v` holds a Verilog design whose top module is `origen_133413` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_133413`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_133413.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_133413` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_133413.v`. Only these files are graded.

## Interface of `origen_133413`

| port | dir | width | note |
|---|---|---|---|
| `s_axi_aclk` | in | 1 | clock, rising edge |
| `s_axi_aresetn` | in | 1 |  |
| `is_read` | in | 1 |  |
| `is_write_reg` | in | 1 |  |
| `start2` | in | 1 |  |
| `ip2bus_rdack_i_D1` | in | 1 |  |
| `ip2bus_wrack_i_D1` | in | 1 |  |
| `gpio2_io_t` | in | 4 |  |
| `Dual_gpio2_Data_In_reg` | in | 4 |  |
| `bus2ip_addr_i_reg` | in | 3 |  |
| `bus2ip_rnw_i_reg` | in | 1 |  |
| `rst_reg` | in | 1 | reset, active high |
| `GPIO2_DBus_i` | in | 4 |  |
| `GPIO_DBus_i` | in | 4 |  |
| `gpio_io_t` | in | 4 |  |
| `Dual_gpio_Data_In_reg` | in | 4 |  |
| `gpio_xferAck_Reg` | in | 1 |  |
| `GPIO_xferAck_i` | in | 1 |  |
| `MEM_DECODE_GEN_0_cs_out_i_reg_0` | out | 1 | |
| `s_axi_arready` | out | 1 | |
| `s_axi_wready` | out | 1 | |
| `Read_Reg2_In` | out | 4 | |
| `E` | out | 1 | |
| `Dual_gpio2_Data_Out_reg` | out | 1 | |
| `D` | out | 4 | |
| `Read_Reg_In` | out | 4 | |
| `Dual_gpio_OE_reg` | out | 1 | |
| `Dual_gpio_Data_Out_reg` | out | 1 | |
| `Read_Reg_Rst` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_133413.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
