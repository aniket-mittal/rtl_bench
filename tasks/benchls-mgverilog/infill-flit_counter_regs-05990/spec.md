# Fill in the masked region of `mg_05990`

The file `mg_05990.v` holds a Verilog design whose top module is `mg_05990` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_05990`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_05990.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_05990` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_05990.v`. Only these files are graded.

## Interface of `mg_05990`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `clr_max` | in | 1 |  |
| `clr_inv_ids` | in | 1 |  |
| `clr_sel_cnt_inv` | in | 1 |  |
| `clr_sel_cnt` | in | 1 |  |
| `inc_sel_cnt` | in | 1 |  |
| `inc_sel_cnt_inv` | in | 1 |  |
| `en_flit_max_in` | in | 1 |  |
| `en_for_reg` | in | 1 |  |
| `en_inv_ids` | in | 1 |  |
| `inv_ids_in` | in | 4 |  |
| `dest_sel` | in | 1 |  |
| `flit_max_in` | in | 4 |  |
| `head_flit` | in | 16 |  |
| `addrhi` | in | 16 |  |
| `addrlo` | in | 16 |  |
| `flit_out` | out | 16 | |
| `cnt_eq_max` | out | 1 | |
| `cnt_invs_eq_3` | out | 1 | |
| `cnt_eq_0` | out | 1 | |
| `inv_ids_reg_out` | out | 4 | |
| `sel_cnt_invs_out` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_05990.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
