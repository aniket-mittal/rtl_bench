# Fill in the masked region of `autovcoder_087772`

The file `autovcoder_087772.v` holds a Verilog design whose top module is `autovcoder_087772` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_087772`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_087772.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_087772` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_087772.v`. Only these files are graded.

## Interface of `autovcoder_087772`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `write_en1` | in | 1 |  |
| `write_en2` | in | 1 |  |
| `write_en3` | in | 1 |  |
| `write_en4` | in | 1 |  |
| `write_en5` | in | 1 |  |
| `write_en6` | in | 1 |  |
| `write_en7` | in | 1 |  |
| `write_en8` | in | 1 |  |
| `read_en1` | in | 1 |  |
| `read_en2` | in | 1 |  |
| `read_en3` | in | 1 |  |
| `read_en4` | in | 1 |  |
| `read_en5` | in | 1 |  |
| `read_en6` | in | 1 |  |
| `read_en7` | in | 1 |  |
| `read_en8` | in | 1 |  |
| `addr1` | in | 9 |  |
| `addr2` | in | 9 |  |
| `addr3` | in | 9 |  |
| `addr4` | in | 9 |  |
| `addr5` | in | 9 |  |
| `addr6` | in | 9 |  |
| `addr7` | in | 9 |  |
| `addr8` | in | 9 |  |
| `Data_in1` | in | 16 |  |
| `Data_in2` | in | 16 |  |
| `Data_in3` | in | 16 |  |
| `Data_in4` | in | 16 |  |
| `Data_in5` | in | 16 |  |
| `Data_in6` | in | 16 |  |
| `Data_in7` | in | 16 |  |
| `Data_in8` | in | 16 |  |
| `Data_out1` | out | 16 | |
| `Data_out2` | out | 16 | |
| `Data_out3` | out | 16 | |
| `Data_out4` | out | 16 | |
| `Data_out5` | out | 16 | |
| `Data_out6` | out | 16 | |
| `Data_out7` | out | 16 | |
| `Data_out8` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_087772.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
