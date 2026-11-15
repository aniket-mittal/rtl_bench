# Fill in the masked region of `rtlpp_02768`

The file `rtlpp_02768.v` holds a Verilog design whose top module is `rtlpp_02768` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `rtlpp_02768`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_02768.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_02768` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_02768.v`. Only these files are graded.

## Interface of `rtlpp_02768`

| port | dir | width | note |
|---|---|---|---|
| `HCLK` | in | 1 | clock, rising edge |
| `HRESETn` | in | 1 | reset, active low |
| `HRDATA` | in | 32 |  |
| `HREADY` | in | 1 |  |
| `HRESP` | in | 1 |  |
| `NMI` | in | 1 |  |
| `IRQ` | in | 32 |  |
| `RXEV` | in | 1 |  |
| `STCLKEN` | in | 1 |  |
| `STCALIB` | in | 26 |  |
| `HADDR` | out | 32 | |
| `HBURST` | out | 3 | |
| `HMASTLOCK` | out | 1 | |
| `HPROT` | out | 4 | |
| `HSIZE` | out | 3 | |
| `HTRANS` | out | 2 | |
| `HWDATA` | out | 32 | |
| `HWRITE` | out | 1 | |
| `TXEV` | out | 1 | |
| `LOCKUP` | out | 1 | |
| `SYSRESETREQ` | out | 1 | |
| `SLEEPING` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_02768.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
