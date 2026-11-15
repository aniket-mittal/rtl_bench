# Fill in the masked region of `rtlpp_04291`

The file `rtlpp_04291.v` holds a Verilog design whose top module is `rtlpp_04291` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_04291` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_04291.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_04291` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_04291.v`. Only these files are graded.

## Interface of `rtlpp_04291`

| port | dir | width | note |
|---|---|---|---|
| `ap_clk` | in | 1 | clock, rising edge |
| `lpcore_init_event_stream_0_dout` | in | 129 |  |
| `lpcore_init_event_stream_0_empty_n` | in | 1 |  |
| `lpcore_init_event_stream_1_dout` | in | 129 |  |
| `lpcore_init_event_stream_1_empty_n` | in | 1 |  |
| `lpcore_event_queue_full_stream_0_full_n` | in | 1 |  |
| `lpcore_event_queue_full_stream_1_full_n` | in | 1 |  |
| `lpcore_anti_message_stream_0_dout` | in | 129 |  |
| `lpcore_anti_message_stream_0_empty_n` | in | 1 |  |
| `lpcore_anti_message_stream_1_dout` | in | 129 |  |
| `lpcore_anti_message_stream_1_empty_n` | in | 1 |  |
| `lpcore_enqueue_event_stream_0_dout` | in | 129 |  |
| `lpcore_enqueue_event_stream_0_empty_n` | in | 1 |  |
| `lpcore_enqueue_event_stream_1_dout` | in | 129 |  |
| `lpcore_enqueue_event_stream_1_empty_n` | in | 1 |  |
| `lpcore_output_event_stream_0_full_n` | in | 1 |  |
| `lpcore_output_event_stream_1_full_n` | in | 1 |  |
| `lpcore_cancellation_unit_output_stream_0_full_n` | in | 1 |  |
| `lpcore_cancellation_unit_output_stream_1_full_n` | in | 1 |  |
| `lpcore_commit_time_stream_0_dout` | in | 32 |  |
| `lpcore_commit_time_stream_0_empty_n` | in | 1 |  |
| `lpcore_commit_time_stream_1_dout` | in | 32 |  |
| `lpcore_commit_time_stream_1_empty_n` | in | 1 |  |
| `ap_rst` | in | 1 | reset, active high |
| `lpcore_init_event_stream_0_read` | out | 1 | |
| `lpcore_init_event_stream_1_read` | out | 1 | |
| `lpcore_event_queue_full_stream_0_din` | out | 1 | |
| `lpcore_event_queue_full_stream_0_write` | out | 1 | |
| `lpcore_event_queue_full_stream_1_din` | out | 1 | |
| `lpcore_event_queue_full_stream_1_write` | out | 1 | |
| `lpcore_anti_message_stream_0_read` | out | 1 | |
| `lpcore_anti_message_stream_1_read` | out | 1 | |
| `lpcore_enqueue_event_stream_0_read` | out | 1 | |
| `lpcore_enqueue_event_stream_1_read` | out | 1 | |
| `lpcore_output_event_stream_0_din` | out | 129 | |
| `lpcore_output_event_stream_0_write` | out | 1 | |
| `lpcore_output_event_stream_1_din` | out | 129 | |
| `lpcore_output_event_stream_1_write` | out | 1 | |
| `lpcore_cancellation_unit_output_stream_0_din` | out | 129 | |
| `lpcore_cancellation_unit_output_stream_0_write` | out | 1 | |
| `lpcore_cancellation_unit_output_stream_1_din` | out | 129 | |
| `lpcore_cancellation_unit_output_stream_1_write` | out | 1 | |
| `lpcore_commit_time_stream_0_read` | out | 1 | |
| `lpcore_commit_time_stream_1_read` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_04291.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
