# Fill in the masked region of `mg_02105`

The file `mg_02105.v` holds a Verilog design whose top module is `mg_02105` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_02105`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_02105.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_02105` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_02105.v`. Only these files are graded.

## Interface of `mg_02105`

| port | dir | width | note |
|---|---|---|---|
| `CLKA` | in | 1 | clock, rising edge |
| `RSTA` | in | 1 | reset, active high |
| `ADDRA` | in | 8 |  |
| `DIA` | in | 16 |  |
| `ENA` | in | 1 |  |
| `WEA` | in | 1 |  |
| `CLKB` | in | 1 |  |
| `RSTB` | in | 1 |  |
| `ADDRB` | in | 8 |  |
| `DIB` | in | 16 |  |
| `ENB` | in | 1 |  |
| `WEB` | in | 1 |  |
| `DOA` | out | 16 | |
| `DOB` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_02105.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
