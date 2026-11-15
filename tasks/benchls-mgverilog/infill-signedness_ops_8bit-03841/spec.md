# Fill in the masked region of `mg_03841`

The file `mg_03841.v` holds a Verilog design whose top module is `mg_03841` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_03841`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03841.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03841` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03841.v`. Only these files are graded.

## Interface of `mg_03841`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `c` | in | 6 |  |
| `mux_uu` | out | 16 | |
| `mux_us` | out | 16 | |
| `mux_su` | out | 16 | |
| `mux_ss` | out | 16 | |
| `eql_uu` | out | 1 | |
| `eql_us` | out | 1 | |
| `eql_su` | out | 1 | |
| `eql_ss` | out | 1 | |
| `neq_uu` | out | 1 | |
| `neq_us` | out | 1 | |
| `neq_su` | out | 1 | |
| `neq_ss` | out | 1 | |
| `sgn_u` | out | 16 | |
| `sgn_s` | out | 16 | |
| `add_uu` | out | 16 | |
| `add_us` | out | 16 | |
| `add_su` | out | 16 | |
| `add_ss` | out | 16 | |
| `sub_uu` | out | 16 | |
| `sub_us` | out | 16 | |
| `sub_su` | out | 16 | |
| `sub_ss` | out | 16 | |
| `mul_uu` | out | 16 | |
| `mul_us` | out | 16 | |
| `mul_su` | out | 16 | |
| `mul_ss` | out | 16 | |
| `ltn_uu` | out | 1 | |
| `ltn_us` | out | 1 | |
| `ltn_su` | out | 1 | |
| `ltn_ss` | out | 1 | |
| `leq_uu` | out | 1 | |
| `leq_us` | out | 1 | |
| `leq_su` | out | 1 | |
| `leq_ss` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03841.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
