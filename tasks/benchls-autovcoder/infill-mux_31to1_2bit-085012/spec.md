# Fill in the masked region of `autovcoder_085012`

The file `autovcoder_085012.v` holds a Verilog design whose top module is `autovcoder_085012` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_085012`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_085012.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_085012` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_085012.v`. Only these files are graded.

## Interface of `autovcoder_085012`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 5 |  |
| `inp0` | in | 2 |  |
| `inp1` | in | 2 |  |
| `inp2` | in | 2 |  |
| `inp3` | in | 2 |  |
| `inp4` | in | 2 |  |
| `inp5` | in | 2 |  |
| `inp6` | in | 2 |  |
| `inp7` | in | 2 |  |
| `inp8` | in | 2 |  |
| `inp9` | in | 2 |  |
| `inp10` | in | 2 |  |
| `inp11` | in | 2 |  |
| `inp12` | in | 2 |  |
| `inp13` | in | 2 |  |
| `inp14` | in | 2 |  |
| `inp15` | in | 2 |  |
| `inp16` | in | 2 |  |
| `inp17` | in | 2 |  |
| `inp18` | in | 2 |  |
| `inp19` | in | 2 |  |
| `inp20` | in | 2 |  |
| `inp21` | in | 2 |  |
| `inp22` | in | 2 |  |
| `inp23` | in | 2 |  |
| `inp24` | in | 2 |  |
| `inp25` | in | 2 |  |
| `inp26` | in | 2 |  |
| `inp27` | in | 2 |  |
| `inp28` | in | 2 |  |
| `inp29` | in | 2 |  |
| `inp30` | in | 2 |  |
| `out` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_085012.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
