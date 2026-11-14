# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Serial Adder Bit Slice with Carry Register**

Design a Verilog module named `dut` that implements a one-bit serial adder stage. It adds two single-bit input streams, `a` and `b`, one bit per clock cycle, while keeping a running carry between cycles.

**Ports**

| Name   | Direction | Width |
|--------|-----------|-------|
| `clk`  | input     | 1     |
| `a`    | input     | 1     |
| `b`    | input     | 1     |
| `q`    | output    | 1     |
| `state`| output    | 1     |

**Behavior**

- The module holds a single carry bit. This carry is updated only on the **falling edge** of `clk`.
- At each falling edge, the carry takes on the carry-out of a full adder whose three inputs are the current values of `a`, `b`, and the stored carry (i.e., the carry becomes 1 when at least two of those three inputs are 1).
- Output `q` is the sum bit of a full adder whose inputs are the current `a`, current `b`, and the currently stored carry. It is **combinational**: it responds immediately to changes in `a`, `b`, or the stored carry, not only on clock edges.
- Output `state` directly exposes the currently stored carry bit.
- There is no reset input. The initial value of the stored carry is not specified, so do not rely on any particular power-up value. Your design must not add any reset or initialization logic beyond what is described.

**Example**

Assume the stored carry is 0. With `a=1, b=1`, `q` is 0 and `state` is 0 before the next falling edge. After that falling edge, `state` becomes 1, and `q` (with `a=1, b=1` still applied) becomes 1.

Submit the complete module with the exact name and port list shown above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `q` | out | 1 | |
| `state` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
