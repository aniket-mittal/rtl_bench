# Fill in the masked region of `rtlpp_01151`

The file `rtlpp_01151.v` holds a Verilog design whose top module is `rtlpp_01151` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_01151`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01151.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01151` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01151.v`. Only these files are graded.

## Interface of `rtlpp_01151`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `mm_response_read` | in | 1 |  |
| `mm_response_address` | in | 1 |  |
| `mm_response_byteenable` | in | 4 |  |
| `src_response_ready` | in | 1 |  |
| `sw_reset` | in | 1 |  |
| `done_strobe` | in | 1 |  |
| `actual_bytes_transferred` | in | 32 |  |
| `error` | in | 8 |  |
| `early_termination` | in | 1 |  |
| `transfer_complete_IRQ_mask` | in | 1 |  |
| `error_IRQ_mask` | in | 8 |  |
| `early_termination_IRQ_mask` | in | 1 |  |
| `descriptor_buffer_full` | in | 1 |  |
| `mm_response_readdata` | out | 32 | |
| `mm_response_waitrequest` | out | 1 | |
| `src_response_data` | out | 256 | |
| `src_response_valid` | out | 1 | |
| `response_watermark` | out | 16 | |
| `response_fifo_full` | out | 1 | |
| `response_fifo_empty` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01151.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
