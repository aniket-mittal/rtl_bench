# Fill in the masked region of `origen_002070`

The file `origen_002070.v` holds a Verilog design whose top module is `origen_002070` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_002070`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_002070.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_002070` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_002070.v`. Only these files are graded.

## Interface of `origen_002070`

| port | dir | width | note |
|---|---|---|---|
| `Sclk` | in | 1 | clock, rising edge |
| `Dclk` | in | 1 |  |
| `Frame` | in | 1 |  |
| `S2P_status` | in | 1 |  |
| `sleep_status` | in | 1 |  |
| `Reset_n` | in | 1 | reset, active low |
| `col` | in | 32 |  |
| `rj_status` | out | 1 | |
| `coeff_status` | out | 1 | |
| `in_status` | out | 1 | |
| `alu_status` | out | 1 | |
| `address_rj` | out | 8 | |
| `address_coeff` | out | 8 | |
| `address_in` | out | 8 | |
| `cont_address` | out | 10 | |
| `InReady` | out | 1 | |
| `Start` | out | 1 | |
| `clear` | out | 1 | |
| `set` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_002070.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
