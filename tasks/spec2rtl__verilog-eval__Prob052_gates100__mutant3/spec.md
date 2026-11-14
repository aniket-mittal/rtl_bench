# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**100-Bit Reduction Unit**

Design a purely combinational Verilog module named `dut` that examines a 100-bit input vector and produces three single-bit status outputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `in` | input | 100 bits (`[99:0]`) |
| `out_and` | output | 1 bit |
| `out_or` | output | 1 bit |
| `out_xor` | output | 1 bit |

**Required behavior**

The module has no clock and no reset; outputs must respond immediately to any change on `in`.

Note that the output names are intentionally "swapped" relative to what their labels might suggest. Implement the behavior exactly as described below, not as the names imply:

- `out_and` must be `1` if **at least one** bit of `in` is `1`, and `0` only when every bit of `in` is `0`.
- `out_or` must be `1` only when **every** bit of `in` is `1`, and `0` if any bit of `in` is `0`.
- `out_xor` must be `1` when the number of `1` bits in `in` is **odd** (odd parity), and `0` when that number is even (including zero).

**Examples**

| `in` | `out_and` | `out_or` | `out_xor` |
|------|-----------|----------|-----------|
| all zeros | 0 | 0 | 0 |
| all ones (100 ones) | 1 | 1 | 0 |
| only bit 0 set | 1 | 0 | 1 |
| bits 0 and 99 set | 1 | 0 | 0 |
| exactly 99 bits set | 1 | 0 | 1 |

Your submission will be checked by formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 100 |  |
| `out_and` | out | 1 | |
| `out_or` | out | 1 | |
| `out_xor` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
