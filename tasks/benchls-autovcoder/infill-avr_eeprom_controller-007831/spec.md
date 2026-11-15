# Fill in the masked region of `autovcoder_007831`

The file `autovcoder_007831.v` holds a Verilog design whose top module is `autovcoder_007831` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_007831`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_007831.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_007831` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_007831.v`. Only these files are graded.

## Interface of `autovcoder_007831`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_i` | in | 1 | reset, active high |
| `addr_i` | in | 8 |  |
| `wr_i` | in | 1 |  |
| `rd_i` | in | 1 |  |
| `bus_i` | in | 8 |  |
| `int_ack_i` | in | 1 |  |
| `ext_eep_addr_i` | in | 17 |  |
| `ext_eep_data_i` | in | 8 |  |
| `ext_eep_data_wr_i` | in | 1 |  |
| `ext_eep_data_rd_i` | in | 1 |  |
| `ext_eep_data_en_i` | in | 1 |  |
| `bus_o` | out | 8 | |
| `int_o` | out | 1 | |
| `ext_eep_data_o` | out | 8 | |
| `content_modifyed_o` | out | 1 | |
| `debug_o` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_007831.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
