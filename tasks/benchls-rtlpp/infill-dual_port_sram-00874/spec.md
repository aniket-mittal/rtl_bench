# Fill in the masked region of `rtlpp_00874`

The file `rtlpp_00874.v` holds a Verilog design whose top module is `rtlpp_00874` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `rtlpp_00874` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_00874.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_00874` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_00874.v`. Only these files are graded.

## Interface of `rtlpp_00874`

| port | dir | width | note |
|---|---|---|---|
| `CLKA` | in | 1 |  |
| `CENA` | in | 1 |  |
| `AA` | in | 8 |  |
| `CLKB` | in | 1 |  |
| `CENB` | in | 1 |  |
| `AB` | in | 8 |  |
| `DB` | in | 19 |  |
| `EMAA` | in | 3 |  |
| `EMASA` | in | 1 |  |
| `EMAB` | in | 3 |  |
| `TENA` | in | 1 |  |
| `TCENA` | in | 1 |  |
| `TAA` | in | 8 |  |
| `TENB` | in | 1 |  |
| `TCENB` | in | 1 |  |
| `TAB` | in | 8 |  |
| `TDB` | in | 19 |  |
| `RET1N` | in | 1 |  |
| `SIA` | in | 2 |  |
| `SEA` | in | 1 |  |
| `DFTRAMBYP` | in | 1 |  |
| `SIB` | in | 2 |  |
| `SEB` | in | 1 |  |
| `COLLDISN` | in | 1 |  |
| `CENYA` | out | 1 | |
| `AYA` | out | 8 | |
| `CENYB` | out | 1 | |
| `AYB` | out | 8 | |
| `QA` | out | 19 | |
| `SOA` | out | 2 | |
| `SOB` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_00874.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
