# Fill in the masked region of `autovcoder_095558`

The file `autovcoder_095558.v` holds a Verilog design whose top module is `autovcoder_095558` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_095558`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_095558.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_095558` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_095558.v`. Only these files are graded.

## Interface of `autovcoder_095558`

| port | dir | width | note |
|---|---|---|---|
| `WCLK` | in | 1 | clock, rising edge |
| `WE` | in | 1 |  |
| `ADDRA` | in | 6 |  |
| `DIA` | in | 1 |  |
| `ADDRB` | in | 6 |  |
| `DIB` | in | 1 |  |
| `ADDRC` | in | 6 |  |
| `DIC` | in | 1 |  |
| `ADDRD` | in | 6 |  |
| `DID` | in | 1 |  |
| `ADDRE` | in | 6 |  |
| `DIE` | in | 1 |  |
| `ADDRF` | in | 6 |  |
| `DIF` | in | 1 |  |
| `ADDRG` | in | 6 |  |
| `DIG` | in | 1 |  |
| `ADDRH` | in | 6 |  |
| `DIH` | in | 1 |  |
| `DOA` | out | 1 | |
| `DOB` | out | 1 | |
| `DOC` | out | 1 | |
| `DOD` | out | 1 | |
| `DOE` | out | 1 | |
| `DOF` | out | 1 | |
| `DOG` | out | 1 | |
| `DOH` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_095558.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
