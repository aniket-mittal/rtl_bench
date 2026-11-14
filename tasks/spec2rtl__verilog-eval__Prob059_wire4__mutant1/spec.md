# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Signal Fan-Out Router**

Design a purely combinational Verilog module named `dut` that routes three single-bit inputs to four single-bit outputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 1 |
| `b`  | input     | 1 |
| `c`  | input     | 1 |
| `w`  | output    | 1 |
| `x`  | output    | 1 |
| `y`  | output    | 1 |
| `z`  | output    | 1 |

**Behavior**

The module has no clock and no reset, and it holds no state. Each output must follow the inputs continuously, with no delay or registering.

Treat the four outputs, in the order `w, x, y, z`, as a 4-bit group whose most significant bit is `w` and whose least significant bit is `z`. This group must carry the values of the inputs in the following way:

- `z` reflects input `a`.
- `w` reflects input `c`.
- Both `x` and `y` reflect input `b`. They are always equal to each other.

Every output depends on exactly one input. No logic operations (AND, OR, XOR, inversion, and so on) are needed or allowed, and no output may be a function of more than one input. Input `a` drives only `z`, input `c` drives only `w`, and input `b` drives both `x` and `y`.

**Examples**

| a | b | c | w | x | y | z |
|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 0 | 1 | 1 | 0 |
| 0 | 0 | 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | 1 | 1 | 1 |

Your submission will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `c` | in | 1 |  |
| `w` | out | 1 | |
| `x` | out | 1 | |
| `y` | out | 1 | |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
