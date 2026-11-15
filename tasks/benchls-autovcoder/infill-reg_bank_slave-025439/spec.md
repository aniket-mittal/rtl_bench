# Fill in the masked region of `autovcoder_025439`

The file `autovcoder_025439.v` holds a Verilog design whose top module is `autovcoder_025439` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_025439`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_025439.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_025439` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_025439.v`. Only these files are graded.

## Interface of `autovcoder_025439`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `selector` | in | 8 |  |
| `data_300_1` | in | 16 |  |
| `data_301_1` | in | 16 |  |
| `data_302_1` | in | 16 |  |
| `data_303_1` | in | 16 |  |
| `data_304_1` | in | 16 |  |
| `data_305_1` | in | 16 |  |
| `data_306_1` | in | 16 |  |
| `data_307_1` | in | 16 |  |
| `data_308_1` | in | 16 |  |
| `data_309_1` | in | 16 |  |
| `data_310_1` | in | 16 |  |
| `data_311_1` | in | 16 |  |
| `data_312_1` | in | 16 |  |
| `data_313_1` | in | 16 |  |
| `data_314_1` | in | 16 |  |
| `data_315_1` | in | 16 |  |
| `data_316_1` | in | 16 |  |
| `data_317_1` | in | 16 |  |
| `data_318_1` | in | 16 |  |
| `data_319_1` | in | 16 |  |
| `data_320_1` | in | 16 |  |
| `data_321_1` | in | 16 |  |
| `data_322_1` | in | 16 |  |
| `data_323_1` | in | 16 |  |
| `data_324_1` | in | 16 |  |
| `data_325_1` | in | 16 |  |
| `data_326_1` | in | 16 |  |
| `data_327_1` | in | 16 |  |
| `data_328_1` | in | 16 |  |
| `data_329_1` | in | 16 |  |
| `reset` | in | 1 | reset, active high |
| `adr` | out | 8 | |
| `adr_first_reg_tx` | out | 16 | |
| `num_reg_tx` | out | 8 | |
| `adr_first_reg_rx` | out | 16 | |
| `num_reg_rx` | out | 8 | |
| `data_out` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_025439.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
