# Fill in the masked region of `mg_07819`

The file `mg_07819.v` holds a Verilog design whose top module is `mg_07819` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `mg_07819` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_07819.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_07819` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_07819.v`. Only these files are graded.

## Interface of `mg_07819`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `m_wr_rs` | in | 1 |  |
| `m_rq_cyc` | in | 1 |  |
| `m_rd_rq` | in | 1 |  |
| `m_wr_rq` | in | 1 |  |
| `m_ma` | in | 15 |  |
| `m_sel` | in | 4 |  |
| `m_fmc_select` | in | 1 |  |
| `m_mb_write` | in | 36 |  |
| `s0_addr_ack` | in | 1 |  |
| `s0_rd_rs` | in | 1 |  |
| `s0_mb_read` | in | 36 |  |
| `m_addr_ack` | out | 1 | |
| `m_rd_rs` | out | 1 | |
| `m_mb_read` | out | 36 | |
| `s0_wr_rs` | out | 1 | |
| `s0_rq_cyc` | out | 1 | |
| `s0_rd_rq` | out | 1 | |
| `s0_wr_rq` | out | 1 | |
| `s0_ma` | out | 15 | |
| `s0_sel` | out | 4 | |
| `s0_fmc_select` | out | 1 | |
| `s0_mb_write` | out | 36 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_07819.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
