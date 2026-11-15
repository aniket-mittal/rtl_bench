# Fill in the masked region of `origen_136844`

The file `origen_136844.v` holds a Verilog design whose top module is `origen_136844` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_136844`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_136844.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_136844` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_136844.v`. Only these files are graded.

## Interface of `origen_136844`

| port | dir | width | note |
|---|---|---|---|
| `OPB_Clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `opb_abus` | in | 32 |  |
| `opb_be` | in | 4 |  |
| `opb_dbus` | in | 32 |  |
| `opb_rnw` | in | 1 |  |
| `opb_select` | in | 1 |  |
| `opb_seqaddr` | in | 1 |  |
| `sl_dbus` | out | 32 | |
| `sl_errack` | out | 1 | |
| `sl_retry` | out | 1 | |
| `sl_toutsup` | out | 1 | |
| `sl_xferack` | out | 1 | |
| `radio1_sclk` | out | 1 | |
| `radio1_dout` | out | 1 | |
| `radio1_cs` | out | 1 | |
| `radio2_sclk` | out | 1 | |
| `radio2_dout` | out | 1 | |
| `radio2_cs` | out | 1 | |
| `radio3_sclk` | out | 1 | |
| `radio3_dout` | out | 1 | |
| `radio3_cs` | out | 1 | |
| `radio4_sclk` | out | 1 | |
| `radio4_dout` | out | 1 | |
| `radio4_cs` | out | 1 | |
| `dac1_sclk` | out | 1 | |
| `dac1_dout` | out | 1 | |
| `dac1_cs` | out | 1 | |
| `dac2_sclk` | out | 1 | |
| `dac2_dout` | out | 1 | |
| `dac2_cs` | out | 1 | |
| `dac3_sclk` | out | 1 | |
| `dac3_dout` | out | 1 | |
| `dac3_cs` | out | 1 | |
| `dac4_sclk` | out | 1 | |
| `dac4_dout` | out | 1 | |
| `dac4_cs` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_136844.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
