# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Level-Sensitive Clear Latch**

Design a Verilog module named `dut` with the following ports:

- `in`: input, 1 bit
- `out`: output, 1 bit

The module implements a single-bit storage element with no clock. The output `out` continuously reflects the value held in the storage element.

Behavior:

- Whenever the input `in` changes, the circuit re-evaluates. If `in` is 1 at that moment, the stored value is cleared to 0.
- If `in` is 0 when it changes (a falling transition), the stored value is left unchanged and keeps whatever it held before.
- The circuit has no reset and no way to set the stored value to 1. The storage element is never driven to 1 by any input condition.
- Before `in` has ever been 1 after the start of simulation, the stored value has not been assigned, so `out` is in its power-up/uninitialized state (unknown, `x`, in simulation).

In other words, the only defined action in this design is "clear to 0 when `in` is high"; when `in` is low the output simply holds its previous value. The design must be purely event-driven by changes on `in` (no clock, no other inputs), and `out` must be a direct, unbuffered view of the stored value.

Constraints:

- Use only the ports listed above, with exactly these names, directions, and widths.
- Do not add a clock, reset, or enable signal.
- The design must be a single module with no sub-module instances.

Example behavior (starting from power-up):

| Time | `in` | `out`          |
|------|------|----------------|
| t0   | 0    | x (unassigned) |
| t1   | 1    | 0              |
| t2   | 0    | 0 (held)       |
| t3   | 1    | 0              |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 1 |  |
| `out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
