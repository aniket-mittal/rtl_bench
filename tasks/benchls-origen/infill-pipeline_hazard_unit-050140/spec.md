# Fill in the masked region of `origen_050140`

The file `origen_050140.v` holds a Verilog design whose top module is `origen_050140` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_050140`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_050140.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_050140` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_050140.v`. Only these files are graded.

## Interface of `origen_050140`

| port | dir | width | note |
|---|---|---|---|
| `EX_MemR` | in | 1 |  |
| `EX_RegW` | in | 1 |  |
| `EX_WeSel` | in | 5 |  |
| `MEM_MemR` | in | 1 |  |
| `MEM_RegW` | in | 1 |  |
| `MEM_WeSel` | in | 5 |  |
| `ID_oprs` | in | 5 |  |
| `ID_oprt` | in | 5 |  |
| `ID_Branch` | in | 1 |  |
| `ID_BranchNE` | in | 1 |  |
| `ID_jump` | in | 1 |  |
| `ID_pcSel` | in | 2 |  |
| `EX_Branch` | in | 1 |  |
| `EX_BranchNE` | in | 1 |  |
| `EX_jump` | in | 1 |  |
| `Wr_PC` | out | 1 | |
| `Wr_IFID` | out | 1 | |
| `Wr_IDEX` | out | 1 | |
| `Wr_EXMEM` | out | 1 | |
| `Wr_MEMWB` | out | 1 | |
| `ClearCtrl_IDEX` | out | 1 | |
| `ClearCtrl_EXMEM` | out | 1 | |
| `ClearCtrl_MEMWB` | out | 1 | |
| `Bubble` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_050140.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
