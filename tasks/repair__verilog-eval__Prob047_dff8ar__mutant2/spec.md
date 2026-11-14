# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Nibble-Swap Register with Asynchronous Reset**

Design a Verilog module named `dut` that registers an 8-bit input after exchanging its two 4-bit halves.

**Ports**

| Name   | Direction | Width | Description                         |
|--------|-----------|-------|-------------------------------------|
| `clk`    | input     | 1     | Clock signal                        |
| `d`      | input     | 8     | Data input                          |
| `areset` | input     | 1     | Active-high asynchronous reset      |
| `q`      | output    | 8     | Registered output                   |

**Behavior**

- The output `q` must be driven by flip-flops that update on the **rising edge** of `clk`.
- On each rising clock edge (when reset is not asserted), `q` captures the value of `d` with its upper nibble (bits 7:4) and lower nibble (bits 3:0) swapped. That is, the upper four bits of `q` receive the lower four bits of `d`, and the lower four bits of `q` receive the upper four bits of `d`. The bit order inside each nibble is preserved.
- When `areset` is asserted (goes high), `q` must immediately be cleared to all zeros, regardless of the clock. This reset is **asynchronous**: it takes effect as soon as `areset` rises, not on the next clock edge.
- While `areset` remains high, `q` stays at zero and clock edges have no effect on it.
- When `areset` is deasserted, normal operation resumes on the next rising clock edge. Deassertion itself does not change `q`.
- There is no enable signal; the register loads on every rising clock edge outside of reset.

**Requirements**

- The output must be registered (not combinational): changes in `d` between clock edges must not affect `q`.
- Use the exact module name and port names/widths given above.

**Example**

If `d = 8'hA5` at a rising clock edge with `areset = 0`, then after that edge `q = 8'h5A`.
If `d = 8'h12` at the next rising edge, `q = 8'h21`.
If `areset` then goes high, `q = 8'h00` immediately.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `areset` | in | 1 | reset, active high |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
