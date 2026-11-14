# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Constant Lookup Table (8-entry, 16-bit)**

Design a purely combinational Verilog module named `dut` that implements a fixed 8-entry lookup table (ROM) addressed by a 3-bit input.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 3 bits `[2:0]` |
| `q`  | output    | 16 bits `[15:0]` |

**Behavior**

The output `q` must immediately reflect the value of `a`; there is no clock, no reset, and no stored state. For each value of `a` (interpreted as an unsigned number from 0 to 7), `q` must equal the following unsigned decimal constant:

| `a` | `q` (decimal) |
|-----|---------------|
| 0 | 4658 |
| 1 | 44769 |
| 2 | 10196 |
| 3 | 23054 |
| 4 | 8294 |
| 5 | 25806 |
| 6 | 50470 |
| 7 | 12057 |

Every possible input value is listed, so the output is fully defined for all inputs. The constants are arbitrary and have no pattern that you should rely on. Reproduce them exactly as given, using the full 16-bit unsigned range.

**Requirements**

- The module name, port names, directions, and widths must match the table above exactly.
- The design must be combinational: any change in `a` must change `q` with no clock involved, and the circuit must not infer any latches or sequential elements.
- Your design will be checked by formal equivalence against a reference implementation, so every one of the eight mappings must be exact.

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
