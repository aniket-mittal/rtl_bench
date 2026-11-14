# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Four-Input Function with a Hold Case**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 bit |
| `b`  | input     | 1 bit |
| `c`  | input     | 1 bit |
| `d`  | input     | 1 bit |
| `out`| output    | 1 bit |

The module has no clock and no reset. `out` must respond to any change on the inputs, and it must be declared as a `reg` driven by a combinational (level-sensitive) process.

Treat the inputs as the 4-bit value `{a, b, c, d}`, with `a` as the most significant bit. Write the value in binary, in the order `a b c d`. `out` is 1 for these input values:

- `0001`
- `0010`
- `0100`
- `0111`
- `1000`
- `1011`
- `1101`
- `1110`

`out` is 0 for these input values:

- `0000`
- `0011`
- `0101`
- `0110`
- `1001`
- `1100`
- `1111`

One input value is not specified: `1010` (`a=1, b=0, c=1, d=0`). This is deliberate. When the inputs equal `1010`, `out` must keep whatever value it had immediately before the inputs reached `1010`. It must not be forced to 0 or 1. Consequently, the circuit has to be level-sensitive and hold its last value for this one input combination. No initial value is defined for `out` before any specified input has been applied.

Your submission will be checked for formal equivalence against a reference design. Port names, widths, and the hold behavior at `1010` must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
