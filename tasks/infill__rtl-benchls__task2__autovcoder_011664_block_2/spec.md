# Fill in the masked region of `autovcoder_011664`

The file `autovcoder_011664.v` holds a Verilog design whose top module is `autovcoder_011664` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_011664`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_011664.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_011664` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_011664.v`. Only these files are graded.

## Interface of `autovcoder_011664`

| port | dir | width | note |
|---|---|---|---|
| `clk_sys` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `addr_in` | in | 32 |  |
| `write_in` | in | 1 |  |
| `writedata_in` | in | 32 |  |
| `read_in` | in | 1 |  |
| `byteenable_in` | in | 4 |  |
| `burstcount_in` | in | 3 |  |
| `readdata_in` | in | 32 |  |
| `readdatavalid_in` | in | 1 |  |
| `waitrequest_in` | in | 1 |  |
| `readdata_out` | out | 32 | |
| `readdatavalid_out` | out | 1 | |
| `waitrequest_out` | out | 1 | |
| `addr_out` | out | 32 | |
| `write_out` | out | 1 | |
| `writedata_out` | out | 32 | |
| `read_out` | out | 1 | |
| `byteenable_out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_011664.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
