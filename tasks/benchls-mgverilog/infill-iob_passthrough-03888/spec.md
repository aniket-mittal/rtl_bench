# Fill in the masked region of `mg_03888`

The file `mg_03888.v` holds a Verilog design whose top module is `mg_03888` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `mg_03888` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03888.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03888` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03888.v`. Only these files are graded.

## Interface of `mg_03888`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `m_iob_poweron` | in | 1 |  |
| `m_iob_reset` | in | 1 |  |
| `m_datao_clear` | in | 1 |  |
| `m_datao_set` | in | 1 |  |
| `m_cono_clear` | in | 1 |  |
| `m_cono_set` | in | 1 |  |
| `m_iob_fm_datai` | in | 1 |  |
| `m_iob_fm_status` | in | 1 |  |
| `m_rdi_pulse` | in | 1 |  |
| `m_ios` | in | 7 |  |
| `m_iob_write` | in | 36 |  |
| `s0_pi_req` | in | 7 |  |
| `s0_iob_read` | in | 36 |  |
| `s0_dr_split` | in | 1 |  |
| `s0_rdi_data` | in | 1 |  |
| `m_pi_req` | out | 7 | |
| `m_iob_read` | out | 36 | |
| `m_dr_split` | out | 1 | |
| `m_rdi_data` | out | 1 | |
| `s0_iob_poweron` | out | 1 | |
| `s0_iob_reset` | out | 1 | |
| `s0_datao_clear` | out | 1 | |
| `s0_datao_set` | out | 1 | |
| `s0_cono_clear` | out | 1 | |
| `s0_cono_set` | out | 1 | |
| `s0_iob_fm_datai` | out | 1 | |
| `s0_iob_fm_status` | out | 1 | |
| `s0_rdi_pulse` | out | 1 | |
| `s0_ios` | out | 7 | |
| `s0_iob_write` | out | 36 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03888.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
