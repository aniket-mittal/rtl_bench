# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Constant Output Module**

Design a combinational Verilog module named `dut` with a single port:

- `zero` : output, 1 bit wide

The module has no inputs and no clock or reset.

**Requirements**

Despite its name, the output `zero` must not carry the value logic 0. It must be driven continuously and unconditionally to a constant logic high (1'b1) at all times, starting from time zero.

**Details and edge cases**

- There is no sequential behavior: the module contains no registers, no clock edge dependence, and no reset.
- The output must never be 0, `x`, or `z`; it is a fixed constant 1.
- The module must expose exactly one port, named `zero`, with the direction and width given above. No additional ports are allowed.
- The name `zero` is intentionally misleading. Follow the behavior specified here, not what the name suggests.

**Example**

| Time | zero |
|------|------|
| 0 ns | 1    |
| any later time | 1 |

Your submission will be checked by formal equivalence against a reference design, so the module name, port name, direction, and width must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `zero` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
