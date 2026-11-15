# Fill in the masked region of `zet_nstate`

The file `zet_nstate.v` holds a Verilog design whose top module is `zet_nstate` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `zet_nstate`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: SEC-Flow-Star-repos-15.zet.

## Rules

- Edit only `zet_nstate.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `zet_nstate` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `zet_nstate.v`. Only these files are graded.

## Interface of `zet_nstate`

| port | dir | width | note |
|---|---|---|---|
| `state` | in | 3 |  |
| `prefix` | in | 1 |  |
| `need_modrm` | in | 1 |  |
| `need_off` | in | 1 |  |
| `need_imm` | in | 1 |  |
| `end_seq` | in | 1 |  |
| `ftype` | in | 6 |  |
| `of` | in | 1 |  |
| `next_in_opco` | in | 1 |  |
| `next_in_exec` | in | 1 |  |
| `block` | in | 1 |  |
| `div_exc` | in | 1 |  |
| `tflm` | in | 1 |  |
| `intr` | in | 1 |  |
| `iflm` | in | 1 |  |
| `nmir` | in | 1 |  |
| `iflss` | in | 1 |  |
| `next_state` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v zet_nstate.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
