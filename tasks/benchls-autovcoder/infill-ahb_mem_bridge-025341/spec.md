# Fill in the masked region of `autovcoder_025341`

The file `autovcoder_025341.v` holds a Verilog design whose top module is `autovcoder_025341` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_025341`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_025341.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_025341` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_025341.v`. Only these files are graded.

## Interface of `autovcoder_025341`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `mem_addr` | in | 32 |  |
| `mem_wr` | in | 1 |  |
| `mem_byte_en` | in | 2 |  |
| `mem_req` | in | 1 |  |
| `mem_wr_data` | in | 32 |  |
| `d_mhrdata` | in | 32 |  |
| `d_mhready` | in | 1 |  |
| `d_mhresp` | in | 1 |  |
| `mem_rd_data` | out | 32 | |
| `mem_rdy` | out | 1 | |
| `core_mem_addr` | out | 32 | |
| `core_mem_addr_vld` | out | 1 | |
| `core_mwr_mrd` | out | 1 | |
| `d_mhaddr` | out | 32 | |
| `d_mhtrans` | out | 2 | |
| `d_mhwrite` | out | 1 | |
| `d_mhwdata` | out | 32 | |
| `d_mhsize` | out | 3 | |
| `d_mhburst` | out | 3 | |
| `d_mhprot` | out | 4 | |
| `d_mhmasterlock` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_025341.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
