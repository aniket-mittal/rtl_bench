# Fill in the masked region of `origen_015393`

The file `origen_015393.v` holds a Verilog design whose top module is `origen_015393` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_015393`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_015393.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_015393` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_015393.v`. Only these files are graded.

## Interface of `origen_015393`

| port | dir | width | note |
|---|---|---|---|
| `branch_d` | in | 1 |  |
| `regwrite_e` | in | 1 |  |
| `memtoreg_e` | in | 1 |  |
| `memtoreg_m` | in | 1 |  |
| `writereg_e` | in | 5 |  |
| `rs_d` | in | 5 |  |
| `rt_d` | in | 5 |  |
| `rt_e` | in | 5 |  |
| `writereg_m` | in | 5 |  |
| `memread_m` | in | 1 |  |
| `memwrite_m` | in | 1 |  |
| `memready_m` | in | 1 |  |
| `branchtaken_e` | in | 1 |  |
| `branchfound_e` | in | 1 |  |
| `jump_d` | in | 1 |  |
| `stall_f` | out | 1 | |
| `stall_d` | out | 1 | |
| `stall_e` | out | 1 | |
| `stall_m` | out | 1 | |
| `stall_w` | out | 1 | |
| `flush_f` | out | 1 | |
| `flush_d` | out | 1 | |
| `flush_e` | out | 1 | |
| `flush_m` | out | 1 | |
| `flush_w` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_015393.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
