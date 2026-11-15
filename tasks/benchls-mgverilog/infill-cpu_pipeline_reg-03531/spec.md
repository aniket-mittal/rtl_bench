# Fill in the masked region of `mg_03531`

The file `mg_03531.v` holds a Verilog design whose top module is `mg_03531` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_03531`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_03531.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_03531` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_03531.v`. Only these files are graded.

## Interface of `mg_03531`

| port | dir | width | note |
|---|---|---|---|
| `CLK` | in | 1 | clock, rising edge |
| `One_A_IN` | in | 1 |  |
| `One_B_IN` | in | 1 |  |
| `Two_A_IN` | in | 1 |  |
| `Two_B_IN` | in | 1 |  |
| `MW_One_IN` | in | 1 |  |
| `MW_Two_IN` | in | 1 |  |
| `input_IN` | in | 1 |  |
| `wren_IN` | in | 1 |  |
| `writeAd_IN` | in | 3 |  |
| `ADR_MUX_IN` | in | 1 |  |
| `write_IN` | in | 1 |  |
| `PC_load_IN` | in | 1 |  |
| `SPR_w_IN` | in | 1 |  |
| `SPR_i_IN` | in | 1 |  |
| `SPR_d_IN` | in | 1 |  |
| `cond_IN` | in | 3 |  |
| `op2_IN` | in | 3 |  |
| `SW_IN` | in | 1 |  |
| `MAD_MUX_IN` | in | 1 |  |
| `FLAG_WRITE_IN` | in | 1 |  |
| `AR_IN` | in | 1 |  |
| `BR_IN` | in | 1 |  |
| `ALU_IN` | in | 4 |  |
| `SPC_MUX_IN` | in | 1 |  |
| `MX_MUX_IN` | in | 1 |  |
| `AB_MUX_IN` | in | 1 |  |
| `One_A_OUT` | out | 1 | |
| `One_B_OUT` | out | 1 | |
| `Two_A_OUT` | out | 1 | |
| `Two_B_OUT` | out | 1 | |
| `MW_One_OUT` | out | 1 | |
| `MW_Two_OUT` | out | 1 | |
| `input_OUT` | out | 1 | |
| `wren_OUT` | out | 1 | |
| `writeAd_OUT` | out | 3 | |
| `ADR_MUX_OUT` | out | 1 | |
| `write_OUT` | out | 1 | |
| `PC_load_OUT` | out | 1 | |
| `SPR_w_OUT` | out | 1 | |
| `SPR_i_OUT` | out | 1 | |
| `SPR_d_OUT` | out | 1 | |
| `cond_OUT` | out | 3 | |
| `op2_OUT` | out | 3 | |
| `SW_OUT` | out | 1 | |
| `MAD_MUX_OUT` | out | 1 | |
| `FLAG_WRITE_OUT` | out | 1 | |
| `AR_OUT` | out | 1 | |
| `BR_OUT` | out | 1 | |
| `ALU_OUT` | out | 4 | |
| `SPC_MUX_OUT` | out | 1 | |
| `MX_MUX_OUT` | out | 1 | |
| `AB_MUX_OUT` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_03531.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
