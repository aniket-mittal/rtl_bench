# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Incrementing 4-bit Adder**

Design a purely combinational Verilog module named `dut` that adds two unsigned 4-bit numbers together with an extra constant increment of one.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `x`  | input     | 4 bits `[3:0]` |
| `y`  | input     | 4 bits `[3:0]` |
| `sum`| output    | 5 bits `[4:0]` |

**Behavior**

- Treat `x` and `y` as unsigned integers in the range 0 to 15.
- The output `sum` must equal the arithmetic result of `x + y + 1`, expressed as an unsigned 5-bit value.
- There is no clock, no reset, and no stored state. The output must respond immediately to any change on the inputs.
- There is no separate carry-in input; the "+1" is always applied, unconditionally.
- Because the output is 5 bits wide, the full result is always representable without overflow: the smallest possible output is 1 (when `x = 0`, `y = 0`) and the largest possible output is 31 (when `x = 15`, `y = 15`).

**Examples**

| x  | y  | sum |
|----|----|-----|
| 0  | 0  | 1   |
| 3  | 4  | 8   |
| 7  | 8  | 16  |
| 15 | 0  | 16  |
| 15 | 15 | 31  |

**Requirements**

- Use the exact module name and port names, directions, and widths given above.
- The design must be purely combinational (no latches, no registers).
- Your solution will be checked by formal equivalence against a reference implementation, so it must match the specified behavior for all 256 possible input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `x` | in | 4 |  |
| `y` | in | 4 |  |
| `sum` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
