# Fill in the masked region of `autovcoder_020527`

The file `autovcoder_020527.v` holds a Verilog design whose top module is `autovcoder_020527` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_020527`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_020527.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_020527` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_020527.v`. Only these files are graded.

## Interface of `autovcoder_020527`

| port | dir | width | note |
|---|---|---|---|
| `m2` | in | 1 |  |
| `romsel` | in | 1 |  |
| `cpu_rw_in` | in | 1 |  |
| `cpu_addr_in` | in | 15 |  |
| `cpu_data_in` | in | 8 |  |
| `ppu_rd_in` | in | 1 |  |
| `ppu_wr_in` | in | 1 |  |
| `ppu_addr_in` | in | 4 |  |
| `led` | out | 1 | |
| `cpu_addr_out` | out | 7 | |
| `cpu_wr_out` | out | 1 | |
| `cpu_rd_out` | out | 1 | |
| `cpu_flash_ce` | out | 1 | |
| `cpu_sram_ce` | out | 1 | |
| `ppu_addr_out` | out | 9 | |
| `ppu_rd_out` | out | 1 | |
| `ppu_wr_out` | out | 1 | |
| `ppu_flash_ce` | out | 1 | |
| `ppu_sram_ce` | out | 1 | |
| `ppu_ciram_a10` | out | 1 | |
| `ppu_ciram_ce` | out | 1 | |
| `irq` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_020527.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
