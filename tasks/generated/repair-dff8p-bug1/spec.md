# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Negative-Edge 8-Bit Register with Synchronous Reset**

Design a Verilog module named `dut` that implements an 8-bit data register which captures its input on the **falling** edge of the clock.

**Ports**

| Name    | Direction | Width  |
|---------|-----------|--------|
| `clk`   | input     | 1 bit  |
| `d`     | input     | 8 bits |
| `reset` | input     | 1 bit  |
| `q`     | output    | 8 bits |

**Behavior**

- All state changes occur only on the falling edge of `clk` (the transition from 1 to 0). Nothing happens on the rising edge, and changes to `d` or `reset` between falling edges have no effect on `q`.
- The reset is **synchronous** and **active-high**: it is sampled only at the falling clock edge. If `reset` is 1 at that edge, `q` is loaded with the hexadecimal constant `0x43` (binary `01000011`), regardless of the value of `d`.
- If `reset` is 0 at the falling clock edge, `q` is loaded with the current value of `d`.
- `q` is a registered output: it holds its value between falling clock edges. No initial value is specified for `q` before the first falling edge.

**Requirements**

- Module name, port names, directions, and widths must match the table exactly.
- The design must be synthesizable and use no asynchronous behavior.

**Example**

| Falling edge | `reset` | `d`    | `q` after edge |
|--------------|---------|--------|----------------|
| 1            | 1       | `0xFF` | `0x43`         |
| 2            | 0       | `0xA5` | `0xA5`         |
| 3            | 0       | `0x00` | `0x00`         |
| 4            | 1       | `0x12` | `0x43`         |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `reset` | in | 1 | reset, active high |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
