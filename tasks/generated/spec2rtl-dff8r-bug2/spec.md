# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Resettable 8-bit Register**

Design a Verilog module named `dut` that implements an 8-bit register with a synchronous, active-low reset.

**Ports**

| Name    | Direction | Width |
|---------|-----------|-------|
| `clk`   | input     | 1     |
| `d`     | input     | 8     |
| `reset` | input     | 1     |
| `q`     | output    | 8     |

**Behavior**

- The output `q` is registered: it changes only in response to the rising edge of `clk`, and holds its value between rising edges.
- On each rising edge of `clk`, the reset input is examined first:
  - If `reset` is low (0), `q` is cleared to all zeros (8'b00000000), regardless of the value of `d`.
  - If `reset` is high (1), `q` captures the current value of `d`.
- The reset is synchronous only. A change in `reset` between clock edges has no effect on `q` until the next rising edge of `clk`.
- There is no enable signal. When `reset` is high, `q` is updated with `d` on every rising clock edge.
- No initial value is specified for `q` before the first rising clock edge, and your design should not depend on one.

**Example**

| Clock edge | `reset` | `d`        | `q` after edge |
|------------|---------|------------|----------------|
| 1          | 0       | 8'hA5      | 8'h00          |
| 2          | 1       | 8'hA5      | 8'hA5          |
| 3          | 1       | 8'h3C      | 8'h3C          |
| 4          | 0       | 8'hFF      | 8'h00          |
| 5          | 1       | 8'h12      | 8'h12          |

Your module must match the port names, directions, and widths exactly as specified above.

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
