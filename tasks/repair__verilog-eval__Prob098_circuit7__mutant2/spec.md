# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Inverted Two-Cycle Delay Line**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `a` | input | 1 |
| `q` | output (registered) | 1 |

**Behavior**

The module takes a single-bit input `a` and produces an output `q` that is the logical complement of `a`, delayed by exactly two rising edges of `clk`.

Specifically:

- All state updates occur only on the rising edge of `clk`. There is no combinational path from `a` to `q`.
- The value of `a` sampled at a given rising clock edge, inverted, appears at `q` after the second rising clock edge that follows it (that is, two clock cycles of latency from the sampling edge to when the inverted value is visible on `q`).
- `q` changes only on rising clock edges.
- There is no reset signal and no enable. The circuit's storage elements have no specified initial values, so `q` is unknown until enough clock edges have occurred for sampled data to propagate through. Behavior should be considered only after that point.
- The inversion is applied to the input as it is first sampled; the output stage performs no additional logic.

**Example**

Assume `a` is sampled at successive rising edges as: 0, 0, 1, 1, 0, 1, ...

After the pipeline has filled, `q` takes on the complemented sequence with a delay of two cycles: 1, 1, 0, 0, 1, 0, ...

**Requirements**

- Module name must be exactly `dut`.
- Port names, directions, and widths must match the table exactly.
- `q` must be a registered output.
- The design must be purely synchronous to the rising edge of `clk`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
