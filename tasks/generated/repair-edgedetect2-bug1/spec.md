# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Any-Edge Detector (Registered Output)**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `in` | input | 8 |
| `anyedge` | output (registered) | 8 |

**Intended use:** The module is meant to flag, for each bit of `in`, whether that bit has changed value. However, the required behavior follows a specific timing and sampling discipline, described below, and your design must match it exactly.

**Behavior:**

- All activity occurs on the rising edge of `clk`. There is no reset and no enable. Do not add any.
- On each rising edge, the module samples the current value of `in` and stores it as the "previous" sample. The `anyedge` output is then computed in the same clock edge by comparing the current value of `in` bit by bit against that "previous" sample, where a mismatch produces a 1 in the corresponding bit.
- The "previous" sample is updated before the comparison is made, within the same clock edge. The comparison therefore uses the value just stored, not the value held from an earlier cycle.
- `anyedge` is a registered output that changes only on the rising edge of `clk`. It must not change combinationally with `in` between clock edges.

**Requirements:**

- Match the cycle-level output behavior of this timing discipline exactly for every possible input sequence. Do not "fix" the design to behave like a conventional previous-cycle edge detector.
- Before the first rising clock edge, the output value is unspecified. Only behavior from the first rising edge onward is checked.

Submit the complete module with the exact name and port list above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `in` | in | 8 |  |
| `anyedge` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
