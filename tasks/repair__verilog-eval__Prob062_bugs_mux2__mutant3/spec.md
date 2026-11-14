# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Conditional 8-bit Byte Selector**

Design a purely combinational Verilog module named `dut` that chooses between two 8-bit data inputs based on a control condition.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `sel` | input | 1 |
| `a`   | input | 8 |
| `b`   | input | 8 |
| `out` | output | 8 |

**Behavior**

The output `out` must be an 8-bit value that follows one of the two data inputs, `a` or `b`, in its entirety (all 8 bits come from the same source; no bit-level mixing).

- `out` takes the value of `a` when the select input `sel` is asserted (logic 1), **or** when the least significant bit of `a` is 1, regardless of the value of `sel`.
- In every other case (that is, when `sel` is 0 and the least significant bit of `a` is 0), `out` takes the value of `b`.

In other words, an odd value on `a` always forces `a` to be passed through, even if `sel` is deasserted. When `a` is even, `sel` acts as an ordinary 2-to-1 multiplexer select between `a` (sel = 1) and `b` (sel = 0).

**Requirements**

- The circuit has no clock, no reset, and no internal state. `out` must respond immediately to any change on `sel`, `a`, or `b`.
- Port names, directions, and widths must match the table exactly.
- Do not add extra ports.

**Examples**

| `sel` | `a`        | `b`        | `out`      |
|-------|------------|------------|------------|
| 1     | `8'h10`    | `8'hFF`    | `8'h10`    |
| 0     | `8'h10`    | `8'hFF`    | `8'hFF`    |
| 0     | `8'h11`    | `8'hFF`    | `8'h11`    |
| 0     | `8'h00`    | `8'hAB`    | `8'hAB`    |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `out` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
