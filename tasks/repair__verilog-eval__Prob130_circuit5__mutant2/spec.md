# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: 4-Bit Selector with Default Output**

Design a purely combinational Verilog module named `dut` that selects one of several 4-bit data inputs based on a 4-bit selector value.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 4 bits `[3:0]` |
| `b`  | input     | 4 bits `[3:0]` |
| `c`  | input     | 4 bits `[3:0]` |
| `d`  | input     | 4 bits `[3:0]` |
| `e`  | input     | 4 bits `[3:0]` |
| `q`  | output    | 4 bits `[3:0]` |

**Behavior**

The input `c` acts as the selector, interpreted as an unsigned value. The output `q` must reflect the selected input continuously, with no clock, no registers, and no reset:

- When `c` equals 0, `q` takes the value of `b`.
- When `c` equals 1, `q` takes the value of `e`.
- When `c` equals 2, `q` takes the value of `a`.
- For every other value of `c` (3 through 15), `q` is all ones (`4'b1111`).

Note that the input `d` is part of the interface but does not influence the output under any circumstances. Also note that the mapping of selector values to data inputs is not in alphabetical order; follow the table above exactly.

**Requirements**

- The output must update whenever any relevant input changes (purely combinational, no latches).
- Every possible value of `c` must produce a fully defined output.
- Module name and port names, directions, and widths must match the table exactly.

Your submission will be checked for formal equivalence against a reference design, so the behavior must match for all input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 4 |  |
| `b` | in | 4 |  |
| `c` | in | 4 |  |
| `d` | in | 4 |  |
| `e` | in | 4 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
