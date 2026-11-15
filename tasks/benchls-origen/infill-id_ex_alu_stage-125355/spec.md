# Fill in the masked region of `origen_125355`

The file `origen_125355.v` holds a Verilog design whose top module is `origen_125355` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_125355`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_125355.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_125355` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_125355.v`. Only these files are graded.

## Interface of `origen_125355`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rstn` | in | 1 | reset, active low |
| `id_ex_rdy` | in | 1 |  |
| `id_ex_op1` | in | 32 |  |
| `id_ex_op2` | in | 32 |  |
| `id_ex_funct` | in | 6 |  |
| `id_ex_mem_st_data` | in | 32 |  |
| `id_ex_mem_st_funct` | in | 3 |  |
| `id_ex_mem_ld_funct` | in | 3 |  |
| `ex_mem_ack` | in | 1 |  |
| `id_ex_ack` | out | 1 | |
| `ex_mem_rdy` | out | 1 | |
| `ex_mem_alu_op` | out | 1 | |
| `ex_mem_st_data` | out | 32 | |
| `ex_mem_st_funct` | out | 3 | |
| `ex_mem_ld_funct` | out | 3 | |
| `ex_mem_data` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_125355.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
