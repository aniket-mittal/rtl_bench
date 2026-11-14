# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**64-Bit Loadable Shifter Register**

Design a synchronous module named `dut` that holds a 64-bit value and can either load a new value or shift its current contents.

**Ports**

| Name | Direction | Width |
|--------|-----------|-------|
| clk | input | 1 |
| load | input | 1 |
| ena | input | 1 |
| amount | input | 2 |
| data | input | 64 |
| q | output | 64 |

`q` is a registered output that holds the stored value. All updates occur on the rising edge of `clk`. There is no reset input, so no initial value is specified for `q`.

**Behavior on each rising clock edge**

1. If `load` is high, `q` takes the value of `data`. This has priority over everything else.
2. Otherwise, if `ena` is high, `q` is replaced by a shifted version of its current value, selected by `amount`:
   - `2'b00`: shift left by 1 bit, filling the vacated least-significant bit with 0.
   - `2'b01`: shift left by 8 bits, filling the vacated low-order bits with 0.
   - `2'b10`: logical shift right by 1 bit, filling the vacated most-significant bit with 0.
   - `2'b11`: arithmetic shift right by 8 bits, where the vacated upper 8 bits are filled with copies of the current most-significant bit (sign bit).
3. Otherwise (`load` low and `ena` low), `q` keeps its current value.

Bits shifted out of the register are discarded. All four values of `amount` are fully defined, so no other cases need handling.

Your submission will be checked for formal equivalence against a reference implementation, so port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `ena` | in | 1 |  |
| `amount` | in | 2 |  |
| `data` | in | 64 |  |
| `q` | out | 64 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
