# Fill in the masked region of `mg_00040`

The file `mg_00040.v` holds a Verilog design whose top module is `mg_00040` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_00040`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_00040.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_00040` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_00040.v`. Only these files are graded.

## Interface of `mg_00040`

| port | dir | width | note |
|---|---|---|---|
| `io_mainClk` | in | 1 | clock, rising edge |
| `io_input_PADDR` | in | 20 |  |
| `io_input_PSEL` | in | 3 |  |
| `io_input_PENABLE` | in | 1 |  |
| `io_input_PWRITE` | in | 1 |  |
| `io_input_PWDATA` | in | 32 |  |
| `io_outputs_0_PREADY` | in | 1 |  |
| `io_outputs_0_PRDATA` | in | 32 |  |
| `io_outputs_0_PSLVERROR` | in | 1 |  |
| `io_outputs_1_PREADY` | in | 1 |  |
| `io_outputs_1_PRDATA` | in | 32 |  |
| `io_outputs_1_PSLVERROR` | in | 1 |  |
| `io_outputs_2_PREADY` | in | 1 |  |
| `io_outputs_2_PRDATA` | in | 32 |  |
| `io_outputs_2_PSLVERROR` | in | 1 |  |
| `resetCtrl_systemReset` | in | 1 | reset, active high |
| `io_input_PREADY` | out | 1 | |
| `io_input_PRDATA` | out | 32 | |
| `io_input_PSLVERROR` | out | 1 | |
| `io_outputs_0_PADDR` | out | 20 | |
| `io_outputs_0_PSEL` | out | 1 | |
| `io_outputs_0_PENABLE` | out | 1 | |
| `io_outputs_0_PWRITE` | out | 1 | |
| `io_outputs_0_PWDATA` | out | 32 | |
| `io_outputs_1_PADDR` | out | 20 | |
| `io_outputs_1_PSEL` | out | 1 | |
| `io_outputs_1_PENABLE` | out | 1 | |
| `io_outputs_1_PWRITE` | out | 1 | |
| `io_outputs_1_PWDATA` | out | 32 | |
| `io_outputs_2_PADDR` | out | 20 | |
| `io_outputs_2_PSEL` | out | 1 | |
| `io_outputs_2_PENABLE` | out | 1 | |
| `io_outputs_2_PWRITE` | out | 1 | |
| `io_outputs_2_PWDATA` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_00040.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
