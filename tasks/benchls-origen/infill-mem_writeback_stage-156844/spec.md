# Fill in the masked region of `origen_156844`

The file `origen_156844.v` holds a Verilog design whose top module is `origen_156844` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_156844`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_156844.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_156844` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_156844.v`. Only these files are graded.

## Interface of `origen_156844`

| port | dir | width | note |
|---|---|---|---|
| `aluout` | in | 32 |  |
| `Memdata` | in | 32 |  |
| `WritetoRFaddrin` | in | 5 |  |
| `MemtoRegW` | in | 1 |  |
| `RegWriteW` | in | 1 |  |
| `HILO_data` | in | 64 |  |
| `PCin` | in | 32 |  |
| `MemReadTypeW` | in | 2 |  |
| `EPCD` | in | 32 |  |
| `HI_LO_writeenablein` | in | 1 |  |
| `exception_in` | in | 1 |  |
| `MemWriteW` | in | 1 |  |
| `is_ds_in` | in | 1 |  |
| `WriteinRF_HI_LO_data` | out | 64 | |
| `WritetoRFaddrout` | out | 5 | |
| `HI_LO_writeenableout` | out | 1 | |
| `WritetoRFdata` | out | 32 | |
| `RegWrite` | out | 1 | |
| `PCout` | out | 32 | |
| `exception_out` | out | 1 | |
| `MemWrite` | out | 1 | |
| `is_ds_out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_156844.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
