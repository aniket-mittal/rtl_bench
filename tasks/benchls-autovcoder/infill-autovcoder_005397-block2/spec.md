# Fill in the masked region of `autovcoder_005397`

The file `autovcoder_005397.v` holds a Verilog design whose top module is `autovcoder_005397` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_005397`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_005397.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_005397` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_005397.v`. Only these files are graded.

## Interface of `autovcoder_005397`

| port | dir | width | note |
|---|---|---|---|
| `pclk` | in | 1 | clock, rising edge |
| `mem_addr_add` | in | 8 |  |
| `mem_write_add` | in | 1 |  |
| `mem_write_data_add` | in | 83 |  |
| `mem_addr_age` | in | 8 |  |
| `mem_write_age` | in | 1 |  |
| `mem_write_data_age` | in | 83 |  |
| `mem_read_data_add` | out | 83 | |
| `mem_read_data_age` | out | 83 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_005397.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
