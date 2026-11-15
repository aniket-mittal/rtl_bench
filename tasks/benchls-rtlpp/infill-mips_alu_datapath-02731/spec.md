# Fill in the masked region of `rtlpp_02731`

The file `rtlpp_02731.v` holds a Verilog design whose top module is `rtlpp_02731` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_02731`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02731.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02731` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02731.v`. Only these files are graded.

## Interface of `rtlpp_02731`

| port | dir | width | note |
|---|---|---|---|
| `pc4` | in | 32 |  |
| `register_rs` | in | 32 |  |
| `register_rt` | in | 32 |  |
| `function_opcode` | in | 6 |  |
| `sign_extend` | in | 32 |  |
| `wreg_rd` | in | 5 |  |
| `wreg_rt` | in | 5 |  |
| `aluop` | in | 2 |  |
| `branch` | in | 1 |  |
| `alusrc` | in | 1 |  |
| `regdst` | in | 1 |  |
| `alu_result` | out | 32 | |
| `branch_addr` | out | 32 | |
| `wreg_address` | out | 5 | |
| `do_branch` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02731.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
