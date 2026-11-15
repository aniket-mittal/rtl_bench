# Fill in the masked region of `rtlpp_02186`

The file `rtlpp_02186.v` holds a Verilog design whose top module is `rtlpp_02186` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_02186`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02186.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02186` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02186.v`. Only these files are graded.

## Interface of `rtlpp_02186`

| port | dir | width | note |
|---|---|---|---|
| `read_command_data_in` | in | 256 |  |
| `read_stop` | in | 1 |  |
| `read_sw_reset` | in | 1 | reset, active high |
| `read_command_data_out` | out | 256 | |
| `read_address` | out | 64 | |
| `read_length` | out | 32 | |
| `read_transmit_channel` | out | 8 | |
| `read_generate_sop` | out | 1 | |
| `read_generate_eop` | out | 1 | |
| `read_park` | out | 1 | |
| `read_transfer_complete_IRQ_mask` | out | 1 | |
| `read_burst_count` | out | 8 | |
| `read_stride` | out | 16 | |
| `read_sequence_number` | out | 16 | |
| `read_transmit_error` | out | 8 | |
| `read_early_done_enable` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02186.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
