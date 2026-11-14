# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Loadable Shift Register with Asynchronous Reset**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---------|-----------|-------|
| `clk` | input | 1 |
| `areset`| input | 1 |
| `load` | input | 1 |
| `ena` | input | 1 |
| `data` | input | 4 |
| `q` | output | 4 |

The module implements a 4-bit register `q` that is updated on the rising edge of `clk`, with an asynchronous, active-high reset.

**Behavior**

- **Reset:** When `areset` is asserted (high), `q` is cleared to `4'b0000` immediately, regardless of the clock and all other inputs.
- **Load:** Otherwise, on a rising clock edge, if `load` is high, `q` takes the value of `data`. Load has priority over `ena`.
- **Shift:** Otherwise, on a rising clock edge, if `ena` is high, the register performs a right shift by one position, where the new value is formed from the old contents as follows: the upper two bits of the new `q` are zero, and the lower two bits of the new `q` are the old bits `q[2]` (as the new bit 1) and `q[1]` (as the new bit 0). The old bits `q[3]` and `q[0]` do not appear in the result.
- **Hold:** If none of the above conditions apply, `q` retains its current value.

**Notes**

- `q` is a registered output; it changes only on a rising clock edge or when `areset` is asserted.
- Priority order from highest to lowest: `areset`, `load`, `ena`.
- Do not add any extra ports.

Your task is to implement the module `dut` with exactly the interface above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `areset` | in | 1 | reset, active high |
| `load` | in | 1 |  |
| `ena` | in | 1 |  |
| `data` | in | 4 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
