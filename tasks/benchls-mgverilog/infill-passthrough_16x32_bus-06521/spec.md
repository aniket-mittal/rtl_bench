# Fill in the masked region of `mg_06521`

The file `mg_06521.v` holds a Verilog design whose top module is `mg_06521` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. The design has no single large statement, so 2 consecutive continuous `assign` statements in module `mg_06521` were replaced together by `[MASKED]`. Write those `assign` statements in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_06521.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_06521` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_06521.v`. Only these files are graded.

## Interface of `mg_06521`

| port | dir | width | note |
|---|---|---|---|
| `io_ins_0_valid` | in | 1 |  |
| `io_ins_0_bits_wdata_0` | in | 32 |  |
| `io_ins_0_bits_wdata_1` | in | 32 |  |
| `io_ins_0_bits_wdata_2` | in | 32 |  |
| `io_ins_0_bits_wdata_3` | in | 32 |  |
| `io_ins_0_bits_wdata_4` | in | 32 |  |
| `io_ins_0_bits_wdata_5` | in | 32 |  |
| `io_ins_0_bits_wdata_6` | in | 32 |  |
| `io_ins_0_bits_wdata_7` | in | 32 |  |
| `io_ins_0_bits_wdata_8` | in | 32 |  |
| `io_ins_0_bits_wdata_9` | in | 32 |  |
| `io_ins_0_bits_wdata_10` | in | 32 |  |
| `io_ins_0_bits_wdata_11` | in | 32 |  |
| `io_ins_0_bits_wdata_12` | in | 32 |  |
| `io_ins_0_bits_wdata_13` | in | 32 |  |
| `io_ins_0_bits_wdata_14` | in | 32 |  |
| `io_ins_0_bits_wdata_15` | in | 32 |  |
| `io_ins_0_bits_wlast` | in | 1 |  |
| `io_out_valid` | out | 1 | |
| `io_out_bits_wdata_0` | out | 32 | |
| `io_out_bits_wdata_1` | out | 32 | |
| `io_out_bits_wdata_2` | out | 32 | |
| `io_out_bits_wdata_3` | out | 32 | |
| `io_out_bits_wdata_4` | out | 32 | |
| `io_out_bits_wdata_5` | out | 32 | |
| `io_out_bits_wdata_6` | out | 32 | |
| `io_out_bits_wdata_7` | out | 32 | |
| `io_out_bits_wdata_8` | out | 32 | |
| `io_out_bits_wdata_9` | out | 32 | |
| `io_out_bits_wdata_10` | out | 32 | |
| `io_out_bits_wdata_11` | out | 32 | |
| `io_out_bits_wdata_12` | out | 32 | |
| `io_out_bits_wdata_13` | out | 32 | |
| `io_out_bits_wdata_14` | out | 32 | |
| `io_out_bits_wdata_15` | out | 32 | |
| `io_out_bits_wlast` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_06521.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
