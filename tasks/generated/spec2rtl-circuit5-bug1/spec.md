# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Four-Way Selector with Self-Referencing Select**

Design a purely combinational Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `a`  | input     | 4 bits |
| `b`  | input     | 4 bits |
| `c`  | input     | 4 bits |
| `d`  | input     | 4 bits |
| `e`  | input     | 4 bits |
| `q`  | output    | 4 bits |

The 4-bit input `d` serves as the selector that determines which value is routed to the output `q`. The output must respond immediately to any change on the inputs; there is no clock and no reset, and no state is held.

Behavior, based on the numeric (unsigned) value of `d`:

- `d` = 0: `q` takes the value of `b`.
- `d` = 1: `q` takes the value of `e`.
- `d` = 2: `q` takes the value of `a`.
- `d` = 3: `q` takes the value of `d` itself (so the output is the constant 3 in this case).
- Any other value of `d` (4 through 15): `q` is forced to all ones (`4'b1111`).

Note that input `c` is part of the interface but does not influence the output under any condition.

Your implementation must match this behavior exactly for all possible input combinations (2^20 total), and the output must never be undefined or latched for any input value.

**Example cases**

| a | b | c | d | e | q |
|---|---|---|---|---|---|
| 0x5 | 0x9 | 0x2 | 0x0 | 0x7 | 0x9 |
| 0x5 | 0x9 | 0x2 | 0x1 | 0x7 | 0x7 |
| 0x5 | 0x9 | 0x2 | 0x2 | 0x7 | 0x5 |
| 0x5 | 0x9 | 0x2 | 0x3 | 0x7 | 0x3 |
| 0x5 | 0x9 | 0x2 | 0xA | 0x7 | 0xF |

Provide the complete module implementation.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 4 |  |
| `b` | in | 4 |  |
| `c` | in | 4 |  |
| `d` | in | 4 |  |
| `e` | in | 4 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
