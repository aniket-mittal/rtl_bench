# Fill in the masked region of `autovcoder_145910`

The file `autovcoder_145910.v` holds a Verilog design whose top module is `autovcoder_145910` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_145910`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_145910.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_145910` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_145910.v`. Only these files are graded.

## Interface of `autovcoder_145910`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `start_ch0` | in | 1 |  |
| `stop_ch0` | in | 1 |  |
| `src_addr_ch0` | in | 8 |  |
| `dest_addr_ch0` | in | 8 |  |
| `data_in_ch0` | in | 8 |  |
| `start_ch1` | in | 1 |  |
| `stop_ch1` | in | 1 |  |
| `src_addr_ch1` | in | 8 |  |
| `dest_addr_ch1` | in | 8 |  |
| `data_in_ch1` | in | 8 |  |
| `data_out_ch0` | out | 8 | |
| `busy_ch0` | out | 1 | |
| `data_out_ch1` | out | 8 | |
| `busy_ch1` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_145910.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
