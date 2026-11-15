# Fill in the masked region of `rtlpp_04067`

The file `rtlpp_04067.v` holds a Verilog design whose top module is `rtlpp_04067` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_04067`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_04067.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_04067` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_04067.v`. Only these files are graded.

## Interface of `rtlpp_04067`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `icbiu_dat_i` | in | 32 |  |
| `icbiu_ack_i` | in | 1 |  |
| `icbiu_err_i` | in | 1 |  |
| `ic_en` | in | 1 |  |
| `icqmem_adr_i` | in | 32 |  |
| `icqmem_cycstb_i` | in | 1 |  |
| `icqmem_ci_i` | in | 1 |  |
| `icqmem_sel_i` | in | 4 |  |
| `icqmem_tag_i` | in | 4 |  |
| `spr_cs` | in | 1 |  |
| `spr_write` | in | 1 |  |
| `spr_dat_i` | in | 32 |  |
| `icbiu_dat_o` | out | 32 | |
| `icbiu_adr_o` | out | 32 | |
| `icbiu_cyc_o` | out | 1 | |
| `icbiu_stb_o` | out | 1 | |
| `icbiu_we_o` | out | 1 | |
| `icbiu_sel_o` | out | 4 | |
| `icbiu_cab_o` | out | 1 | |
| `icqmem_dat_o` | out | 32 | |
| `icqmem_ack_o` | out | 1 | |
| `icqmem_rty_o` | out | 1 | |
| `icqmem_err_o` | out | 1 | |
| `icqmem_tag_o` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_04067.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
