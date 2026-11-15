# Fill in the masked region of `mg_10586`

The file `mg_10586.v` holds a Verilog design whose top module is `mg_10586` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_10586`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_10586.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_10586` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_10586.v`. Only these files are graded.

## Interface of `mg_10586`

| port | dir | width | note |
|---|---|---|---|
| `io_mainClk` | in | 1 | clock, rising edge |
| `io_iBus_cmd_valid` | in | 1 |  |
| `io_iBus_cmd_payload_pc` | in | 32 |  |
| `io_dBus_cmd_valid` | in | 1 |  |
| `io_dBus_cmd_payload_wr` | in | 1 |  |
| `io_dBus_cmd_payload_address` | in | 32 |  |
| `io_dBus_cmd_payload_data` | in | 32 |  |
| `io_dBus_cmd_payload_size` | in | 2 |  |
| `io_masterBus_cmd_ready` | in | 1 |  |
| `io_masterBus_rsp_valid` | in | 1 |  |
| `io_masterBus_rsp_payload_data` | in | 32 |  |
| `resetCtrl_systemReset` | in | 1 | reset, active high |
| `io_iBus_cmd_ready` | out | 1 | |
| `io_iBus_rsp_ready` | out | 1 | |
| `io_iBus_rsp_error` | out | 1 | |
| `io_iBus_rsp_inst` | out | 32 | |
| `io_dBus_cmd_ready` | out | 1 | |
| `io_dBus_rsp_ready` | out | 1 | |
| `io_dBus_rsp_error` | out | 1 | |
| `io_dBus_rsp_data` | out | 32 | |
| `io_masterBus_cmd_valid` | out | 1 | |
| `io_masterBus_cmd_payload_wr` | out | 1 | |
| `io_masterBus_cmd_payload_address` | out | 32 | |
| `io_masterBus_cmd_payload_data` | out | 32 | |
| `io_masterBus_cmd_payload_mask` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_10586.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
