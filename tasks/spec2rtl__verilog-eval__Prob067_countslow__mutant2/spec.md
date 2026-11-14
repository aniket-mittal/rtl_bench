# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Decade Counter with Enable and Asynchronous Reset**

Design a Verilog module named `dut` that implements a synchronous decimal (modulo-10) counter with a slow-enable input and an asynchronous reset.

**Ports**

| Name      | Direction | Width  | Description                          |
|-----------|-----------|--------|--------------------------------------|
| `clk`     | input     | 1 bit  | Clock signal                         |
| `slowena` | input     | 1 bit  | Count enable                         |
| `reset`   | input     | 1 bit  | Active-high asynchronous reset       |
| `q`       | output    | 4 bits | Current count value (registered)     |

**Behavior**

- `q` is a registered output that holds the current count.
- When `reset` is asserted (high), `q` is immediately forced to 0, regardless of the clock or any other input. Reset takes priority over everything else and does not wait for a clock edge.
- Otherwise, on each rising edge of `clk`:
  - If `slowena` is high, the counter advances: `q` increases by 1 each enabled cycle, counting 0, 1, 2, ..., 9, and then wraps back to 0 on the next enabled edge after reaching 9.
  - If `slowena` is low, `q` holds its current value.
- The counter's normal sequence never exceeds 9. No special handling is required beyond the natural rollover behavior described above; for any value of `q` other than 9, an enabled clock edge simply increments it by one (using 4-bit arithmetic).

Your design should be a single module with exactly the module name and port names/widths given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `slowena` | in | 1 |  |
| `reset` | in | 1 | reset, active high |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
