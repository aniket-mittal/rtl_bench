# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Constant-Output Combinational Module**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 1 bit |
| `y`  | input     | 1 bit |
| `z`  | output    | 1 bit |

**Behavior**

The module has two single-bit inputs, `x` and `y`, and one single-bit output, `z`. The output `z` must be driven continuously by combinational logic. There is no clock, no reset, and no stored state.

The output `z` must be logic high (`1`) for every possible combination of input values. In particular:

- When `x = 0`, `z = 1`, regardless of `y`.
- When `x = 1`, `z = 1`, regardless of `y`.
- The input `y` is part of the interface and must be declared exactly as specified, but it has no influence on the output.

Your module must use exactly the module name and port names given above, with the specified directions and widths, so that it can be checked for formal equivalence against a reference design. Do not add extra ports, and do not introduce any sequential elements or latches.

**Example**

| x | y | z |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

**Requirements**

- Module name: `dut`
- Inputs: `x` (1 bit), `y` (1 bit)
- Output: `z` (1 bit)
- Fully combinational; the output must never be `0` and must never be undriven.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `x` | in | 1 |  |
| `y` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
