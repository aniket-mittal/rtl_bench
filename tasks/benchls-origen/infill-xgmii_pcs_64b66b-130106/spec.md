# Fill in the masked region of `origen_130106`

The file `origen_130106.v` holds a Verilog design whose top module is `origen_130106` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `origen_130106`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_130106.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_130106` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_130106.v`. Only these files are graded.

## Interface of `origen_130106`

| port | dir | width | note |
|---|---|---|---|
| `rx_clk` | in | 1 | clock, rising edge |
| `rx_rst` | in | 1 | reset, active high |
| `tx_clk` | in | 1 |  |
| `tx_rst` | in | 1 |  |
| `xgmii_txd` | in | 64 |  |
| `xgmii_txc` | in | 8 |  |
| `serdes_rx_data` | in | 64 |  |
| `serdes_rx_hdr` | in | 2 |  |
| `tx_prbs31_enable` | in | 1 |  |
| `rx_prbs31_enable` | in | 1 |  |
| `xgmii_rxd` | out | 64 | |
| `xgmii_rxc` | out | 8 | |
| `serdes_tx_data` | out | 64 | |
| `serdes_tx_hdr` | out | 2 | |
| `serdes_rx_bitslip` | out | 1 | |
| `serdes_rx_reset_req` | out | 1 | |
| `tx_bad_block` | out | 1 | |
| `rx_error_count` | out | 8 | |
| `rx_bad_block` | out | 1 | |
| `rx_sequence_error` | out | 1 | |
| `rx_block_lock` | out | 1 | |
| `rx_high_ber` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_130106.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
