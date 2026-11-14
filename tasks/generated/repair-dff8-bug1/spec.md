# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Inverting Register Stage**

Design a synchronous Verilog module named `dut` with the following ports:

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| `clk` | input | 1 | Clock signal |
| `d` | input | 8 | Data input |
| `q` | output | 8 | Registered data output |

**Behavior**

The module is an 8-bit register stage that stores the bitwise complement of its input.

- On every rising edge of `clk`, `q` is updated to the bitwise inverse of the value present on `d` at that edge.
- Between clock edges, `q` holds its previous value. Changes on `d` do not affect `q` until the next rising edge.
- There is no reset, enable, or other control input. The register updates on every rising clock edge.
- `q` must be initialized to `8'h00` at time zero, before the first rising clock edge. After that, `q` follows the behavior above.
- `q` must be declared so that it can be driven from sequential logic (i.e., it is a registered output).

**Example**

| Rising edge | `d` | `q` after edge |
|-------------|-----|----------------|
| (initial)   | —   | `8'h00` |
| 1 | `8'h0F` | `8'hF0` |
| 2 | `8'hFF` | `8'h00` |
| 3 | `8'h00` | `8'hFF` |
| 4 | `8'hA5` | `8'h5A` |

Implement the module so that it matches this behavior exactly, with the specified module name, port names, directions, and widths.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
