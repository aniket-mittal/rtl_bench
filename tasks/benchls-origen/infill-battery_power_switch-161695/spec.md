# Fill in the masked region of `origen_161695`

The file `origen_161695.v` holds a Verilog design whose top module is `origen_161695` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_161695`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_161695.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_161695` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_161695.v`. Only these files are graded.

## Interface of `origen_161695`

| port | dir | width | note |
|---|---|---|---|
| `MCU_CLK_IN` | in | 1 | clock, rising edge |
| `nRST` | in | 1 | reset, active high |
| `MCU_IN_BATT_1_EN` | in | 1 |  |
| `MCU_IN_BATT_2_EN` | in | 1 |  |
| `MCU_IN_BATT_BOTH_EN` | in | 1 |  |
| `MCU_IN_EN` | in | 9 |  |
| `KILLSWITCH_RED` | in | 1 |  |
| `BATT_1_EN` | out | 1 | |
| `BATT_2_EN` | out | 1 | |
| `nBATT_BOTH_EN` | out | 1 | |
| `PWR_OUT_EN` | out | 7 | |
| `nPWR_OUT_EN_8` | out | 1 | |
| `nPWR_OUT_EN_9` | out | 1 | |
| `MCU_OUT_KILLSWITCH_ACTIVE` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_161695.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
