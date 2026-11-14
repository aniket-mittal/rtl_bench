# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Gated 8-bit Pass-Through**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `sel` | input | 1 bit |
| `a` | input | 8 bits |
| `b` | input | 8 bits |
| `out` | output | 8 bits |

**Behavior**

The module acts as a controlled gate between its inputs and the output:

- When `sel` is high (1), `out` must carry the value of `a`, bit for bit.
- When `sel` is low (0), `out` must be all zeros (8'h00).

The output must respond immediately to any change on the inputs. There is no clock, no reset, and no stored state, so the module must not contain any latches or flip-flops.

**Notes**

- Input `b` is part of the interface and must be declared exactly as shown, but it has no influence on the output in any situation.
- `out` must be declared as an 8-bit output in the port list, and it must be driven for every possible combination of inputs, with no undefined or high-impedance results.
- Only the module name, port names, directions, and widths listed above matter for the interface. Do not add any additional ports.

**Example**

| sel | a | b | out |
|-----|------|------|------|
| 1 | 0xA5 | 0x3C | 0xA5 |
| 1 | 0x00 | 0xFF | 0x00 |
| 0 | 0xA5 | 0x3C | 0x00 |
| 0 | 0xFF | 0xFF | 0x00 |

Write the Verilog module that satisfies this specification.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `out` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
