# Fill in the masked region of `ct_fspu_single`

The file `ct_fspu_single.v` holds a Verilog design whose top module is `ct_fspu_single` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `ct_fspu_single`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: SEC-Flow-Star-repos-32.openc910.

## Rules

- Edit only `ct_fspu_single.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `ct_fspu_single` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `ct_fspu_single.v`. Only these files are graded.

## Interface of `ct_fspu_single`

| port | dir | width | note |
|---|---|---|---|
| `check_nan` | in | 1 |  |
| `ex1_op_fmvvf` | in | 1 |  |
| `ex1_op_fsgnj` | in | 1 |  |
| `ex1_op_fsgnjn` | in | 1 |  |
| `ex1_op_fsgnjx` | in | 1 |  |
| `ex1_oper0` | in | 64 |  |
| `ex1_oper1` | in | 64 |  |
| `ex1_scalar` | in | 1 |  |
| `mtvr_src0` | in | 64 |  |
| `ex1_result` | out | 64 | |
| `result_fclass` | out | 32 | |
| `result_fmfvr` | out | 64 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v ct_fspu_single.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
