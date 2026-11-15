# Fill in the masked region of `mg_07329`

The file `mg_07329.v` holds a Verilog design whose top module is `mg_07329` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_07329`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_07329.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_07329` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_07329.v`. Only these files are graded.

## Interface of `mg_07329`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `clk7_en` | in | 1 |  |
| `clk7n_en` | in | 1 |  |
| `blk` | in | 1 |  |
| `c1` | in | 1 |  |
| `c3` | in | 1 |  |
| `eclk` | in | 10 |  |
| `vpa` | in | 1 |  |
| `dbr` | in | 1 |  |
| `dbs` | in | 1 |  |
| `xbs` | in | 1 |  |
| `nrdy` | in | 1 |  |
| `cck` | in | 1 |  |
| `cpu_speed` | in | 1 |  |
| `memory_config` | in | 4 |  |
| `_as` | in | 1 |  |
| `_lds` | in | 1 |  |
| `_uds` | in | 1 |  |
| `r_w` | in | 1 |  |
| `address` | in | 23 |  |
| `cpudatain` | in | 16 |  |
| `data_in` | in | 16 |  |
| `_cpu_reset` | in | 1 | reset, active high |
| `cpu_halt` | in | 1 |  |
| `host_cs` | in | 1 |  |
| `host_adr` | in | 23 |  |
| `host_we` | in | 1 |  |
| `host_bs` | in | 2 |  |
| `host_wdat` | in | 16 |  |
| `bls` | out | 1 | |
| `turbo` | out | 1 | |
| `_dtack` | out | 1 | |
| `rd` | out | 1 | |
| `hwr` | out | 1 | |
| `lwr` | out | 1 | |
| `address_out` | out | 23 | |
| `data` | out | 16 | |
| `data_out` | out | 16 | |
| `host_rdat` | out | 16 | |
| `host_ack` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_07329.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
