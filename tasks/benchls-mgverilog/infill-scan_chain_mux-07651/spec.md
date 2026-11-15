# Fill in the masked region of `mg_07651`

The file `mg_07651.v` holds a Verilog design whose top module is `mg_07651` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_07651`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_07651.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_07651` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_07651.v`. Only these files are graded.

## Interface of `mg_07651`

| port | dir | width | note |
|---|---|---|---|
| `ctu_tst_pre_grst_l` | in | 1 |  |
| `arst_l` | in | 1 | reset, active high |
| `global_shift_enable` | in | 1 |  |
| `ctu_tst_scan_disable` | in | 1 |  |
| `ctu_tst_scanmode` | in | 1 |  |
| `ctu_tst_macrotest` | in | 1 |  |
| `ctu_tst_short_chain` | in | 1 |  |
| `long_chain_so_0` | in | 1 |  |
| `short_chain_so_0` | in | 1 |  |
| `long_chain_so_1` | in | 1 |  |
| `short_chain_so_1` | in | 1 |  |
| `long_chain_so_2` | in | 1 |  |
| `short_chain_so_2` | in | 1 |  |
| `mux_drive_disable` | out | 1 | |
| `mem_write_disable` | out | 1 | |
| `sehold` | out | 1 | |
| `se` | out | 1 | |
| `testmode_l` | out | 1 | |
| `mem_bypass` | out | 1 | |
| `so_0` | out | 1 | |
| `so_1` | out | 1 | |
| `so_2` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_07651.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
