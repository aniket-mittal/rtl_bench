# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Loadable Gated Register Bit**

Design a synchronous single-bit storage element in Verilog with the following interface:

Module name: `dut`

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `w` | input | 1 |
| `R` | input | 1 |
| `E` | input | 1 |
| `L` | input | 1 |
| `Q` | output | 1 |

**Behavior**

The output `Q` is a registered value that changes only on the rising edge of `clk`. There is no reset input, so `Q` has no defined value until the first clock edge updates it.

On each rising clock edge, the next value of `Q` is determined by the control inputs with the following priority, from highest to lowest:

1. If `L` is asserted, `Q` takes the value of `R`. This applies regardless of the value of `E` or `w`.
2. Otherwise, if `E` is asserted, `Q` takes the value of `w`.
3. Otherwise (neither `L` nor `E` is asserted), `Q` is cleared to 0. Note that it does **not** hold its previous value in this case.

All inputs are sampled at the clock edge; `Q` must not respond to input changes between edges, and the output must not be combinational with respect to any input.

**Example**

| Edge | L | E | R | w | Q after edge |
|------|---|---|---|---|--------------|
| 1 | 1 | 0 | 1 | 0 | 1 |
| 2 | 0 | 1 | 0 | 1 | 1 |
| 3 | 0 | 1 | 0 | 0 | 0 |
| 4 | 1 | 1 | 0 | 1 | 0 |
| 5 | 0 | 0 | 1 | 1 | 0 |

Implement the module so that its behavior matches this specification exactly.

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
