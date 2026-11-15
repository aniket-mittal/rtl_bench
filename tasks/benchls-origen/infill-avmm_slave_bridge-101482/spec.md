# Fill in the masked region of `origen_101482`

The file `origen_101482.v` holds a Verilog design whose top module is `origen_101482` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_101482`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_101482.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_101482` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_101482.v`. Only these files are graded.

## Interface of `origen_101482`

| port | dir | width | note |
|---|---|---|---|
| `avmm_clk` | in | 1 | clock, rising edge |
| `avmm_rst_n` | in | 1 | reset, active low |
| `i_avmm_write` | in | 1 |  |
| `i_avmm_read` | in | 1 |  |
| `i_avmm_addr` | in | 32 |  |
| `i_avmm_wdata` | in | 32 |  |
| `i_avmm_byte_en` | in | 4 |  |
| `readdata` | in | 32 |  |
| `o_avmm_rdata` | out | 32 | |
| `o_avmm_rdatavalid` | out | 1 | |
| `o_avmm_waitrequest` | out | 1 | |
| `clk` | out | 1 | |
| `reset` | out | 1 | |
| `writedata` | out | 32 | |
| `read` | out | 1 | |
| `write` | out | 1 | |
| `byteenable` | out | 4 | |
| `address` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_101482.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
