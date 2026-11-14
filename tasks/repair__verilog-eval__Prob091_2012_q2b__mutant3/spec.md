# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Next-State Output Logic for a One-Hot-Style State Machine**

Design a purely combinational Verilog module named `dut` that computes two output signals from a 6-bit state vector and a single-bit control input.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `y`  | input     | 6 bits (`[5:0]`) |
| `w`  | input     | 1 bit |
| `Y1` | output    | 1 bit |
| `Y3` | output    | 1 bit |

**Behavior**

The module has no clock and no reset; both outputs must respond immediately to any change on the inputs.

- When `w` is 1, both `Y1` and `Y3` must be 0, regardless of the value of `y`.
- When `w` is 0:
  - `Y1` is 1 only if bit 0 of `y` is set. All other bits of `y` are ignored for this output.
  - `Y3` is 1 if at least one of bits 1, 2, 4, or 5 of `y` is set. Bit 0 and bit 3 of `y` have no effect on this output.

The inputs are not assumed to be one-hot. Any combination of bits in `y` is legal, including all zeros or several bits set at once, and the outputs must follow the rules above for every such combination.

**Example cases**

| `y`      | `w` | `Y1` | `Y3` |
|----------|-----|------|------|
| 6'b000001 | 0  | 1    | 0    |
| 6'b001000 | 0  | 0    | 0    |
| 6'b000100 | 0  | 0    | 1    |
| 6'b101001 | 0  | 1    | 1    |
| 6'b111111 | 1  | 0    | 0    |

Your module must match these rules exactly for all 128 possible input combinations.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `y` | in | 6 |  |
| `w` | in | 1 |  |
| `Y1` | out | 1 | |
| `Y3` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
