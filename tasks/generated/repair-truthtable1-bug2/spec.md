# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Three-Input Pattern Detector**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `x3` | input | 1 bit |
| `x2` | input | 1 bit |
| `x1` | input | 1 bit |
| `f` | output | 1 bit |

Treat the three inputs as a 3-bit number `{x3, x2, x1}`, where `x3` is the most significant bit and `x1` is the least significant bit.

The output `f` must be `1` when this number is exactly one of the following values, and `0` for every other input combination:

- 2 (binary `010`)
- 3 (binary `011`)
- 5 (binary `101`)

In particular, `f` is `0` for the values 0, 1, 4, 6 and 7.

**Requirements**

- The circuit has no clock, no reset and no state. `f` must respond immediately to any change on the inputs.
- Use the exact module name and port names given above.
- Only the input-to-output function matters. Any implementation, such as gates, a continuous assignment or a lookup, is acceptable as long as it matches the specified truth table exactly.

**Truth table summary** (`x3 x2 x1` → `f`):

```
000 → 0
001 → 0
010 → 1
011 → 1
100 → 0
101 → 1
110 → 0
111 → 0
```

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `x3` | in | 1 |  |
| `x2` | in | 1 |  |
| `x1` | in | 1 |  |
| `f` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
