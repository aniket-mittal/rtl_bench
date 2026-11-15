# Fill in the masked region of `origen_135309`

The file `origen_135309.v` holds a Verilog design whose top module is `origen_135309` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a module (or gate) instantiation statement in module `origen_135309`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: OriGen-processed.

## Rules

- Edit only `origen_135309.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `origen_135309` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `origen_135309.v`. Only these files are graded.

## Interface of `origen_135309`

| port | dir | width | note |
|---|---|---|---|
| `cal_blk_clk` | in | 1 |  |
| `gxb_powerdown` | in | 1 |  |
| `pipe8b10binvpolarity` | in | 1 |  |
| `pll_inclk` | in | 1 |  |
| `powerdn` | in | 2 |  |
| `rx_analogreset` | in | 1 | reset, active high |
| `rx_cruclk` | in | 1 |  |
| `rx_datain` | in | 1 |  |
| `rx_digitalreset` | in | 1 |  |
| `tx_ctrlenable` | in | 1 |  |
| `tx_datain` | in | 8 |  |
| `tx_detectrxloop` | in | 1 |  |
| `tx_digitalreset` | in | 1 |  |
| `tx_forcedispcompliance` | in | 1 |  |
| `tx_forceelecidle` | in | 1 |  |
| `pipedatavalid` | out | 1 | |
| `pipeelecidle` | out | 1 | |
| `pipephydonestatus` | out | 1 | |
| `pipestatus` | out | 3 | |
| `pll_locked` | out | 1 | |
| `rx_ctrldetect` | out | 1 | |
| `rx_dataout` | out | 8 | |
| `rx_freqlocked` | out | 1 | |
| `rx_patterndetect` | out | 1 | |
| `rx_pll_locked` | out | 1 | |
| `rx_syncstatus` | out | 1 | |
| `tx_clkout` | out | 1 | |
| `tx_dataout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v origen_135309.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
