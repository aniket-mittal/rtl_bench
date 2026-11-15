# Fill in the masked region of `mg_01492`

The file `mg_01492.v` holds a Verilog design whose top module is `mg_01492` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_01492`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_01492.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_01492` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_01492.v`. Only these files are graded.

## Interface of `mg_01492`

| port | dir | width | note |
|---|---|---|---|
| `iLDST_BUSY` | in | 1 |  |
| `iLDST_VALID` | in | 1 |  |
| `iLDST_MMU_FLAGS` | in | 12 |  |
| `iLDST_DATA` | in | 32 |  |
| `iUSE_SEL` | in | 1 |  |
| `iEXE_REQ` | in | 1 |  |
| `iEXE_ORDER` | in | 2 |  |
| `iEXE_MASK` | in | 4 |  |
| `iEXE_RW` | in | 1 |  |
| `iEXE_ASID` | in | 14 |  |
| `iEXE_MMUMOD` | in | 2 |  |
| `iEXE_MMUPS` | in | 3 |  |
| `iEXE_PDT` | in | 32 |  |
| `iEXE_ADDR` | in | 32 |  |
| `iEXE_DATA` | in | 32 |  |
| `iEXCEPT_REQ` | in | 1 |  |
| `iEXCEPT_ORDER` | in | 2 |  |
| `iEXCEPT_RW` | in | 1 |  |
| `iEXCEPT_ASID` | in | 14 |  |
| `iEXCEPT_MMUMOD` | in | 2 |  |
| `iEXCEPT_MMUPS` | in | 3 |  |
| `iEXCEPT_PDT` | in | 32 |  |
| `iEXCEPT_ADDR` | in | 32 |  |
| `iEXCEPT_DATA` | in | 32 |  |
| `oLDST_REQ` | out | 1 | |
| `oLDST_ORDER` | out | 2 | |
| `oLDST_MASK` | out | 4 | |
| `oLDST_RW` | out | 1 | |
| `oLDST_ASID` | out | 14 | |
| `oLDST_MMUMOD` | out | 2 | |
| `oLDST_MMUPS` | out | 3 | |
| `oLDST_PDT` | out | 32 | |
| `oLDST_ADDR` | out | 32 | |
| `oLDST_DATA` | out | 32 | |
| `oEXE_BUSY` | out | 1 | |
| `oEXE_REQ` | out | 1 | |
| `oEXE_MMU_FLAGS` | out | 12 | |
| `oEXE_DATA` | out | 32 | |
| `oEXCEPT_BUSY` | out | 1 | |
| `oEXCEPT_REQ` | out | 1 | |
| `oEXCEPT_DATA` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_01492.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
