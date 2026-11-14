# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: 8-Bit Non-Zero Detector**

Design a purely combinational Verilog module named `dut` that examines an 8-bit input and reports whether any of its bits are set.

**Ports**

| Name | Direction | Width |
|--------|-----------|-------|
| `in` | input | 8 bits (`[7:0]`) |
| `parity` | output | 1 bit |

**Behavior**

- The output `parity` must be `1` whenever at least one bit of `in` is `1`.
- The output `parity` must be `0` only when every bit of `in` is `0`.
- Despite its name, `parity` is **not** an even/odd parity indicator. It must not depend on how many bits are set, only on whether the count is zero or non-zero. For example, `in = 8'b0000_0011` (two bits set) must produce `parity = 1`, as must `in = 8'b1111_1111`.

**Timing and structure**

- The circuit is purely combinational: there is no clock, no reset, and no internal state. The output must respond immediately to any change in `in`.
- No other ports may be declared.

**Examples**

| `in` | `parity` |
|-----------------|----------|
| `8'b0000_0000` | 0 |
| `8'b0000_0001` | 1 |
| `8'b1000_0000` | 1 |
| `8'b0101_0101` | 1 |
| `8'b1111_1111` | 1 |

**Edge cases**

- All-zeros is the only input that yields `0`.
- Every one of the 255 non-zero input values yields `1`.

Your module will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `parity` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
