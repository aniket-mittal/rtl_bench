# Fill in the masked region of `rtlpp_00031`

The file `rtlpp_00031.v` holds a Verilog design whose top module is `rtlpp_00031` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `rtlpp_00031`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-RTLPP.

## Rules

- Edit only `rtlpp_00031.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `rtlpp_00031` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `rtlpp_00031.v`. Only these files are graded.

## Interface of `rtlpp_00031`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `phy_tx_mode` | in | 1 |  |
| `rxd` | in | 1 |  |
| `rxdp` | in | 1 |  |
| `rxdn` | in | 1 |  |
| `LineCtrl_i` | in | 1 |  |
| `DataOut_i` | in | 8 |  |
| `TxValid_i` | in | 1 |  |
| `usb_rst` | out | 1 | |
| `txdp` | out | 1 | |
| `txdn` | out | 1 | |
| `txoe` | out | 1 | |
| `ce_o` | out | 1 | |
| `sync_err_o` | out | 1 | |
| `bit_stuff_err_o` | out | 1 | |
| `byte_err_o` | out | 1 | |
| `TxReady_o` | out | 1 | |
| `DataIn_o` | out | 8 | |
| `RxValid_o` | out | 1 | |
| `RxActive_o` | out | 1 | |
| `RxError_o` | out | 1 | |
| `LineState_o` | out | 2 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v rtlpp_00031.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
