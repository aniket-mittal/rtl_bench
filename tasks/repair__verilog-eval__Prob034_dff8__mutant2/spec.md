# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**8-bit Register with Power-On Value**

Design a Verilog module named `dut` that implements an 8-bit edge-triggered register with a defined power-on state.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `d` | input | 8 |
| `q` | output | 8 |

**Behavior**

- The output `q` is a registered output. It holds its value between clock edges and changes only on the rising edge of `clk`.
- On each rising edge of `clk`, `q` takes on the value that `d` had at that edge. Changes on `d` between rising edges have no effect on `q`.
- There is no reset input. Instead, before the first rising clock edge, `q` must already hold the all-ones value (`8'hFF`) as its initial power-on state.
- After the first rising clock edge, `q` simply follows the sampling behavior above, regardless of the initial value.
- No other control signals, enables, or asynchronous behavior exist. The circuit has no combinational path from `d` to `q`.

**Requirements**

- Use the exact module name and port names, directions, and widths listed above.
- `q` must be declared so that it can be assigned within sequential logic and given an initial value.

**Example**

| Time | `clk` edge | `d` | `q` after edge |
|------|-----------|-----|----------------|
| before first edge | – | – | `FF` |
| 1st rising edge | ↑ | `3A` | `3A` |
| 2nd rising edge | ↑ | `00` | `00` |
| 3rd rising edge | ↑ | `7E` | `7E` |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
