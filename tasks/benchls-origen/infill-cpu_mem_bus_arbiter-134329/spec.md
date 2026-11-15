# Fill in the masked region of `origen_134329`

The file `origen_134329.v` holds a Verilog design whose top module is `origen_134329` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_134329`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_134329.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_134329` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_134329.v`. Only these files are graded.

## Interface of `origen_134329`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset_n` | in | 1 | reset, active low |
| `d_readdata` | in | 32 |  |
| `d_waitrequest` | in | 1 |  |
| `i_readdata` | in | 32 |  |
| `i_waitrequest` | in | 1 |  |
| `irq` | in | 1 |  |
| `debug_mem_slave_address` | in | 9 |  |
| `debug_mem_slave_byteenable` | in | 4 |  |
| `debug_mem_slave_debugaccess` | in | 1 |  |
| `debug_mem_slave_read` | in | 1 |  |
| `debug_mem_slave_write` | in | 1 |  |
| `debug_mem_slave_writedata` | in | 32 |  |
| `d_address` | out | 32 | |
| `d_byteenable` | out | 4 | |
| `d_read` | out | 1 | |
| `d_write` | out | 1 | |
| `d_writedata` | out | 32 | |
| `debug_mem_slave_readdata` | out | 32 | |
| `debug_mem_slave_waitrequest` | out | 1 | |
| `i_address` | out | 32 | |
| `i_read` | out | 1 | |
| `debug_mem_slave_debugaccess_to_roms` | out | 1 | |
| `debug_reset_request` | out | 1 | |
| `dummy_ci_port` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_134329.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
