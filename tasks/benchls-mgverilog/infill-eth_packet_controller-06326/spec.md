# Fill in the masked region of `mg_06326`

The file `mg_06326.v` holds a Verilog design whose top module is `mg_06326` (sequential). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, a continuous `assign` statement in module `mg_06326`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: sequential. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_06326.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_06326` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_06326.v`. Only these files are graded.

## Interface of `mg_06326`

| port | dir | width | note |
|---|---|---|---|
| `CLK` | in | 1 | clock, rising edge |
| `OUT_TICK` | in | 1 |  |
| `ETH_WR_DONE` | in | 1 |  |
| `ETH_WR_BUSY` | in | 1 |  |
| `ETH_RD_DONE` | in | 1 |  |
| `ETH_RD_BUSY` | in | 1 |  |
| `ETH_RD_READY` | in | 1 |  |
| `IN_ETH_STREAM` | in | 10 |  |
| `PROCESS_TIME` | in | 24 |  |
| `TEMPERATURE` | in | 16 |  |
| `V_VCCINT` | in | 16 |  |
| `V_VCCAUX` | in | 16 |  |
| `BUTTONS` | in | 8 |  |
| `ETH_RD_PIX` | in | 24 |  |
| `USER_STATUS` | in | 128 |  |
| `ETH_WR_CLK` | out | 1 | |
| `ETH_WR_STB` | out | 1 | |
| `ETH_RD_CLK` | out | 1 | |
| `OUT_ETH_STREAM` | out | 10 | |
| `ETH_BUSY` | out | 1 | |
| `CTRL_BUSY` | out | 1 | |
| `CTRL_STRB` | out | 1 | |
| `ETH_WR_GO` | out | 1 | |
| `ETH_RD_GO` | out | 1 | |
| `ETH_RD_STB` | out | 1 | |
| `CTRL_ENABLES` | out | 16 | |
| `IMG_SIZE_X` | out | 16 | |
| `IMG_SIZE_Y` | out | 16 | |
| `CTRL_COEFF` | out | 400 | |
| `ETH_WR_START_X` | out | 16 | |
| `ETH_WR_LINE` | out | 16 | |
| `ETH_WR_NUM_PIXELS` | out | 16 | |
| `ETH_WR_PIX` | out | 24 | |
| `ETH_RD_START_X` | out | 16 | |
| `ETH_RD_LINE` | out | 16 | |
| `ETH_RD_NUM_PIXELS` | out | 16 | |
| `USER_CTRL_EN` | out | 8 | |
| `USER_CTRL` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_06326.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
