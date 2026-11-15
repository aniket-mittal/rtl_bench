# Fill in the masked region of `origen_132435`

The file `origen_132435.v` holds a Verilog design whose top module is `origen_132435` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_132435`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_132435.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_132435` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_132435.v`. Only these files are graded.

## Interface of `origen_132435`

| port | dir | width | note |
|---|---|---|---|
| `SPLB_Clk` | in | 1 | clock, rising edge |
| `SPLB_Rst` | in | 1 | reset, active high |
| `PLB_ABus` | in | 32 |  |
| `PLB_UABus` | in | 32 |  |
| `PLB_PAValid` | in | 1 |  |
| `PLB_SAValid` | in | 1 |  |
| `PLB_rdPrim` | in | 1 |  |
| `PLB_wrPrim` | in | 1 |  |
| `PLB_masterID` | in | 3 |  |
| `PLB_abort` | in | 1 |  |
| `PLB_busLock` | in | 1 |  |
| `PLB_RNW` | in | 1 |  |
| `PLB_BE` | in | 4 |  |
| `PLB_MSize` | in | 2 |  |
| `PLB_size` | in | 4 |  |
| `PLB_type` | in | 3 |  |
| `PLB_lockErr` | in | 1 |  |
| `PLB_wrDBus` | in | 32 |  |
| `PLB_wrBurst` | in | 1 |  |
| `PLB_rdBurst` | in | 1 |  |
| `PLB_wrPendReq` | in | 1 |  |
| `PLB_rdPendReq` | in | 1 |  |
| `PLB_wrPendPri` | in | 2 |  |
| `PLB_rdPendPri` | in | 2 |  |
| `PLB_reqPri` | in | 2 |  |
| `PLB_TAttribute` | in | 16 |  |
| `Sl_addrAck` | out | 1 | |
| `Sl_SSize` | out | 2 | |
| `Sl_wait` | out | 1 | |
| `Sl_rearbitrate` | out | 1 | |
| `Sl_wrDAck` | out | 1 | |
| `Sl_wrComp` | out | 1 | |
| `Sl_wrBTerm` | out | 1 | |
| `Sl_rdDBus` | out | 32 | |
| `Sl_rdWdAddr` | out | 4 | |
| `Sl_rdDAck` | out | 1 | |
| `Sl_rdComp` | out | 1 | |
| `Sl_rdBTerm` | out | 1 | |
| `Sl_MBusy` | out | 2 | |
| `Sl_MWrErr` | out | 2 | |
| `Sl_MRdErr` | out | 2 | |
| `Sl_MIRQ` | out | 1 | |
| `IP2INTC_Irpt` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_132435.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
