# Fill in the masked region of `mg_04304`

The file `mg_04304.v` holds a Verilog design whose top module is `mg_04304` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_04304`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_04304.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_04304` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_04304.v`. Only these files are graded.

## Interface of `mg_04304`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `resetn` | in | 1 | reset, active low |
| `i_settings` | in | 2 |  |
| `i_register_settings` | in | 32 |  |
| `i_dataa` | in | 32 |  |
| `i_dataa_valid` | in | 1 |  |
| `i_datab` | in | 32 |  |
| `i_datab_valid` | in | 1 |  |
| `i_dataouta_stall` | in | 1 |  |
| `i_dataoutb_stall` | in | 1 |  |
| `o_dataa_stall` | out | 1 | |
| `o_datab_stall` | out | 1 | |
| `o_dataouta` | out | 32 | |
| `o_dataouta_valid` | out | 1 | |
| `o_dataoutb` | out | 32 | |
| `o_dataoutb_valid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_04304.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
