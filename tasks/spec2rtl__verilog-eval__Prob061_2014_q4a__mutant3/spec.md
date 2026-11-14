# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Gated Load/Enable Flip-Flop**

Design a Verilog module named `dut` that implements a single-bit storage element with a load control and an enable control, all synchronous to a clock.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `w` | input | 1 |
| `R` | input | 1 |
| `E` | input | 1 |
| `L` | input | 1 |
| `Q` | output | 1 |

`Q` must be a registered output, updated only on the rising edge of `clk`.

**Behavior**

On each rising edge of `clk`, the following priority applies:

1. If `L` is high, `Q` takes the logical AND of `R` and `w`. This case takes priority over `E`.
2. Otherwise, if `E` is high, `Q` takes the value of `w`.
3. Otherwise (both `L` and `E` are low), `Q` keeps its current value.

**Notes**

- There is no reset signal. The initial value of `Q` before the first update is not specified and will not be checked.
- All inputs are sampled only at the rising edge of `clk`; the output changes only at that edge, never combinationally in response to input changes.
- `E` has no effect when `L` is high.

**Example**

Assume `Q = 0` before each edge:

| L | E | R | w | Q after edge |
|---|---|---|---|--------------|
| 1 | 0 | 1 | 1 | 1 |
| 1 | 1 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 | 1 |
| 0 | 0 | 1 | 1 | 0 (held) |

Implement the module so that it matches this behavior exactly.

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
