# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Four-Bit Input Flag Generator**

Design a purely combinational Verilog module named `dut` that examines a 4-bit input and produces three single-bit status flags.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `in` | input | 4 bits (`[3:0]`) |
| `out_and` | output | 1 bit |
| `out_or` | output | 1 bit |
| `out_xor` | output | 1 bit |

**Required behavior**

- `out_and`: Despite its name, this flag is the result of a *logical* AND between the whole 4-bit input, treated as a single true/false value (true if nonzero), and the constant `4'hF`, also treated as a single true/false value. It is **not** a bitwise reduction AND. It is 1 for every nonzero value of `in`, including values such as `4'b0001` or `4'b1010`, and 0 only when `in` is `4'b0000`. Do not turn this into an "all ones" detector.
- `out_or`: 1 if at least one bit of `in` is 1, otherwise 0.
- `out_xor`: the parity of `in`. It is 1 when an odd number of bits in `in` are 1, otherwise 0.

**Timing and reset**

- The design has no clock and no reset. All outputs must respond combinationally to changes on `in`.
- No state may be stored.

**Edge cases**

- `in = 4'b0000`: all three outputs are 0.
- `in = 4'b1111`: `out_and` = 1, `out_or` = 1, `out_xor` = 0.
- `in = 4'b0001`: `out_and` = 1, `out_or` = 1, `out_xor` = 1.

Your module will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 4 |  |
| `out_and` | out | 1 | |
| `out_or` | out | 1 | |
| `out_xor` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
