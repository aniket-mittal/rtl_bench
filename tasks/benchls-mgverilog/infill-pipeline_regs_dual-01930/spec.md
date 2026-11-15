# Fill in the masked region of `mg_01930`

The file `mg_01930.v` holds a Verilog design whose top module is `mg_01930` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_01930`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_01930.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_01930` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_01930.v`. Only these files are graded.

## Interface of `mg_01930`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `abusWire1` | in | 64 |  |
| `bbusWire1` | in | 64 |  |
| `DselectWire1` | in | 32 |  |
| `ALUImmWire1` | in | 64 |  |
| `SWire1` | in | 3 |  |
| `CinWire1` | in | 1 |  |
| `immBit1` | in | 1 |  |
| `lwSwFlag1` | in | 2 |  |
| `setControlBits` | in | 2 |  |
| `branchControlBit` | in | 3 |  |
| `NZVCSetBit` | in | 1 |  |
| `shiftBit1` | in | 2 |  |
| `shamt` | in | 6 |  |
| `DTAddrWire1` | in | 64 |  |
| `MOVImmWire1` | in | 64 |  |
| `movBit1` | in | 1 |  |
| `moveImmShftAmt` | in | 6 |  |
| `NOP` | in | 1 |  |
| `abusWire2` | out | 64 | |
| `bbusWire2` | out | 64 | |
| `ALUImmWire2` | out | 64 | |
| `SWire2` | out | 3 | |
| `CinWire2` | out | 1 | |
| `DselectWire2` | out | 32 | |
| `immBit2` | out | 1 | |
| `lwSwFlag2` | out | 2 | |
| `setControlBitsWire1` | out | 2 | |
| `branchControlBitWire1` | out | 3 | |
| `NZVCSetBitWire1` | out | 1 | |
| `shiftBit2` | out | 2 | |
| `shamtWire1` | out | 6 | |
| `DTAddrWire2` | out | 64 | |
| `MOVImmWire2` | out | 64 | |
| `movBit2` | out | 1 | |
| `moveImmShftAmtWire1` | out | 6 | |
| `NOPWire1` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_01930.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
