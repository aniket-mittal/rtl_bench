# Fill in the masked region of `origen_009187`

The file `origen_009187.v` holds a Verilog design whose top module is `origen_009187` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `origen_009187`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_009187.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_009187` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_009187.v`. Only these files are graded.

## Interface of `origen_009187`

| port | dir | width | note |
|---|---|---|---|
| `no_dcache` | in | 1 |  |
| `cpu_req` | in | 1 |  |
| `cpu_we` | in | 1 |  |
| `cpu_size` | in | 2 |  |
| `cpu_addr` | in | 32 |  |
| `cpu_wdata` | in | 32 |  |
| `ram_rdata` | in | 32 |  |
| `ram_addr_ack` | in | 1 |  |
| `ram_data_ack` | in | 1 |  |
| `cfg_rdata` | in | 32 |  |
| `cfg_addr_ack` | in | 1 |  |
| `cfg_data_ack` | in | 1 |  |
| `cpu_rdata` | out | 32 | |
| `cpu_addr_ack` | out | 1 | |
| `cpu_data_ack` | out | 1 | |
| `ram_req` | out | 1 | |
| `ram_we` | out | 1 | |
| `ram_size` | out | 2 | |
| `ram_addr` | out | 32 | |
| `ram_wdata` | out | 32 | |
| `cfg_req` | out | 1 | |
| `cfg_we` | out | 1 | |
| `cfg_size` | out | 2 | |
| `cfg_addr` | out | 32 | |
| `cfg_wdata` | out | 32 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_009187.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
