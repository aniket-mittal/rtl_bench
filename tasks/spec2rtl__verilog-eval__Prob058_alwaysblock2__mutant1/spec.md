# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Three Flavors of XOR**

Design a Verilog module named `dut` with the following ports:

| Port | Direction | Width |
|---|---|---|
| `clk` | input | 1 |
| `a` | input | 1 |
| `b` | input | 1 |
| `out_assign` | output | 1 |
| `out_always_comb` | output | 1 |
| `out_always_ff` | output | 1 |

The module has three outputs, each produced in a different style:

1. **`out_assign`** is purely combinational. It is 1 whenever exactly one of `a` and `b` is 1, and 0 otherwise. It reflects input changes immediately.

2. **`out_always_comb`** is also purely combinational, with no dependence on the clock. Its value is derived solely from input `a`. For every possible value of `a` (and regardless of `b`), the output is always constant 0.

3. **`out_always_ff`** is a registered output. On each rising edge of `clk`, it captures the value that `out_assign` would have at that moment (the XOR of `a` and `b`). It holds that value until the next rising edge. There is no reset signal, so the initial value before the first clock edge is unspecified, and the design must not assume any reset behavior.

Constraints:
- Only the rising edge of `clk` may be used for sequential behavior.
- No other ports, reset, or enable inputs may be added.
- The design is checked by formal equivalence against a reference, so port names and widths must match exactly, and the constant-zero behavior of `out_always_comb` must be preserved (do not substitute any other function of the inputs).

**Example behavior**
- If `a=1, b=0`: `out_assign=1`, `out_always_comb=0`. After the next rising clock edge, `out_always_ff=1`.
- If `a=1, b=1`: `out_assign=0`, `out_always_comb=0`. After the next rising clock edge, `out_always_ff=0`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `b` | in | 1 |  |
| `out_assign` | out | 1 | |
| `out_always_comb` | out | 1 | |
| `out_always_ff` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
