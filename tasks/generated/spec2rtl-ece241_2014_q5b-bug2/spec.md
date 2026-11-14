# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Latching Input Inverter**

Design a synchronous module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `areset` | input | 1 |
| `x` | input | 1 |
| `z` | output | 1 |

**Behavior**

The circuit has two operating modes, call them *pass* and *invert*, held in a single bit of memory.

- **Reset:** `areset` is an active-high, asynchronous reset. While it is asserted, the circuit immediately enters *invert* mode, independent of `clk`.
- **Mode transitions** occur only on the rising edge of `clk` when `areset` is low:
  - In *pass* mode, the circuit stays in *pass* if `x` is 0 and moves to *invert* if `x` is 1.
  - In *invert* mode, the circuit stays in *invert* regardless of `x`. There is no way to return to *pass* except through a reset, and since reset itself forces *invert*, *pass* mode is never re-entered by any input sequence.
- **Output:** `z` is combinational. It depends on the current mode and the current value of `x`, with no clock delay:
  - In *pass* mode, `z` equals `x`.
  - In *invert* mode, `z` equals the logical complement of `x`.

Implement the module exactly as specified, using the exact module name and port names, directions and widths above. Do not add any other ports. Your design will be checked for formal equivalence against a reference implementation.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `x` | in | 1 |  |
| `z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
