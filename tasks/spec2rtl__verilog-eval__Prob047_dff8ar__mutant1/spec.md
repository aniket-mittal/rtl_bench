# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Design an 8-bit Register with Asynchronous Reset (Unusual Polarity)**

Implement a Verilog module named `dut` with the following ports:

| Port | Direction | Width | Description |
|---|---|---|---|
| `clk` | input | 1 | Clock |
| `d` | input | 8 | Data input |
| `areset` | input | 1 | Asynchronous reset control |
| `q` | output | 8 | Registered output |

**Behavior**

The module is an 8-bit storage register whose output `q` is held in a flip-flop (not combinational).

- **Clocking:** On each rising edge of `clk`, `q` captures the value of `d`, provided the reset condition described below is not in effect.
- **Asynchronous reset:** The reset is triggered by a rising edge on `areset`, which takes effect immediately, independent of `clk`. Note the unusual polarity: the reset *action* (forcing `q` to all zeros) is performed when `areset` is **low (0)**, not high. Whenever the circuit is evaluated due to an event on `areset` or on the clock edge, and `areset` is 0, `q` is cleared to `8'h00`.
- **Normal operation:** When `areset` is 1, a rising clock edge loads `d` into `q`. `q` holds its value between clock edges.
- **Priority:** The reset condition takes priority over loading `d` whenever both a clock edge and the reset condition coincide.

Thus, with `areset` held low, `q` remains zero at every clock edge regardless of `d`. With `areset` held high, the module acts as a plain 8-bit D register. The sensitivity of the asynchronous event is to the **rising** edge of `areset` (as well as the rising edge of `clk`); a falling edge of `areset` alone does not by itself change `q`.

There is no initial value specified for `q` before the first triggering event.

Write the complete synthesizable module so that it matches this behavior exactly, including the unconventional reset polarity.

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
