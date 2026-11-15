# Fill in the masked region of `rtlpp_01952`

The file `rtlpp_01952.v` holds a Verilog design whose top module is `rtlpp_01952` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_01952`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_01952.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_01952` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_01952.v`. Only these files are graded.

## Interface of `rtlpp_01952`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `dip` | in | 8 |  |
| `reset_b` | in | 1 | reset, active low |
| `adr15` | in | 1 |  |
| `adr14` | in | 1 |  |
| `adr13` | in | 1 |  |
| `ioreq_b` | in | 1 |  |
| `mreq_b` | in | 1 |  |
| `romen_b` | in | 1 |  |
| `wr_b` | in | 1 |  |
| `rd_b` | in | 1 |  |
| `data` | in | 8 |  |
| `busrq_b` | in | 1 |  |
| `busack_b` | in | 1 |  |
| `romdis` | out | 1 | |
| `rom01cs_b` | out | 1 | |
| `rom23cs_b` | out | 1 | |
| `rom45cs_b` | out | 1 | |
| `romoe_b` | out | 1 | |
| `roma14` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_01952.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
