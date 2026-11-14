# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Load-Select Flip-Flop**

Design a Verilog module named `dut` that implements a single-bit registered selector.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `w`   | input | 1 |
| `R`   | input | 1 |
| `E`   | input | 1 |
| `L`   | input | 1 |
| `Q`   | output | 1 |

`Q` must be a registered output (it holds state between clock edges).

**Behavior**

On every rising edge of `clk`, `Q` is updated with a new value chosen by the control input `L`:

- When `L` is high, `Q` takes the value of `R`.
- When `L` is low, `Q` takes the value of `w`.

Between rising clock edges, `Q` holds its value. Changes on the data or control inputs have no effect on `Q` until the next rising edge of `clk`.

**Notes and edge cases**

- There is no reset input. The initial value of `Q` is unspecified, and your design should not assume or force any particular power-up value.
- The input `E` is part of the interface and must be declared exactly as listed, but it does not influence the behavior of `Q`. Do not use it as an enable or for any other purpose.
- Only the rising edge of `clk` triggers updates; the design must be fully synchronous with no asynchronous controls.
- `Q` is updated on every rising clock edge, regardless of `E`.

Your task is to write the module so that it matches the port names, directions, and widths above and exhibits exactly this behavior.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `w` | in | 1 |  |
| `R` | in | 1 |  |
| `E` | in | 1 |  |
| `L` | in | 1 |  |
| `Q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
