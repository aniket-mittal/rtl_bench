# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Byte-Enabled Register with Synchronous Reset**

Design a Verilog module named `dut` that implements a 16-bit register whose two bytes can be written independently.

**Ports**

| Name     | Direction | Width |
|----------|-----------|-------|
| `clk`    | input     | 1     |
| `resetn` | input     | 1     |
| `byteena`| input     | 2     |
| `d`      | input     | 16    |
| `q`      | output    | 16    |

**Behavior**

All state changes occur on the rising edge of `clk`. The output `q` is the register's stored value, so it only changes immediately after a rising clock edge.

- **Reset:** Despite its name, `resetn` is active-high. When `resetn` is 1 at a rising clock edge, the register is cleared to all zeros. The reset is synchronous, and it takes priority over any write enables.
- **Write:** When `resetn` is 0 at a rising clock edge, each byte of the register is updated independently according to its enable bit in `byteena`:
  - If `byteena[0]` is 1, the lower byte `q[7:0]` takes the value of `d[7:0]`.
  - If `byteena[1]` is 1, the upper byte `q[15:8]` takes the value of `d[15:8]`.
  - A byte whose enable bit is 0 keeps its previous value.
- If both enable bits are 0 and `resetn` is 0, the register holds its entire value.

There is no initial value specified for `q` before the first clock edge; your design is only evaluated after behavior defined by clock edges.

**Example**

Suppose `q = 16'h1234`, `resetn = 0`, `byteena = 2'b10`, and `d = 16'hABCD`. After the next rising clock edge, `q = 16'hAB34`. If `resetn` had been 1 instead, `q` would be `16'h0000`.

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
