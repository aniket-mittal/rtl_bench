# Fill in the masked region of `autovcoder_004072`

The file `autovcoder_004072.v` holds a Verilog design whose top module is `autovcoder_004072` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_004072`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_004072.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_004072` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_004072.v`. Only these files are graded.

## Interface of `autovcoder_004072`

| port | dir | width | note |
|---|---|---|---|
| `gclk` | in | 1 | clock, rising edge |
| `xwb_dat_i` | in | 32 |  |
| `xwb_ack_i` | in | 1 |  |
| `imm_of` | in | 16 |  |
| `opc_of` | in | 6 |  |
| `opa_of` | in | 32 |  |
| `grst` | in | 1 | reset, active high |
| `dena` | in | 1 |  |
| `gpha` | in | 1 |  |
| `xwb_adr_o` | out | 1 | |
| `xwb_dat_o` | out | 32 | |
| `xwb_sel_o` | out | 4 | |
| `xwb_tag_o` | out | 1 | |
| `xwb_stb_o` | out | 1 | |
| `xwb_cyc_o` | out | 1 | |
| `xwb_wre_o` | out | 1 | |
| `xwb_fb` | out | 1 | |
| `xwb_mx` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_004072.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
