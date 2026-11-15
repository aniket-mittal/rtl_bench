# Fill in the masked region of `autovcoder_005001`

The file `autovcoder_005001.v` holds a Verilog design whose top module is `autovcoder_005001` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_005001`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_005001.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_005001` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_005001.v`. Only these files are graded.

## Interface of `autovcoder_005001`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset_n` | in | 1 | reset, active low |
| `in_data_0` | in | 32 |  |
| `in_valid_0` | in | 1 |  |
| `in_startofpacket_0` | in | 1 |  |
| `in_endofpacket_0` | in | 1 |  |
| `in_empty_0` | in | 2 |  |
| `in_error_0` | in | 1 |  |
| `in_data_1` | in | 32 |  |
| `in_valid_1` | in | 1 |  |
| `in_startofpacket_1` | in | 1 |  |
| `in_endofpacket_1` | in | 1 |  |
| `in_empty_1` | in | 2 |  |
| `in_error_1` | in | 1 |  |
| `out_ready` | in | 1 |  |
| `control_address` | in | 1 |  |
| `control_write` | in | 1 |  |
| `control_read` | in | 1 |  |
| `control_writedata` | in | 32 |  |
| `in_ready_0` | out | 1 | |
| `in_ready_1` | out | 1 | |
| `out_data` | out | 32 | |
| `out_valid` | out | 1 | |
| `out_startofpacket` | out | 1 | |
| `out_endofpacket` | out | 1 | |
| `out_empty` | out | 2 | |
| `out_error` | out | 1 | |
| `control_readdata` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_005001.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
