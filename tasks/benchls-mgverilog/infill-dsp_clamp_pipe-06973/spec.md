# Fill in the masked region of `mg_06973`

The file `mg_06973.v` holds a Verilog design whose top module is `mg_06973` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_06973`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_06973.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_06973` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_06973.v`. Only these files are graded.

## Interface of `mg_06973`

| port | dir | width | note |
|---|---|---|---|
| `aclk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `cfg_data` | in | 32 |  |
| `dsp_a_p` | in | 33 |  |
| `dsp_b_p` | in | 42 |  |
| `dsp_c_p` | in | 42 |  |
| `s_axis_tdata` | in | 16 |  |
| `s_axis_tvalid` | in | 1 |  |
| `m_axis_tready` | in | 1 |  |
| `dsp_a_a` | out | 16 | |
| `dsp_b_a` | out | 25 | |
| `dsp_b_c` | out | 42 | |
| `dsp_c_a` | out | 25 | |
| `dsp_c_c` | out | 42 | |
| `s_axis_tready` | out | 1 | |
| `m_axis_tdata` | out | 16 | |
| `m_axis_tvalid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_06973.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
