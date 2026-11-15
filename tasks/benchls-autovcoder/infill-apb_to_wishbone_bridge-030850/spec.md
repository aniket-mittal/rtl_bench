# Fill in the masked region of `autovcoder_030850`

The file `autovcoder_030850.v` holds a Verilog design whose top module is `autovcoder_030850` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_030850`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_030850.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_030850` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_030850.v`. Only these files are graded.

## Interface of `autovcoder_030850`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `apb_addr` | in | 32 |  |
| `apb_sel` | in | 1 |  |
| `apb_enable` | in | 1 |  |
| `apb_write` | in | 1 |  |
| `apb_wdata` | in | 32 |  |
| `apb_strb` | in | 4 |  |
| `wb_ack_i` | in | 1 |  |
| `wb_err_i` | in | 1 |  |
| `wb_dat_i` | in | 32 |  |
| `apb_ready` | out | 1 | |
| `apb_rdata` | out | 32 | |
| `apb_slverr` | out | 1 | |
| `wb_cyc_o` | out | 1 | |
| `wb_stb_o` | out | 1 | |
| `wb_we_o` | out | 1 | |
| `wb_adr_o` | out | 32 | |
| `wb_dat_o` | out | 32 | |
| `wb_sel_o` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_030850.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
