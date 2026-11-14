# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Subtractor with Zero Flag**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `do_sub` | input | 1 bit |
| `a` | input | 8 bits |
| `b` | input | 8 bits |
| `out` | output | 8 bits |
| `result_is_zero` | output | 1 bit |

**Behavior**

- `out` is the 8-bit difference of the two operands, `a` minus `b`, using unsigned modulo-256 arithmetic. Any borrow beyond 8 bits is discarded, so the result wraps around.
- The control input `do_sub` is part of the interface, but it must have **no influence** on either output. The circuit produces the same difference whether `do_sub` is 0 or 1. In particular, it must not turn into an adder when `do_sub` is 0.
- `result_is_zero` is 1 exactly when the computed `out` equals zero (that is, when `a` equals `b`), and 0 otherwise.

**Timing**

- There is no clock and no reset. Both outputs must respond combinationally to any change in `a`, `b`, or `do_sub`, and must not hold state.

**Edge cases**

- `a = 0`, `b = 1` gives `out = 8'hFF` and `result_is_zero = 0`.
- `a = b` for any value gives `out = 0` and `result_is_zero = 1`.
- `a = 8'h80`, `b = 8'h01` gives `out = 8'h7F`.

Your module will be checked by formal equivalence against a reference design, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `do_sub` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `out` | out | 8 | |
| `result_is_zero` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
