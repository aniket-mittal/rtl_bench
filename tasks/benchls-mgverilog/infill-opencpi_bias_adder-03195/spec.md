# Fill in the masked region of `mg_03195`

The file `mg_03195.v` holds a Verilog design whose top module is `mg_03195` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_03195`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03195.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03195` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03195.v`. Only these files are graded.

## Interface of `mg_03195`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `wci_MCmd` | in | 3 |  |
| `wci_MAddrSpace` | in | 1 |  |
| `wci_MByteEn` | in | 4 |  |
| `wci_MAddr` | in | 20 |  |
| `wci_MData` | in | 32 |  |
| `wci_MFlag` | in | 2 |  |
| `wsi0_MCmd` | in | 3 |  |
| `wsi0_MReqLast` | in | 1 |  |
| `wsi0_MBurstPrecise` | in | 1 |  |
| `wsi0_MBurstLength` | in | 12 |  |
| `wsi0_MData` | in | 32 |  |
| `wsi0_MByteEn` | in | 4 |  |
| `wsi0_MReqInfo` | in | 8 |  |
| `wsi1_SThreadBusy` | in | 1 |  |
| `wsi_m_SReset_n` | in | 1 |  |
| `wsi_s_MReset_n` | in | 1 |  |
| `wci_SResp` | out | 2 | |
| `wci_SData` | out | 32 | |
| `wci_SFlag` | out | 2 | |
| `wci_SThreadBusy` | out | 1 | |
| `wsi0_SThreadBusy` | out | 1 | |
| `wsi1_MCmd` | out | 3 | |
| `wsi1_MReqLast` | out | 1 | |
| `wsi1_MBurstPrecise` | out | 1 | |
| `wsi1_MBurstLength` | out | 12 | |
| `wsi1_MData` | out | 32 | |
| `wsi1_MByteEn` | out | 4 | |
| `wsi1_MReqInfo` | out | 8 | |
| `wsi_m_MReset_n` | out | 1 | |
| `wsi_s_SReset_n` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03195.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
