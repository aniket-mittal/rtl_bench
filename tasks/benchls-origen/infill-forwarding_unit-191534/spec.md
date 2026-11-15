# Fill in the masked region of `origen_191534`

The file `origen_191534.v` holds a Verilog design whose top module is `origen_191534` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_191534`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_191534.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_191534` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_191534.v`. Only these files are graded.

## Interface of `origen_191534`

| port | dir | width | note |
|---|---|---|---|
| `rf_waddr_exmem` | in | 4 |  |
| `rf_waddr_memwb` | in | 4 |  |
| `inst_curr_IDEX_7_4_rs` | in | 4 |  |
| `inst_curr_IDEX_3_0_rt` | in | 4 |  |
| `inst_curr_IDEX_11_8_rd` | in | 4 |  |
| `rf_wen_exmem` | in | 1 |  |
| `rf_wen_memwb` | in | 1 |  |
| `mem2reg_memwb` | in | 1 |  |
| `mem2reg_exmem` | in | 1 |  |
| `dmem_wen_idex` | in | 1 |  |
| `forwardA` | out | 2 | |
| `forwardB` | out | 2 | |
| `rdata2_sw_fcontrol` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_191534.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
