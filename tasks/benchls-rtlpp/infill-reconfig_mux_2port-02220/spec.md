# Fill in the masked region of `rtlpp_02220`

The file `rtlpp_02220.v` holds a Verilog design whose top module is `rtlpp_02220` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02220`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02220.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02220` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02220.v`. Only these files are graded.

## Interface of `rtlpp_02220`

| port | dir | width | note |
|---|---|---|---|
| `rcfg_clk` | in | 1 | clock, rising edge |
| `rcfg_reset_n` | in | 1 | reset, active low |
| `rcfg_in_read_0` | in | 1 |  |
| `rcfg_in_write_0` | in | 1 |  |
| `rcfg_in_address_0` | in | 10 |  |
| `rcfg_in_writedata_0` | in | 32 |  |
| `rcfg_in_read_1` | in | 1 |  |
| `rcfg_in_write_1` | in | 1 |  |
| `rcfg_in_address_1` | in | 10 |  |
| `rcfg_in_writedata_1` | in | 32 |  |
| `rcfg_out_readdata_0` | in | 32 |  |
| `rcfg_out_waitrequest_0` | in | 1 |  |
| `rcfg_out_readdata_1` | in | 32 |  |
| `rcfg_out_waitrequest_1` | in | 1 |  |
| `rcfg_in_readdata_0` | out | 32 | |
| `rcfg_in_waitrequest_0` | out | 1 | |
| `rcfg_in_readdata_1` | out | 32 | |
| `rcfg_in_waitrequest_1` | out | 1 | |
| `rcfg_out_read_0` | out | 1 | |
| `rcfg_out_write_0` | out | 1 | |
| `rcfg_out_address_0` | out | 10 | |
| `rcfg_out_writedata_0` | out | 32 | |
| `rcfg_out_read_1` | out | 1 | |
| `rcfg_out_write_1` | out | 1 | |
| `rcfg_out_address_1` | out | 10 | |
| `rcfg_out_writedata_1` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02220.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
