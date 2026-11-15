# Fill in the masked region of `mg_02083`

The file `mg_02083.v` holds a Verilog design whose top module is `mg_02083` (combinational). Part of the design was removed, and the text `[MASKED]` appears exactly once in its place. That marker is the literal string `[MASKED]` (square brackets included), not a comment.

**Your job:** replace `[MASKED]` with Verilog so the whole design again does what it is evidently meant to do. Work out the missing logic from the rest of the code: the port list, the declared signals, how those signals are used elsewhere, the module and signal names, and any comments.

## What was masked

- Mask type: **block**. One complete module item, an `always` block in module `mg_02083`, was replaced by `[MASKED]`. Write that one item, with the same kind of construct, in its place.
- Design type: combinational. Origin: RTL-Dataset-MG-Verilog.

## Rules

- Edit only `mg_02083.v`. When you are done it must not contain `[MASKED]`.
- Keep every name the surrounding code uses (signals, ports, parameters, modules), and keep the rest of the file as it is. You may declare new internal signals if you need them.
- Write synthesizable code that iverilog and yosys can compile. Use Verilog-2005, or SystemVerilog only where the file already uses SystemVerilog constructs.

## Grading

Your completed `mg_02083` is simulated against the original design and checked for formal equivalence with it. Only behavior at the top-module ports counts. The code does not have to match the original text.

---

## Files

Edit: `mg_02083.v`. Only these files are graded.

## Interface of `mg_02083`

| port | dir | width | note |
|---|---|---|---|
| `iCLOCK` | in | 1 | clock, rising edge |
| `inRESET` | in | 1 | reset, active high |
| `iIF_SELECT` | in | 1 |  |
| `iDEBUG_UART_RXD` | in | 1 |  |
| `iDEBUG_PARA_REQ` | in | 1 |  |
| `iDEBUG_PARA_CMD` | in | 8 |  |
| `iDEBUG_PARA_DATA` | in | 32 |  |
| `iDEBUG_PARA_BUSY` | in | 1 |  |
| `iDEBUG_COM_BUSY` | in | 1 |  |
| `iDEBUG_COM_VALID` | in | 1 |  |
| `iDEBUG_COM_ERROR` | in | 1 |  |
| `iDEBUG_COM_DATA` | in | 32 |  |
| `oDEBUG_UART_TXD` | out | 1 | |
| `oDEBUG_PARA_BUSY` | out | 1 | |
| `oDEBUG_PARA_VALID` | out | 1 | |
| `oDEBUG_PARA_ERROR` | out | 1 | |
| `oDEBUG_PARA_DATA` | out | 32 | |
| `oDEBUG_COM_REQ` | out | 1 | |
| `oDEBUG_COM_CMD` | out | 8 | |
| `oDEBUG_COM_DATA` | out | 32 | |
| `oDEBUG_COM_BUSY` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v mg_02083.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
