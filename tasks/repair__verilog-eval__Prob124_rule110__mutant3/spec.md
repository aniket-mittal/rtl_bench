# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Gray-Code Style Register with Parallel Load**

Design a synchronous module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `load` | input | 1 |
| `data` | input | 512 |
| `q` | output | 512 (registered) |

**Behavior**

On every rising edge of `clk`:

- If `load` is high, `q` takes the value of `data`.
- Otherwise, `q` is replaced by a new value in which each bit position is the exclusive-OR of the current `q` bit at that position and the current `q` bit one position above it (the next more significant bit). The most significant bit has no neighbor above it, so it is treated as if its upper neighbor were 0. As a result, the most significant bit keeps its current value, and every other bit is updated simultaneously using the old values of `q`.

Equivalently, when `load` is low, the next value of `q` is the current `q` XORed with the current `q` logically shifted right by one position.

**Notes**

- `q` changes only on the rising edge of `clk`. There is no combinational path from the inputs to `q`.
- There is no reset input, so the initial value of `q` is unspecified and must not be assumed.
- `load` has priority over the update operation.
- All bits update in parallel. A bit's new value depends only on the old values of `q`, never on already-updated bits.

Implement the module with the exact name and port definitions above.

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
