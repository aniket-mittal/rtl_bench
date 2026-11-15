# Fill in the masked region of `mg_08380`

The file `mg_08380.v` holds a Verilog design whose top module is `mg_08380` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `mg_08380` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_08380.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_08380` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_08380.v`. Only these files are graded.

## Interface of `mg_08380`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `slave_address` | in | 3 |  |
| `slave_read` | in | 1 |  |
| `slave_write` | in | 1 |  |
| `slave_writedata` | in | 32 |  |
| `reset` | in | 1 | reset, active high |
| `i2c_hs_readdata` | in | 32 |  |
| `slave_readdata` | out | 32 | |
| `i2c_hs_read` | out | 1 | |
| `i2c_hs_write` | out | 1 | |
| `i2c_hs_addr` | out | 3 | |
| `i2c_hs_writedata` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_08380.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
