# Fill in the masked region of `rtlpp_09031`

The file `rtlpp_09031.v` holds a Verilog design whose top module is `rtlpp_09031` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_09031`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_09031.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_09031` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_09031.v`. Only these files are graded.

## Interface of `rtlpp_09031`

| port | dir | width | note |
|---|---|---|---|
| `Clock` | in | 1 | clock, rising edge |
| `Reset_L` | in | 1 | reset, active high |
| `CacheHit_H` | in | 1 |  |
| `ValidBitIn_H` | in | 1 |  |
| `DramSelect68k_H` | in | 1 |  |
| `AddressBusInFrom68k` | in | 32 |  |
| `DataBusInFrom68k` | in | 16 |  |
| `UDS_L` | in | 1 |  |
| `LDS_L` | in | 1 |  |
| `WE_L` | in | 1 |  |
| `AS_L` | in | 1 |  |
| `DtackFromDram_L` | in | 1 |  |
| `CAS_Dram_L` | in | 1 |  |
| `RAS_Dram_L` | in | 1 |  |
| `DataBusInFromDram` | in | 16 |  |
| `DataBusInFromCache` | in | 16 |  |
| `DataBusOutTo68k` | out | 16 | |
| `DataBusOutToDramController` | out | 16 | |
| `UDS_DramController_L` | out | 1 | |
| `LDS_DramController_L` | out | 1 | |
| `DramSelectFromCache_L` | out | 1 | |
| `WE_DramController_L` | out | 1 | |
| `AS_DramController_L` | out | 1 | |
| `DtackTo68k_L` | out | 1 | |
| `TagCache_WE_L` | out | 1 | |
| `DataCache_WE_L` | out | 1 | |
| `ValidBit_WE_L` | out | 1 | |
| `AddressBusOutToDramController` | out | 32 | |
| `TagDataOut` | out | 23 | |
| `WordAddress` | out | 3 | |
| `ValidBitOut_H` | out | 1 | |
| `Index` | out | 5 | |
| `CacheState` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_09031.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
