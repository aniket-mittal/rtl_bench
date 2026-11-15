# Fill in the masked region of `origen_056654`

The file `origen_056654.v` holds a Verilog design whose top module is `origen_056654` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_056654`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_056654.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_056654` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_056654.v`. Only these files are graded.

## Interface of `origen_056654`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `aresetn` | in | 1 | reset, active low |
| `s_axis_tdata` | in | 16 |  |
| `s_axis_tvalid` | in | 1 |  |
| `s_axis_tdata_phase` | in | 16 |  |
| `s_axis_tvalid_phase` | in | 1 |  |
| `cfg_data` | in | 64 |  |
| `m_axis_tvalid` | out | 1 | |
| `m_axis_tdata` | out | 14 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_056654.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
