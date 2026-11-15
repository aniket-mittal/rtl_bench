# Fill in the masked region of `mg_08055`

The file `mg_08055.v` holds a Verilog design whose top module is `mg_08055` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_08055`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_08055.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_08055` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_08055.v`. Only these files are graded.

## Interface of `mg_08055`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `io_in_valid` | in | 1 |  |
| `io_in_bits_addr` | in | 10 |  |
| `io_in_bits_rw` | in | 1 |  |
| `io_in_bits_wData` | in | 192 |  |
| `io_in_tag` | in | 10 |  |
| `io_out_ready` | in | 1 |  |
| `io_pcIn_valid` | in | 1 |  |
| `io_pcIn_bits_request` | in | 1 |  |
| `io_pcIn_bits_moduleId` | in | 16 |  |
| `io_pcIn_bits_portId` | in | 8 |  |
| `io_pcIn_bits_pcValue` | in | 20 |  |
| `io_pcIn_bits_pcType` | in | 4 |  |
| `io_in_ready` | out | 1 | |
| `io_out_valid` | out | 1 | |
| `io_out_bits_rData` | out | 192 | |
| `io_out_tag` | out | 10 | |
| `io_pcOut_valid` | out | 1 | |
| `io_pcOut_bits_request` | out | 1 | |
| `io_pcOut_bits_moduleId` | out | 16 | |
| `io_pcOut_bits_portId` | out | 8 | |
| `io_pcOut_bits_pcValue` | out | 20 | |
| `io_pcOut_bits_pcType` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_08055.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
