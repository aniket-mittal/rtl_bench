# Fill in the masked region of `autovcoder_023412`

The file `autovcoder_023412.v` holds a Verilog design whose top module is `autovcoder_023412` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_023412`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_023412.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_023412` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_023412.v`. Only these files are graded.

## Interface of `autovcoder_023412`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `reg_cp0_addr` | in | 5 |  |
| `reg_cp0_sel` | in | 3 |  |
| `val_from_cp0` | in | 1 |  |
| `ex_cp0_write_enable` | in | 1 |  |
| `ex_cp0_write_addr` | in | 5 |  |
| `ex_cp0_sel` | in | 3 |  |
| `val_from_ex` | in | 32 |  |
| `mm_cp0_write_enable` | in | 1 |  |
| `mm_cp0_write_addr` | in | 1 |  |
| `mm_cp0_sel` | in | 1 |  |
| `val_from_mm` | in | 1 |  |
| `wb_cp0_write_enable` | in | 1 |  |
| `wb_cp0_write_addr` | in | 1 |  |
| `wb_cp0_sel` | in | 1 |  |
| `val_from_wb` | in | 1 |  |
| `val_output` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_023412.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
