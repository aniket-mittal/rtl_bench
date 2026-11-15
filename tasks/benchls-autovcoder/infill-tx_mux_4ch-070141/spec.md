# Fill in the masked region of `autovcoder_070141`

The file `autovcoder_070141.v` holds a Verilog design whose top module is `autovcoder_070141` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `autovcoder_070141`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: AutoVCoder-processed.

## Rules

- Edit only `autovcoder_070141.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `autovcoder_070141` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `autovcoder_070141.v`. Only these files are graded.

## Interface of `autovcoder_070141`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rstn` | in | 1 | reset, active low |
| `tx_val` | in | 1 |  |
| `tx_req_0` | in | 1 |  |
| `tx_din_0` | in | 64 |  |
| `tx_sop_0` | in | 1 |  |
| `tx_eop_0` | in | 1 |  |
| `tx_dwen_0` | in | 1 |  |
| `tx_req_1` | in | 1 |  |
| `tx_din_1` | in | 64 |  |
| `tx_sop_1` | in | 1 |  |
| `tx_eop_1` | in | 1 |  |
| `tx_dwen_1` | in | 1 |  |
| `tx_req_2` | in | 1 |  |
| `tx_din_2` | in | 64 |  |
| `tx_sop_2` | in | 1 |  |
| `tx_eop_2` | in | 1 |  |
| `tx_dwen_2` | in | 1 |  |
| `tx_req_3` | in | 1 |  |
| `tx_din_3` | in | 64 |  |
| `tx_sop_3` | in | 1 |  |
| `tx_eop_3` | in | 1 |  |
| `tx_dwen_3` | in | 1 |  |
| `tx_rdy` | in | 1 |  |
| `tx_rdy_0` | out | 1 | |
| `tx_rdy_1` | out | 1 | |
| `tx_rdy_2` | out | 1 | |
| `tx_rdy_3` | out | 1 | |
| `tx_req` | out | 1 | |
| `tx_dout` | out | 64 | |
| `tx_sop` | out | 1 | |
| `tx_eop` | out | 1 | |
| `tx_dwen` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v autovcoder_070141.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
