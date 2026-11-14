# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Clock-Gated Sample and Falling-Edge Capture**

Design a Verilog module named `dut` with the following ports:

| Port    | Direction | Width |
|---------|-----------|-------|
| `clock` | input     | 1     |
| `a`     | input     | 1     |
| `p`     | output    | 1     |
| `q`     | output    | 1     |

The module has two outputs that both observe the single-bit input `a` in different ways relative to `clock`:

- **`p`** is a purely combinational, level-sensitive output (no storage element). While `clock` is high, `p` follows `a` continuously, so any change on `a` during the high phase appears on `p` immediately. While `clock` is low, `p` is forced to logic 0. Because it is combinational, `p` also changes immediately whenever `clock` itself toggles (for example, it drops to 0 as soon as `clock` falls, and takes the current value of `a` as soon as `clock` rises).

- **`q`** is a registered output that captures the value of `a` only on the falling edge of `clock`. It holds that captured value unchanged until the next falling edge, regardless of any changes on `a` or on the rising edge of `clock`. There is no reset signal; `q` has no defined value until the first falling edge of `clock` occurs.

Your design must use only the ports listed above (no additional inputs or outputs, no reset), and the two outputs must be independent of each other. Behavior should match exactly: `p` must not be registered or sampled on any clock edge, and `q` must not update on the rising edge or in response to level changes of `a`.

Implement the module so that it behaves identically to this specification under formal equivalence checking.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `p` | out | 1 | |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
