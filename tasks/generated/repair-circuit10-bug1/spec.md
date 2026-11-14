# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Sticky Flag with Parity Output**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---------|-----------|-------|
| `clk` | input | 1 |
| `a` | input | 1 |
| `b` | input | 1 |
| `q` | output | 1 |
| `state` | output | 1 |

**Behavior**

The module contains a single bit of memory, a latched flag, which is observable on the `state` output.

- **Flag update:** On every rising edge of `clk`, the flag is updated. Once it has become 1, it must never return to 0. It becomes 1 at a clock edge if input `b` is high at that edge. If `b` is low, the flag keeps its previous value. The value of `a` has no effect on how the flag evolves.
- **State output:** `state` continuously reflects the current value of the flag, with no combinational dependence on the inputs.
- **Parity output:** `q` is combinational. It is the odd-parity (XOR) of the three one-bit quantities `a`, `b`, and the current value of the flag. It changes immediately when `a` or `b` changes, and it changes with the flag after a clock edge.

**Notes**

- There is no reset port. Do not add one. The design is judged only on its sequential behavior relative to the flag's value, so do not assume or force any particular power-up value.
- All sequential behavior is triggered only on the rising edge of `clk`.
- Do not add any extra ports.

**Example (assuming the flag currently holds 0)**

- With `a=1, b=0`: `q=1`, `state=0`. After the clock edge the flag stays 0.
- With `a=1, b=1`: `q=0`, `state=0`. After the clock edge the flag becomes 1.
- With `a=0, b=0` and the flag now 1: `q=1`, `state=1`, and the flag stays 1 on later edges regardless of inputs.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `q` | out | 1 | |
| `state` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
