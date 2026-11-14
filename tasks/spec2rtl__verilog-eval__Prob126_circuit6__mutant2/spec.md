# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Constant Lookup Table (8-Entry ROM)**

Design a purely combinational Verilog module named `dut` that implements a small read-only lookup table.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 3 bits (`[2:0]`) |
| `q`  | output    | 16 bits (`[15:0]`) |

**Behavior**

The output `q` must depend only on the current value of the input `a`. There is no clock, no reset, and no stored state; whenever `a` changes, `q` must immediately reflect the new value.

For each value of `a`, `q` must equal the following 16-bit unsigned constant (decimal unless otherwise noted):

| `a` | `q` |
|-----|-----|
| 0 | 4658 |
| 1 | 44768 |
| 2 | 10196 |
| 3 | 23054 |
| 4 | 8294 |
| 5 | 25806 |
| 6 | 0xFFFF (all bits set) |
| 7 | 12057 |

All eight possible values of `a` are covered, so there are no undefined or don't-care inputs. The output must never be left unassigned or hold a previous value, and the design must not infer any latch or sequential element.

**Requirements**

- Module name must be exactly `dut`.
- Port names, directions, and widths must match the table above exactly.
- The circuit must be equivalent to the table for all 8 input combinations.

Write the Verilog module that satisfies this specification.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 3 |  |
| `q` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
