# Fill in the masked region of `mg_07030`

The file `mg_07030.v` holds a Verilog design whose top module is `mg_07030` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_07030`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_07030.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_07030` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_07030.v`. Only these files are graded.

## Interface of `mg_07030`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `tx_en` | in | 1 |  |
| `tx_data_loaded` | in | 1 |  |
| `rb0` | in | 7 |  |
| `rb1` | in | 7 |  |
| `rb2` | in | 7 |  |
| `rb3` | in | 7 |  |
| `rb4` | in | 7 |  |
| `rb5` | in | 7 |  |
| `rb6` | in | 7 |  |
| `rb7` | in | 7 |  |
| `rb8` | in | 7 |  |
| `rb9` | in | 7 |  |
| `rb10` | in | 7 |  |
| `rb11` | in | 7 |  |
| `rb12` | in | 7 |  |
| `rb13` | in | 7 |  |
| `rb14` | in | 7 |  |
| `tx_data_ready` | out | 1 | |
| `tx_data` | out | 7 | |
| `tx_complete` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_07030.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
