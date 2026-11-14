# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Single-Bit Adder with an Unused Carry-In**

Design a combinational Verilog module named `dut` that adds two single-bit values and reports a 2-bit result.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`   | input  | 1 |
| `b`   | input  | 1 |
| `cin` | input  | 1 |
| `cout`| output | 1 |
| `sum` | output | 1 |

**Required behavior**

The module takes the two single-bit operands `a` and `b` and produces their arithmetic sum as a 2-bit unsigned number. The upper bit of that result is driven on `cout`, and the lower bit is driven on `sum`.

Although the interface includes a carry-in port named `cin`, it is part of the interface only: the outputs must not depend on `cin` in any way. Do not treat this module as a full adder. Whatever value `cin` has, the outputs are determined solely by `a` and `b`.

**Timing**

The circuit is purely combinational. There is no clock, no reset, and no stored state. Outputs must update immediately in response to changes on the inputs.

**Examples**

| a | b | cin | cout | sum |
|---|---|-----|------|-----|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 0 | 1 |
| 1 | 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 | 0 |

**Notes**

- Your submission is checked by formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly as specified.
- Submit only the module `dut`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `cin` | in | 1 |  |
| `cout` | out | 1 | |
| `sum` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
