# Fill in the masked region of `mg_03121`

The file `mg_03121.v` holds a Verilog design whose top module is `mg_03121` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_03121`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03121.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03121` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03121.v`. Only these files are graded.

## Interface of `mg_03121`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `resetn` | in | 1 | reset, active low |
| `merge_node_valid_in_0_staging_reg` | in | 1 |  |
| `merge_node_valid_in_1_staging_reg` | in | 1 |  |
| `valid_in_0` | in | 1 |  |
| `valid_in_1` | in | 1 |  |
| `merge_stalled_by_successors` | in | 1 |  |
| `workgroup_size` | in | 10 |  |
| `merge_block_selector` | out | 1 | |
| `is_merge_data_to_local_regs_valid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03121.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
