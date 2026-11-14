# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Loadable Right-Shift Register with Asynchronous Reset**

Design a Verilog module named `dut` that implements a 4-bit register with an asynchronous reset, a parallel load, and a shift operation.

**Ports**

| Name     | Direction | Width |
|----------|-----------|-------|
| `clk`    | input     | 1     |
| `areset` | input     | 1     |
| `load`   | input     | 1     |
| `ena`    | input     | 1     |
| `data`   | input     | 4     |
| `q`      | output    | 4     |

`q` is a registered output holding the current state of the register.

**Behavior**

- **Asynchronous reset:** When `areset` is asserted (high), `q` is immediately cleared to `4'b0000`, regardless of the clock and every other input. It stays cleared for as long as `areset` is high.
- **Clocked operation:** When `areset` is low, the register updates only on the rising edge of `clk`, according to the following priority (highest first):
  1. If `ena` is high, the register performs a right shift by one position. The three upper bits of the old value move down one place, and the most significant bit of the new value is `0`. In other words, the new value is the old value's upper three bits (bits 3 down to 1) placed in the low positions, zero-extended to 4 bits. The `load` input is ignored in this case.
  2. Otherwise, if `load` is high, `q` takes the value of `data`.
  3. Otherwise, `q` holds its current value.

**Notes**

- `ena` takes priority over `load` when both are high.
- The design must be purely synchronous apart from the asynchronous reset. There must be no combinational path from the inputs to `q`.
- All sequential behavior is triggered on the rising edge of `clk`, and the reset is active-high.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `load` | in | 1 |  |
| `ena` | in | 1 |  |
| `data` | in | 4 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
