# Fill in the masked region of `origen_209125`

The file `origen_209125.v` holds a Verilog design whose top module is `origen_209125` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_209125`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_209125.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_209125` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_209125.v`. Only these files are graded.

## Interface of `origen_209125`

| port | dir | width | note |
|---|---|---|---|
| `Level` | in | 3 |  |
| `password_auth` | in | 1 |  |
| `user_id` | in | 4 |  |
| `Password` | in | 4 |  |
| `RNG1` | in | 4 |  |
| `RNG2` | in | 4 |  |
| `PlayerTIn` | in | 4 |  |
| `PlayerUIn` | in | 4 |  |
| `FRndOrig` | in | 4 |  |
| `FRndEncryp` | in | 4 |  |
| `SRndEncryp` | in | 4 |  |
| `SRndOrig` | in | 4 |  |
| `SC_Tens_l2` | in | 4 |  |
| `SC_Units_l2` | in | 4 |  |
| `SC_Tens_l3` | in | 4 |  |
| `SC_Units_l3` | in | 4 |  |
| `index` | in | 4 |  |
| `NumOut1` | out | 4 | |
| `NumOut2` | out | 4 | |
| `NumOut3` | out | 4 | |
| `NumOut4` | out | 4 | |
| `NumOut5` | out | 4 | |
| `NumOut6` | out | 4 | |
| `Encrypt_on1` | out | 1 | |
| `Encrypt_on2` | out | 1 | |
| `Encrypt_on3` | out | 1 | |
| `Encrypt_on4` | out | 1 | |
| `Encrypt_on5` | out | 1 | |
| `Encrypt_on6` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_209125.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
