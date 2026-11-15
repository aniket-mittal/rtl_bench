# Fill in the masked region of `origen_042189`

The file `origen_042189.v` holds a Verilog design whose top module is `origen_042189` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_042189`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_042189.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_042189` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_042189.v`. Only these files are graded.

## Interface of `origen_042189`

| port | dir | width | note |
|---|---|---|---|
| `i_clk` | in | 1 | clock, rising edge |
| `i_aresetn` | in | 1 | reset, active low |
| `i_enable` | in | 1 |  |
| `i_data_to_transmit` | in | 16 |  |
| `i_tkeep` | in | 2 |  |
| `i_tdest` | in | 32 |  |
| `i_tlast` | in | 1 |  |
| `i_core_TID` | in | 32 |  |
| `i_tready` | in | 1 |  |
| `o_idle` | out | 1 | |
| `o_tvalid` | out | 1 | |
| `o_tdata` | out | 16 | |
| `o_tkeep` | out | 2 | |
| `o_tdest` | out | 8 | |
| `o_tid` | out | 8 | |
| `o_tlast` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_042189.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
