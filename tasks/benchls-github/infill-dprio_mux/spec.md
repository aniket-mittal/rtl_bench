# Fill in the masked region of `dprio_mux`

The file `dprio_mux.v` holds a Verilog design whose top module is `dprio_mux` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `dprio_mux`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: SEC-Flow-Star-repos-28.darkriscv.

## Rules

- Edit only `dprio_mux.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `dprio_mux` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `dprio_mux.v`. Only these files are graded.

## Interface of `dprio_mux`

| port | dir | width | note |
|---|---|---|---|
| `init_dprio_address` | in | 6 |  |
| `init_dprio_read` | in | 1 |  |
| `init_dprio_byteen` | in | 2 |  |
| `init_dprio_write` | in | 1 |  |
| `init_dprio_writedata` | in | 16 |  |
| `init_atpgmode` | in | 1 |  |
| `init_mdio_dis` | in | 1 |  |
| `init_scanen` | in | 1 |  |
| `init_ser_shift_load` | in | 1 |  |
| `dprio_init_done` | in | 1 |  |
| `avmm_dprio_address` | in | 6 |  |
| `avmm_dprio_read` | in | 1 |  |
| `avmm_dprio_byteen` | in | 2 |  |
| `avmm_dprio_write` | in | 1 |  |
| `avmm_dprio_writedata` | in | 16 |  |
| `avmm_atpgmode` | in | 1 |  |
| `avmm_mdio_dis` | in | 1 |  |
| `avmm_scanen` | in | 1 |  |
| `avmm_ser_shift_load` | in | 1 |  |
| `dprio_address` | out | 6 | |
| `dprio_read` | out | 1 | |
| `dprio_byteen` | out | 2 | |
| `dprio_write` | out | 1 | |
| `dprio_writedata` | out | 16 | |
| `atpgmode` | out | 1 | |
| `mdio_dis` | out | 1 | |
| `scanen` | out | 1 | |
| `ser_shift_load` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dprio_mux.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
