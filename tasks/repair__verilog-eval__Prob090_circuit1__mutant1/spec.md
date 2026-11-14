# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Constant-Zero Output Module**

Design a combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `q`  | output    | 1 bit |

**Requirements**

- The module is purely combinational. It has no clock, no reset, and no stored state.
- The output `q` must be logic `0` at all times, regardless of the values of `a` and `b`.
- Every one of the four possible input combinations (`a`,`b`) = 00, 01, 10, 11 must produce `q = 0`.
- The output must never be high, floating, or unknown (`x`/`z`) once the module is simulated, even if the inputs are `x` or `z`.
- Both inputs are part of the interface and must be declared with the exact names and widths above, even though they do not influence the result.

**Example**

| a | b | q |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

**Notes**

- The module name, port names, directions, and widths must match exactly, since your design will be checked by formal equivalence against a reference implementation.
- Port declarations must be scalar (1-bit) with no vector ranges.
- Do not add any extra ports.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
