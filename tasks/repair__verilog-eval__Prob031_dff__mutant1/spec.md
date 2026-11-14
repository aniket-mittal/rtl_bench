# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Transparent Latch-Style Pass-Through (`dut`)**

Design a Verilog module named `dut` with the following ports:

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `d`   | input | 1 |
| `q`   | output (reg) | 1 |

**Behavior**

The output `q` must follow the input `d` combinationally: whenever `d` changes, `q` takes on the new value of `d` without waiting for any clock edge. The circuit is not edge-triggered and does not sample `d` on `clk`. The input `clk` is part of the interface but has no influence on the output.

There is no reset. Before any evaluation of `d` has occurred (at time zero, prior to the first change of `d`), the output `q` holds an unknown value (`1'bx`). After `d` takes a value and the combinational logic evaluates, `q` equals `d` at all times.

Declare `q` as a `reg` in the module's port list. The update of `q` from `d` should be done in a combinational procedural block sensitive to all of its inputs, using a non-blocking assignment, and `q` should be initialized to unknown at time zero.

**Requirements**

- Exact module name: `dut`.
- Ports exactly as listed above, with the stated names, directions and widths.
- No flip-flops, no clocked behavior, and no reset.
- `q` must be functionally equivalent to `d` once the design has settled; the only deviation is the unknown initial value of `q` at time zero.

**Example**

| Time | `clk` | `d` | `q` |
|------|-------|-----|-----|
| 0    | 0     | 0   | x (initial), then 0 after evaluation |
| 5    | 1     | 0   | 0 |
| 10   | 1     | 1   | 1 |
| 15   | 0     | 1   | 1 |
| 20   | 0     | 0   | 0 |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 1 |  |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
