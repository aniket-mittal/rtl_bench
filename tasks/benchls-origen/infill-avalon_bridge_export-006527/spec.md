# Fill in the masked region of `origen_006527`

The file `origen_006527.v` holds a Verilog design whose top module is `origen_006527` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_006527`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_006527.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_006527` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_006527.v`. Only these files are graded.

## Interface of `origen_006527`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `address` | in | 32 |  |
| `read` | in | 1 |  |
| `write` | in | 1 |  |
| `burstcount` | in | 4 |  |
| `burstbegin` | in | 1 |  |
| `byteenable` | in | 4 |  |
| `writedata` | in | 32 |  |
| `irq` | in | 1 |  |
| `export_readdata` | in | 32 |  |
| `export_waitrequest` | in | 1 |  |
| `export_readdatavalid` | in | 1 |  |
| `readdata` | out | 32 | |
| `waitrequest` | out | 1 | |
| `readdatavalid` | out | 1 | |
| `export_address` | out | 32 | |
| `export_read` | out | 1 | |
| `export_write` | out | 1 | |
| `export_burstcount` | out | 4 | |
| `export_burstbegin` | out | 1 | |
| `export_byteenable` | out | 4 | |
| `export_writedata` | out | 32 | |
| `export_irq` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_006527.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
