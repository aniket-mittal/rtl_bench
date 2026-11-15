# Fill in the masked region of `rtlpp_06954`

The file `rtlpp_06954.v` holds a Verilog design whose top module is `rtlpp_06954` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_06954`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_06954.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_06954` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_06954.v`. Only these files are graded.

## Interface of `rtlpp_06954`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `rst_n_i` | in | 1 | reset, active high |
| `from_m_wb_adr_o` | in | 32 |  |
| `from_m_wb_sel_o` | in | 4 |  |
| `from_m_wb_we_o` | in | 1 |  |
| `from_m_wb_dat_o` | in | 32 |  |
| `from_m_wb_cyc_o` | in | 1 |  |
| `from_m_wb_stb_o` | in | 1 |  |
| `from_m_wb_cti_o` | in | 3 |  |
| `from_m_wb_bte_o` | in | 2 |  |
| `mHRDATA` | in | 32 |  |
| `mHRESP` | in | 1 |  |
| `mHREADY` | in | 1 |  |
| `to_m_wb_ack_i` | out | 1 | |
| `to_m_wb_err_i` | out | 1 | |
| `to_m_wb_dat_i` | out | 32 | |
| `mHSEL` | out | 1 | |
| `mHSIZE` | out | 3 | |
| `mHREADYOUT` | out | 1 | |
| `mHWRITE` | out | 1 | |
| `mHBURST` | out | 3 | |
| `mHADDR` | out | 32 | |
| `mHTRANS` | out | 2 | |
| `mHWDATA` | out | 32 | |
| `mHPROT` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_06954.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
