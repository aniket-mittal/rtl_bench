# Fill in the masked region of `mg_04137`

The file `mg_04137.v` holds a Verilog design whose top module is `mg_04137` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_04137`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_04137.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_04137` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_04137.v`. Only these files are graded.

## Interface of `mg_04137`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `writerege` | in | 5 |  |
| `writerege2` | in | 5 |  |
| `aluoute` | in | 32 |  |
| `aluoute2` | in | 32 |  |
| `writedatae` | in | 32 |  |
| `writedatae2` | in | 32 |  |
| `memwritee` | in | 1 |  |
| `memwritee2` | in | 1 |  |
| `regwritee` | in | 1 |  |
| `regwritee2` | in | 1 |  |
| `memtorege` | in | 1 |  |
| `memtorege2` | in | 1 |  |
| `stallm` | in | 1 |  |
| `stallm2` | in | 1 |  |
| `regwritem` | out | 1 | |
| `regwritem2` | out | 1 | |
| `memtoregm` | out | 1 | |
| `memtoregm2` | out | 1 | |
| `memwritem` | out | 1 | |
| `memwritem2` | out | 1 | |
| `writeregm` | out | 5 | |
| `writeregm2` | out | 5 | |
| `aluoutm` | out | 32 | |
| `aluoutm2` | out | 32 | |
| `writedatam` | out | 32 | |
| `writedatam2` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_04137.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
