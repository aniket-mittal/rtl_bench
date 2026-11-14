# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Nibble-Swap Register with Synchronous Reset**

Design a Verilog module named `dut` that registers an 8-bit input after exchanging its two 4-bit halves.

**Ports**

| Name  | Direction | Width | Description |
|-------|-----------|-------|-------------|
| `clk`   | input  | 1 | Clock signal |
| `d`     | input  | 8 | Data input |
| `reset` | input  | 1 | Synchronous, active-high reset |
| `q`     | output | 8 | Registered output (must be declared as a register type) |

**Behavior**

- All state changes occur on the rising edge of `clk`. The output `q` must not change between clock edges, regardless of changes on `d` or `reset`.
- On a rising clock edge, if `reset` is high, `q` is set to all zeros. Reset is synchronous only: it has no effect until a rising clock edge occurs, and it takes priority over the data input.
- On a rising clock edge, if `reset` is low, `q` captures the value of `d` with its upper and lower nibbles swapped. That is, the lower four bits of `d` appear in the upper four bits of `q`, and the upper four bits of `d` appear in the lower four bits of `q`. The bits within each nibble keep their original order.

  Example: if `d = 8'hA5` is sampled with `reset` low, then `q` becomes `8'h5A` after the clock edge.

- There is no enable signal and no other control input; every clock edge either resets or loads the swapped data.
- No initial value for `q` is specified beyond the behavior described above.

Your module will be checked for formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `reset` | in | 1 | reset, active high |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
