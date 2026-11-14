# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Byte-Enabled Register with Asynchronous Reset**

Design a Verilog module named `dut` that implements a 16-bit register whose two bytes can be updated independently.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `resetn` | input | 1 |
| `byteena` | input | 2 |
| `d` | input | 16 |
| `q` | output | 16 |

**Behavior**

- The output `q` is the registered 16-bit value. It changes only in response to the events described below.
- `resetn` is an active-low, asynchronous reset. Whenever `resetn` is low, `q` is immediately cleared to all zeros, regardless of the clock or any other input. Reset takes priority over all other behavior.
- When `resetn` is high, the register is updated on the rising edge of `clk`, according to `byteena`:
  - If `byteena[0]` is 1, the lower byte of `q` (bits 7:0) is loaded with the lower byte of `d` (bits 7:0).
  - If `byteena[1]` is 1, the upper byte of `q` (bits 15:8) is loaded with the upper byte of `d` (bits 15:8).
  - Each byte is controlled independently of the other. A byte whose enable bit is 0 keeps its previous value.
  - If `byteena` is `2'b00`, `q` holds its entire value.
  - If `byteena` is `2'b11`, all 16 bits are loaded from `d`.
- There is no other logic: no output gating, no additional enables, and no combinational path from `d` or `byteena` to `q`.

Your task is to write the module so that its cycle-by-cycle behavior matches the description above exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `resetn` | in | 1 | reset, active low |
| `byteena` | in | 2 |  |
| `d` | in | 16 |  |
| `q` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
