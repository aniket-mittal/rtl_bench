# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Gated Decade Counter**

Design a synchronous counter that counts decimal digits (0 through 9), with a control input that pauses counting.

**Module name:** `dut`

**Ports:**

| Name      | Direction | Width  |
|-----------|-----------|--------|
| `clk`     | input     | 1 bit  |
| `slowena` | input     | 1 bit  |
| `reset`   | input     | 1 bit  |
| `q`       | output    | 4 bits |

**Behavior:**

All state changes occur on the rising edge of `clk`. The output `q` is registered, i.e., it holds the current count value.

- **Reset:** When `reset` is high at a rising clock edge, `q` is set to 0. Reset is synchronous and takes priority over all other inputs.
- **Pause:** When `reset` is low and `slowena` is high at a rising clock edge, `q` keeps its current value. (Note that `slowena` is an active-low enable: counting is allowed only when it is low.)
- **Count:** When `reset` is low and `slowena` is low at a rising clock edge, the counter advances by one. The count sequence is 0, 1, 2, ..., 9, and after reaching 9 it wraps back to 0 on the next counting edge.

**Edge cases:**

- No initial value for `q` is specified before the first reset; the design only needs to be correct after reset has been applied.
- Since `q` is 4 bits wide, values 10 through 15 are representable, but they are not part of the normal sequence. If `q` is ever 10-15 and counting is enabled, it simply increments by one, wrapping naturally from 15 to 0 in 4-bit arithmetic. Only the value 9 triggers the early wrap to 0.

Implement the module so that its cycle-by-cycle behavior matches this description exactly.

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
