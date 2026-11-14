# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Partial Parity Generator**

Design a purely combinational Verilog module named `dut` that computes a parity bit over a portion of an input byte.

**Ports**

| Name     | Direction | Width        |
|----------|-----------|--------------|
| `in`     | input     | 8 bits (`[7:0]`) |
| `parity` | output    | 1 bit        |

**Behavior**

The output `parity` is the even-parity bit (the XOR reduction) of the seven least-significant bits of `in`, that is, bits 0 through 6. The result is 1 when an odd number of those seven bits are 1, and 0 when an even number are 1.

The most significant bit of the input, `in[7]`, must have no effect on the output. Toggling `in[7]` while holding the other bits constant must never change `parity`.

**Requirements**

- The circuit is purely combinational: there is no clock, no reset, and no internal state. The output must respond to changes on `in` with no sequential behavior.
- Edge cases:
  - `in[6:0] = 7'b0000000` produces `parity = 0`, regardless of `in[7]`.
  - `in[6:0] = 7'b1111111` (seven ones, an odd count) produces `parity = 1`, regardless of `in[7]`.
  - `in = 8'b10000000` produces `parity = 0`.
  - `in = 8'b00000001` produces `parity = 1`.
- Module name, port names, directions, and widths must match the table exactly.

**Examples**

| `in`         | `parity` |
|--------------|----------|
| `8'b00000000` | 0 |
| `8'b00000111` | 1 |
| `8'b01010101` | 0 |
| `8'b11111111` | 1 |
| `8'b10110010` | 0 |

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
