# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Combinational Single-Input Gate with an Ignored Input**

Design a purely combinational Verilog module named `dut` with the following interface:

| Port | Direction | Width |
|------|-----------|-------|
| `in1` | input | 1 bit |
| `in2` | input | 1 bit |
| `out` | output | 1 bit |

**Behavior**

The output `out` is a function of the two inputs, `in1` and `in2`. It must respond immediately to any input change. There is no clock, no reset, and no stored state.

The function is defined as follows:

- Form the AND of `in2` with `in1`.
- OR the result with `in1`.
- Invert the final result to produce `out`.

Your circuit must match this function for all four input combinations:

| in1 | in2 | out |
|-----|-----|-----|
| 0 | 0 | ? |
| 0 | 1 | ? |
| 1 | 0 | ? |
| 1 | 1 | ? |

Work out the truth table yourself from the definition above.

**Requirements**

- The module name must be exactly `dut`.
- The port names, directions and widths must match the table exactly.
- The design must be purely combinational, with no latches, flip-flops, or other sequential elements.
- Your submission will be checked by formal equivalence against a reference design, so it must match the reference for every input combination.

**Goal**

Implement `dut` so that `out` matches the function described above for all inputs.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in1` | in | 1 |  |
| `in2` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
