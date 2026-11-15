# Fill in the masked region of `mg_09954`

The file `mg_09954.v` holds a Verilog design whose top module is `mg_09954` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_09954`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_09954.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_09954` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_09954.v`. Only these files are graded.

## Interface of `mg_09954`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `ex_exu_result` | in | 32 |  |
| `ex_mem_store_data` | in | 32 |  |
| `ex_mem_write` | in | 1 |  |
| `ex_mem_read` | in | 1 |  |
| `ex_mem_byte` | in | 1 |  |
| `ex_mem_halfword` | in | 1 |  |
| `ex_mem_sign_ext` | in | 1 |  |
| `ex_mem_exu_mem_select` | in | 1 |  |
| `ex_gpr_wa` | in | 5 |  |
| `ex_gpr_we` | in | 1 |  |
| `ex_kernel_mode` | in | 1 |  |
| `ex_pc_current` | in | 32 |  |
| `ex_mem_can_exc` | in | 1 |  |
| `ex_flush` | in | 1 |  |
| `ex_stall` | in | 1 |  |
| `mem_stall` | in | 1 |  |
| `mem_exu_result` | out | 32 | |
| `mem_mem_store_data` | out | 32 | |
| `mem_mem_write` | out | 1 | |
| `mem_mem_read` | out | 1 | |
| `mem_mem_byte` | out | 1 | |
| `mem_mem_halfword` | out | 1 | |
| `mem_mem_sign_ext` | out | 1 | |
| `mem_mem_exu_mem_select` | out | 1 | |
| `mem_gpr_wa` | out | 5 | |
| `mem_gpr_we` | out | 1 | |
| `mem_kernel_mode` | out | 1 | |
| `mem_pc_current` | out | 32 | |
| `mem_mem_can_exc` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_09954.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
