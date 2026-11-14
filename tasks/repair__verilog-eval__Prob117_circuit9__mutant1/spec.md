# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Asynchronous-Reset Modulo-7 Counter**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `a`   | input | 1 |
| `q`   | output (registered) | 3 |

The module is a 3-bit counter driven by the rising edge of `clk`, with an active-high asynchronous control input `a`.

**Behavior**

- **Asynchronous override:** Whenever `a` is high, `q` must immediately take the value 4 (binary `100`), without waiting for a clock edge. This takes priority over everything else. While `a` remains high, `q` stays at 4 regardless of `clk`.
- **Counting:** When `a` is low, on each rising edge of `clk` the counter advances by one.
- **Wrap-around:** The counter does not use the full 3-bit range in normal operation. When the current value is 6, the next value is 0 rather than 7. The sequence is therefore 0, 1, 2, 3, 4, 5, 6, 0, 1, ...
- **Unused state:** If `q` is ever 7 (for example, if it powers up in that state), the counter follows the ordinary increment rule and the next value is 0 (the 3-bit increment wraps naturally).
- There is no separate reset input; `a` is the only means of forcing the counter to a known value. Releasing `a` does not by itself change `q`. The counter resumes counting from 4 on the next rising clock edge (so the first value after release and a clock edge is 5).

**Requirements**

- `q` is a registered output updated only by the events described above.
- The design must be synthesizable, and the port names, directions, and widths must match the table exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 | reset, active high |
| `q` | out | 3 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
