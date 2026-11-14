# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: 512-bit Loadable Neighborhood Update Register**

Design a synchronous module named `dut` with the following ports:

| Port | Direction | Width |
|--------|-----------|-------|
| `clk` | input | 1 |
| `load` | input | 1 |
| `data` | input | 512 |
| `q` | output (registered) | 512 |

**Behavior**

All state changes occur on the rising edge of `clk`. There is no reset, so `q` has no defined initial value.

- If `load` is 1 on a clock edge, `q` takes the value of `data`.
- If `load` is 0, every bit of `q` is updated in parallel from its own current value and the current values of its two immediate neighbors. For bit position `i`, call the neighbor at index `i+1` the *upper* neighbor and the neighbor at index `i-1` the *lower* neighbor.

The new value of bit `i` is **0** in exactly these two cases:
1. Bit `i` and its upper neighbor are both 1, regardless of the lower neighbor.
2. Bit `i`, its upper neighbor, and its lower neighbor are all 0.

In every other case the new value of bit `i` is **1**.

**Boundary handling**

Positions outside the register are treated as constant 0. Bit 511 has no upper neighbor, so its upper neighbor is 0. Bit 0 has no lower neighbor, so its lower neighbor is 0. The rule above is applied unchanged at these edges.

**Notes**

- The output `q` must be a register that updates only on the rising clock edge.
- `load` takes priority over the update rule.
- All 512 bits update simultaneously, using the values of `q` from before the clock edge.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `data` | in | 512 |  |
| `q` | out | 512 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
