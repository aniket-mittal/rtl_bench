# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Constant Zero Output Module**

Design a combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `in` | input | 1 bit |
| `out` | output | 1 bit |

**Requirements**

The module has a single 1-bit input `in` and a single 1-bit output `out`. The output must be a constant logic low (`1'b0`) at all times, regardless of the value of `in`.

Specifically:

- The circuit is purely combinational. It has no clock, no reset, and no state elements.
- `out` must be `0` whenever `in` is `0`.
- `out` must be `0` whenever `in` is `1`.
- `out` must never be driven high, and it must not be left undriven or high-impedance. It must also never be unknown (`x`) for any defined value of `in`.
- The input `in` is intentionally unused for computing the result. It must still be declared as a port with the exact name and width given above so that the module interface matches.

Your module must use the exact module name `dut` and the exact port names `in` and `out`, with the directions and widths shown in the table.

**Examples**

| `in` | `out` |
|------|-------|
| 0 | 0 |
| 1 | 1'b0 → 0 |

**Notes**

- Any circuit that produces a constant 0 on `out` for every input value is considered correct, so long as the interface matches exactly.
- Do not add extra ports, parameters, or sequential logic.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
