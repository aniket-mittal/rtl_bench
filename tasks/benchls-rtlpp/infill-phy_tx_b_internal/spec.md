# Fill in the masked region of `phy_tx_b_internal`

The file `phy_tx_b_internal.v` holds a Verilog design whose top module is `phy_tx_b_internal` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `phy_tx_b_internal`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `phy_tx_b_internal.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `phy_tx_b_internal` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `phy_tx_b_internal.v`. Only these files are graded.

## Interface of `phy_tx_b_internal`

| port | dir | width | note |
|---|---|---|---|
| `clk1f` | in | 1 | clock, rising edge |
| `clk2f` | in | 1 |  |
| `clk4f` | in | 1 |  |
| `clk32f` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `in0` | in | 8 |  |
| `in1` | in | 8 |  |
| `in2` | in | 8 |  |
| `in3` | in | 8 |  |
| `in_rx_tx` | in | 1 |  |
| `validmux41` | in | 4 |  |
| `out_b` | out | 1 | |
| `out0_recir` | out | 8 | |
| `out1_recir` | out | 8 | |
| `out2_recir` | out | 2 | |
| `out3_recir` | out | 2 | |
| `valid_out_recir` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v phy_tx_b_internal.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
