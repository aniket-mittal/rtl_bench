# Fill in the masked region of `mg_04136`

The file `mg_04136.v` holds a Verilog design whose top module is `mg_04136` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_04136`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_04136.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_04136` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_04136.v`. Only these files are graded.

## Interface of `mg_04136`

| port | dir | width | note |
|---|---|---|---|
| `tx_lclk_par` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `etx_access` | in | 1 |  |
| `etx_write` | in | 1 |  |
| `etx_datamode` | in | 2 |  |
| `etx_ctrlmode` | in | 4 |  |
| `etx_dstaddr` | in | 32 |  |
| `etx_srcaddr` | in | 32 |  |
| `etx_data` | in | 32 |  |
| `tx_rd_wait` | in | 1 |  |
| `tx_wr_wait` | in | 1 |  |
| `etx_rd_wait` | out | 1 | |
| `etx_wr_wait` | out | 1 | |
| `etx_ack` | out | 1 | |
| `tx_frame_par` | out | 8 | |
| `tx_data_par` | out | 64 | |
| `ecfg_tx_datain` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_04136.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
