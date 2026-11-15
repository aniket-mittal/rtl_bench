# Fill in the masked region of `autovcoder_100787`

The file `autovcoder_100787.v` holds a Verilog design whose top module is `autovcoder_100787` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `autovcoder_100787`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_100787.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_100787` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_100787.v`. Only these files are graded.

## Interface of `autovcoder_100787`

| port | dir | width | note |
|---|---|---|---|
| `rvfi_valid` | in | 1 |  |
| `rvfi_insn` | in | 32 |  |
| `rvfi_pc_rdata` | in | 32 |  |
| `rvfi_rs1_rdata` | in | 32 |  |
| `rvfi_rs2_rdata` | in | 32 |  |
| `rvfi_mem_rdata` | in | 32 |  |
| `spec_valid` | out | 1 | |
| `spec_trap` | out | 1 | |
| `spec_rs1_addr` | out | 5 | |
| `spec_rs2_addr` | out | 5 | |
| `spec_rd_addr` | out | 5 | |
| `spec_rd_wdata` | out | 32 | |
| `spec_pc_wdata` | out | 32 | |
| `spec_mem_addr` | out | 32 | |
| `spec_mem_rmask` | out | 4 | |
| `spec_mem_wmask` | out | 4 | |
| `spec_mem_wdata` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_100787.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
