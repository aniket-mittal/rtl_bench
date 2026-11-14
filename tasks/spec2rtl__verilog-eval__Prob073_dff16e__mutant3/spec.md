# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Byte-Enabled Register with Synchronous Reset**

Design a Verilog module named `dut` that implements a 16-bit register whose two bytes are updated independently under control of a 2-bit byte-enable input.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `resetn` | input | 1 |
| `byteena` | input | 2 |
| `d` | input | 16 |
| `q` | output | 16 |

**Behavior**

All state changes occur on the rising edge of `clk`. The output `q` is the register's stored value and must hold its value between clock edges.

- **Reset:** `resetn` is an active-low, synchronous reset. When `resetn` is 0 at a rising clock edge, `q` is cleared to all zeros, regardless of `byteena` and `d`.
- **Normal operation:** When `resetn` is 1 at a rising clock edge, each byte of `q` is handled separately:
  - The **upper byte** (`q[15:8]`) loads `d[15:8]` when `byteena[1]` is 1, and otherwise keeps its previous value.
  - The **lower byte** (`q[7:0]`) is controlled by `byteena[0]` with **inverted polarity**: it loads `d[7:0]` when `byteena[0]` is 0, and keeps its previous value when `byteena[0]` is 1.

The two bytes are independent, so any combination of loading and holding may occur in the same cycle (e.g., `byteena = 2'b10` loads both bytes, while `byteena = 2'b01` loads neither).

There is no initial value requirement for `q` before the first reset.

Implement the module so that its cycle-by-cycle behavior matches the description exactly, including the unusual polarity of `byteena[0]`.

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
