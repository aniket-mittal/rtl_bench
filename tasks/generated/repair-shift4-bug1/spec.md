# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**4-Bit Loadable Shift Register with Bit-Reversed Load**

Design a Verilog module named `dut` that implements a 4-bit register with asynchronous reset, a parallel load, and a shift operation.

**Ports**

| Name     | Direction | Width |
|----------|-----------|-------|
| `clk`    | input     | 1     |
| `areset` | input     | 1     |
| `load`   | input     | 1     |
| `ena`    | input     | 1     |
| `data`   | input     | 4     |
| `q`      | output    | 4     |

`q` must be a registered output.

**Behavior**

- **Reset:** When `areset` is asserted (active high), `q` is cleared to `4'b0000` immediately, regardless of the clock. Reset has priority over everything else.
- **Clocking:** All other behavior occurs on the rising edge of `clk`.
- **Load (priority over shift):** If `load` is high, `q` is loaded with the bit-reversed value of `data`: the most significant bit of `q` receives `data[0]`, and the least significant bit of `q` receives `data[3]`, with the middle bits swapped accordingly.
- **Shift:** If `load` is low and `ena` is high, the register shifts right by one position: the upper three bits of the old `q` become the new lower three bits (the old MSB moves to bit 2, old bit 2 to bit 1, old bit 1 to bit 0). The old bit 0 is discarded. The new MSB of `q` is filled with `0`.
- **Hold:** If neither `load` nor `ena` is high, `q` keeps its current value.

**Notes**

- The priority order is: `areset` > `load` > `ena` > hold.
- No other outputs or internal ports are allowed. The module name and port names/widths must match exactly.

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
