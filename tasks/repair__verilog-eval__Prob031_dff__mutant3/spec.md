# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Two-Stage Delay Line**

Design a Verilog module named `dut` that delays a single-bit input by two clock cycles.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `d` | input | 1 |
| `q` | output (registered) | 1 |

**Behavior**

- The circuit is fully synchronous to the rising edge of `clk`. There is no reset input, and no asynchronous behavior.
- The output `q` must change only on a rising edge of `clk`. It is never driven combinationally from `d`.
- The value of `d` sampled at a given rising clock edge must appear on `q` exactly two rising clock edges later. In other words, `q` after edge *N+2* equals `d` as sampled at edge *N*.
- Between clock edges, `q` holds its value.
- There is no enable and no other control: every rising edge shifts new data through, regardless of the value of `d`.

**Initial state**

- There is no reset. Before any meaningful data has propagated, the output `q` is unknown. Both the output and the internal storage that holds the first-stage sample must start in an unknown (`x`) state at time zero, not 0 or 1. After the first rising edge, `q` still reflects the unknown initial contents of the first stage; only from the second rising edge onward does `q` reflect actual input data.

**Requirements**

- Use exactly the port names and widths given above.
- The module must be a single clocked design with a total latency of two clock cycles from `d` to `q`.
- Do not add extra ports.

**Example**

If `d` is sampled as 1, 0, 1, 1 on four consecutive rising edges (edges 1 to 4), then `q` after edges 1 through 4 is: `x`, `x`, 1, 0.

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
