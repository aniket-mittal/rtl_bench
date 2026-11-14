# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Bit-Packing Combinational Module**

Design a purely combinational Verilog module named `dut` with the following ports:

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 5 bits [4:0] |
| `b`  | input     | 5 bits [4:0] |
| `c`  | input     | 5 bits [4:0] |
| `d`  | input     | 5 bits [4:0] |
| `e`  | input     | 5 bits [4:0] |
| `f`  | input     | 5 bits [4:0] |
| `w`  | output    | 8 bits [7:0] |
| `x`  | output    | 8 bits [7:0] |
| `y`  | output    | 8 bits [7:0] |
| `z`  | output    | 8 bits [7:0] |

**Behavior**

Build a single 32-bit stream by placing the following fields side by side. The first field occupies the most significant bits and the last field the least significant bits. Within each field, the most significant bit comes first.

1. `a`, unchanged
2. `b`, unchanged
3. `c`, with every bit inverted
4. `d`, unchanged
5. `e`, unchanged
6. `f`, unchanged
7. A 2-bit constant with both bits equal to 1

Split this 32-bit stream into four consecutive 8-bit bytes and drive the outputs as follows:

- `w` receives the most significant byte (stream bits 31 down to 24).
- `x` receives the next byte (bits 23 down to 16).
- `y` receives the next byte (bits 15 down to 8).
- `z` receives the least significant byte (bits 7 down to 0).

Fields are not aligned to byte boundaries, so some inputs contribute bits to two different outputs.

There is no clock, no reset, and no state. Every output must update immediately whenever any input changes. All 32 input combinations of bits are valid. There are no special or error cases.

Your module will be checked by formal equivalence against a reference, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 5 |  |
| `b` | in | 5 |  |
| `c` | in | 5 |  |
| `d` | in | 5 |  |
| `e` | in | 5 |  |
| `f` | in | 5 |  |
| `w` | out | 8 | |
| `x` | out | 8 | |
| `y` | out | 8 | |
| `z` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
