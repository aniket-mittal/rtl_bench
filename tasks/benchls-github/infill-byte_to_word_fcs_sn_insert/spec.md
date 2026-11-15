# Fill in the masked region of `byte_to_word_fcs_sn_insert`

The file `byte_to_word_fcs_sn_insert.v` holds a Verilog design whose top module is `byte_to_word_fcs_sn_insert` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `byte_to_word_fcs_sn_insert`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: SEC-Flow-Star-repos-24.openwifi-hw.

## Rules

- Edit only `byte_to_word_fcs_sn_insert.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `byte_to_word_fcs_sn_insert` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `byte_to_word_fcs_sn_insert.v`. Only these files are graded.

## Interface of `byte_to_word_fcs_sn_insert`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rstn` | in | 1 | reset, active low |
| `rstn_sn` | in | 1 |  |
| `byte_in` | in | 8 |  |
| `byte_in_strobe` | in | 1 |  |
| `byte_count` | in | 16 |  |
| `num_byte` | in | 16 |  |
| `fcs_in_strobe` | in | 1 |  |
| `fcs_ok` | in | 1 |  |
| `rx_pkt_sn_plus_one` | in | 1 |  |
| `word_out` | out | 64 | |
| `word_out_strobe` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v byte_to_word_fcs_sn_insert.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
