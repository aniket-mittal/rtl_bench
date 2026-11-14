# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**100-bit Loadable Rotator with Clear**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|-------|-----------|-------|
| `clk` | input | 1 |
| `load` | input | 1 |
| `ena` | input | 2 |
| `data` | input | 100 |
| `q` | output (registered) | 100 |

The module holds a 100-bit register whose current value is presented on `q`. The register updates only on the rising edge of `clk`. There is no reset input, so the initial value of `q` is unspecified until the first clock edge that updates it.

On each rising clock edge, the next value of `q` is determined by the following priority:

1. If `load` is asserted, `q` takes the value of `data`, regardless of `ena`.
2. Otherwise, if `ena` equals `2'b01`, `q` is rotated right by one bit position: the least significant bit (bit 0) wraps around to become the most significant bit (bit 99), and every other bit moves one position toward the least significant end.
3. Otherwise, if `ena` equals `2'b10`, `q` is rotated left by one bit position: the most significant bit (bit 99) wraps around to become the least significant bit (bit 0), and every other bit moves one position toward the most significant end.
4. Otherwise (that is, `ena` equals `2'b00` or `2'b11`), `q` is cleared to all zeros. Note that the register does **not** hold its value in this case.

No bits are lost during a rotation, and all behavior is synchronous to the rising edge of `clk`.

Implement the module so that its port names, directions, and widths match the table exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `ena` | in | 2 |  |
| `data` | in | 100 |  |
| `q` | out | 100 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
