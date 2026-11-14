# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**4-Bit Counter with Synchronous Active-Low Reset**

Design a Verilog module named `dut` that implements a free-running 4-bit up counter.

**Ports:**

| Name  | Direction | Width | Description                  |
|-------|-----------|-------|------------------------------|
| `clk`   | input   | 1     | Clock signal                 |
| `reset` | input   | 1     | Synchronous reset, active low |
| `q`     | output  | 4     | Current counter value        |

**Behavior:**

- All state changes occur on the rising edge of `clk`. The output `q` must be a registered value, not a combinational function of the inputs.
- The reset is synchronous and active low: if `reset` is `0` at a rising clock edge, `q` is set to `0`. Reset has no effect between clock edges, and `reset` being `0` does not change `q` asynchronously.
- If `reset` is `1` at a rising clock edge, `q` increases by one.
- The counter wraps around: when `q` is `15` (4'b1111), the next increment produces `0`.
- There are no enable, load, or direction controls. While `reset` is held high, the counter counts continuously every clock cycle.
- Reset takes priority over counting. While `reset` is held low across multiple clock edges, `q` remains `0`.
- No initial value is specified for `q` before the first clock edge with `reset` low; only behavior after a reset is observable.

**Example:**

| Clock edge | `reset` | `q` after edge |
|------------|---------|----------------|
| 1          | 0       | 0              |
| 2          | 1       | 1              |
| 3          | 1       | 2              |
| 4          | 1       | 3              |
| 5          | 0       | 0              |
| 6          | 1       | 1              |

Implement the module so that its input/output behavior matches the description exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
