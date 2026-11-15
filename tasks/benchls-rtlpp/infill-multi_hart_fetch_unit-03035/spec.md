# Fill in the masked region of `rtlpp_03035`

The file `rtlpp_03035.v` holds a Verilog design whose top module is `rtlpp_03035` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_03035`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_03035.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_03035` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_03035.v`. Only these files are graded.

## Interface of `rtlpp_03035`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `insn` | in | 32 |  |
| `data_rdy` | in | 1 |  |
| `stall` | in | 1 |  |
| `flush` | in | 1 |  |
| `new_pc` | in | 32 |  |
| `cache_miss` | in | 1 |  |
| `cm_hart_id` | in | 4 |  |
| `cm_addr` | in | 32 |  |
| `br_hart_id` | in | 4 |  |
| `br_taken` | in | 1 |  |
| `br_addr` | in | 32 |  |
| `hart_id` | in | 4 |  |
| `id_hstart` | in | 1 |  |
| `id_hidle` | in | 1 |  |
| `id_hs_id` | in | 4 |  |
| `id_hs_pc` | in | 32 |  |
| `if_pc` | out | 32 | |
| `pc` | out | 32 | |
| `if_npc` | out | 32 | |
| `if_insn` | out | 32 | |
| `if_en` | out | 1 | |
| `if_hart_id` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_03035.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
