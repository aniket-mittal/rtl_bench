# Fill in the masked region of `origen_136469`

The file `origen_136469.v` holds a Verilog design whose top module is `origen_136469` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_136469`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: OriGen-processed.

## Rules

- Edit only `origen_136469.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_136469` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_136469.v`. Only these files are graded.

## Interface of `origen_136469`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `tx_data` | in | 64 |  |
| `tx_keep` | in | 8 |  |
| `tx_valid` | in | 1 |  |
| `tx_sop` | in | 1 |  |
| `tx_eop` | in | 1 |  |
| `ptp_ts` | in | 96 |  |
| `ifg_delay` | in | 8 |  |
| `prbs31_enable` | in | 1 |  |
| `user_tag` | in | 16 |  |
| `tx_ready` | out | 1 | |
| `serdes_tx_data` | out | 64 | |
| `serdes_tx_header` | out | 8 | |
| `tx_ptp_ts` | out | 96 | |
| `tx_ptp_ts_valid` | out | 1 | |
| `tx_start` | out | 1 | |
| `tx_underflow_error` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_136469.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
