# Fill in the masked region of `mg_02824`

The file `mg_02824.v` holds a Verilog design whose top module is `mg_02824` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_02824`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_02824.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_02824` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_02824.v`. Only these files are graded.

## Interface of `mg_02824`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `isDispatch` | in | 1 |  |
| `isSW` | in | 1 |  |
| `RegDest` | in | 1 |  |
| `PR_old_DP` | in | 6 |  |
| `PR_new_DP` | in | 6 |  |
| `rd_DP` | in | 5 |  |
| `complete` | in | 1 |  |
| `rob_number` | in | 4 |  |
| `jb_addr` | in | 32 |  |
| `changeFlow` | in | 1 |  |
| `hazard_stall` | in | 1 |  |
| `rob_num_dp` | out | 4 | |
| `PR_old_RT` | out | 6 | |
| `RegDest_retire` | out | 1 | |
| `retire_reg` | out | 1 | |
| `retire_ST` | out | 1 | |
| `retire_rob` | out | 4 | |
| `full` | out | 1 | |
| `empty` | out | 1 | |
| `RegDest_out` | out | 1 | |
| `PR_old_flush` | out | 6 | |
| `PR_new_flush` | out | 6 | |
| `rd_flush` | out | 5 | |
| `out_rob_num` | out | 4 | |
| `changeFlow_out` | out | 1 | |
| `changeFlow_addr` | out | 32 | |
| `recover` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_02824.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
