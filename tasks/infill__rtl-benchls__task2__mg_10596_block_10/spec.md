# Fill in the masked region of `mg_10596`

The file `mg_10596.v` holds a Verilog design whose top module is `mg_10596` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_10596`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_10596.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_10596` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_10596.v`. Only these files are graded.

## Interface of `mg_10596`

| port | dir | width | note |
|---|---|---|---|
| `clk_i` | in | 1 | clock, rising edge |
| `IF_addr_i` | in | 32 |  |
| `IF_req_i` | in | 1 |  |
| `MEM_req_i` | in | 1 |  |
| `MEM_we_i` | in | 1 |  |
| `MEM_addr_i` | in | 32 |  |
| `MEM_data_i` | in | 32 |  |
| `MEM_bwsel_i` | in | 4 |  |
| `dmem_ack_i` | in | 1 |  |
| `dmem_data_i` | in | 32 |  |
| `imem_ack_i` | in | 1 |  |
| `imem_inst_i` | in | 32 |  |
| `ID_inst_o` | out | 32 | |
| `WB_data_o` | out | 32 | |
| `dmem_cyc_o` | out | 1 | |
| `dmem_stb_o` | out | 1 | |
| `dmem_waddr_o` | out | 32 | |
| `dmem_raddr_o` | out | 32 | |
| `dmem_we_o` | out | 1 | |
| `dmem_bwsel_o` | out | 4 | |
| `dmem_data_o` | out | 32 | |
| `imem_cyc_o` | out | 1 | |
| `imem_stb_o` | out | 1 | |
| `imem_addr_o` | out | 32 | |
| `dmem_rdy_o` | out | 1 | |
| `imem_rdy_o` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_10596.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
