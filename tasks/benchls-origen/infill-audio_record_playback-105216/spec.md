# Fill in the masked region of `origen_105216`

The file `origen_105216.v` holds a Verilog design whose top module is `origen_105216` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_105216`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_105216.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_105216` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_105216.v`. Only these files are graded.

## Interface of `origen_105216`

| port | dir | width | note |
|---|---|---|---|
| `i_clk` | in | 1 | clock, rising edge |
| `i_rst` | in | 1 | reset, active high |
| `adc_left_data` | in | 16 |  |
| `adc_left_valid` | in | 1 |  |
| `adc_right_data` | in | 16 |  |
| `adc_right_valid` | in | 1 |  |
| `dac_left_ready` | in | 1 |  |
| `dac_right_ready` | in | 1 |  |
| `record_audio_ready` | in | 1 |  |
| `play_audio_data` | in | 32 |  |
| `play_audio_valid` | in | 1 |  |
| `adc_left_ready` | out | 1 | |
| `adc_right_ready` | out | 1 | |
| `dac_left_data` | out | 16 | |
| `dac_left_valid` | out | 1 | |
| `dac_right_data` | out | 16 | |
| `dac_right_valid` | out | 1 | |
| `record_audio_data` | out | 32 | |
| `record_audio_valid` | out | 1 | |
| `play_audio_ready` | out | 1 | |
| `debug_state` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_105216.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
