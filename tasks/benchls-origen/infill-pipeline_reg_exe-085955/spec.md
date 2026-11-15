# Fill in the masked region of `origen_085955`

The file `origen_085955.v` holds a Verilog design whose top module is `origen_085955` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_085955`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_085955.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_085955` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_085955.v`. Only these files are graded.

## Interface of `origen_085955`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rsn_i` | in | 1 | reset, active low |
| `stall_core_i` | in | 1 |  |
| `decode_stall_i` | in | 1 |  |
| `kill_i` | in | 1 |  |
| `dec_read_data_a_i` | in | 32 |  |
| `dec_read_data_b_i` | in | 32 |  |
| `dec_write_addr_i` | in | 5 |  |
| `dec_int_write_enable_i` | in | 1 |  |
| `dec_tlbwrite_i` | in | 1 |  |
| `dec_idtlb_i` | in | 1 |  |
| `dec_exc_bits_i` | in | 4 |  |
| `dec_instruction_i` | in | 32 |  |
| `dec_pc_i` | in | 32 |  |
| `dec_pred_pc_i` | in | 32 |  |
| `dec_prediction_i` | in | 1 |  |
| `dec_taken_i` | in | 1 |  |
| `exe_read_data_a_o` | out | 32 | |
| `exe_read_data_b_o` | out | 32 | |
| `exe_write_addr_o` | out | 5 | |
| `exe_int_write_enable_o` | out | 1 | |
| `exe_tlbwrite_o` | out | 1 | |
| `exe_idtlb_o` | out | 1 | |
| `exe_exc_bits_o` | out | 4 | |
| `exe_instruction_o` | out | 32 | |
| `exe_pc_o` | out | 32 | |
| `exe_pred_pc_o` | out | 32 | |
| `exe_prediction_o` | out | 1 | |
| `exe_taken_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_085955.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
