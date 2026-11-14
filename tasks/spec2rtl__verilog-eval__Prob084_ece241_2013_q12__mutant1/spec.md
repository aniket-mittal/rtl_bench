# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Problem: Selectable Bit Readout from a Gated Storage Word**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|--------|-----------|-------|
| `clk` | input | 1 |
| `enable` | input | 1 |
| `S` | input | 1 |
| `A` | input | 1 |
| `B` | input | 1 |
| `C` | input | 1 |
| `Z` | output | 1 |

**Behavior**

The module contains an 8-bit storage word, indexed 0 to 7, where index 0 is the least significant bit. There is no reset. The word has no defined value at power-up, and the design must not initialize it.

On each rising edge of `clk`, if `enable` is high, the bit at index 0 captures the current value of `S`. If `enable` is low, the word keeps its value.

Only index 0 is ever written. The bits at indices 1 through 7 are never modified by any input. They hold whatever value they had at power-up for the whole operation, so do not build a shift register or any other mechanism that updates them.

The output `Z` is purely combinational and is not registered. It reads the stored bit whose index is given by the 3-bit unsigned number formed by `{A, B, C}`, where `A` is the most significant bit and `C` is the least significant bit. For example, `{A,B,C} = 3'b000` selects index 0, which is the bit loaded from `S`, and `3'b111` selects index 7.

Changes on `A`, `B`, or `C` affect `Z` immediately, with no clock involved. A change in the stored bit at index 0 shows up on `Z` only after a clock edge with `enable` high, and only while the selector is 0.

**Notes**

- The only input that can influence stored data is `S`, and it can only affect index 0.
- `Z` must be declared as a single-bit output.

Implement the module so that it matches this behavior exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `enable` | in | 1 |  |
| `S` | in | 1 |  |
| `A` | in | 1 |  |
| `B` | in | 1 |  |
| `C` | in | 1 |  |
| `Z` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
