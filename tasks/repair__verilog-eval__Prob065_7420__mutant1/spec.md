# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Dual NAND Gate Package**

Design a purely combinational Verilog module named `dut` that contains two independent logic gates, modeled after a classic dual-NAND chip with mismatched input counts.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `p1a` | input | 1 |
| `p1b` | input | 1 |
| `p1c` | input | 1 |
| `p1d` | input | 1 |
| `p1y` | output | 1 |
| `p2a` | input | 1 |
| `p2b` | input | 1 |
| `p2c` | input | 1 |
| `p2d` | input | 1 |
| `p2y` | output | 1 |

**Required behavior**

The module has two separate sections, each producing one output. Neither section affects the other.

- **Section 1** produces `p1y`. It is a NAND gate over exactly three inputs: `p1a`, `p1b`, and `p1c`. The output is low only when all three of those inputs are high; otherwise it is high. The input `p1d` is present in the port list but is **not connected** to anything: changing `p1d` must never affect any output.

- **Section 2** produces `p2y`. It is a NAND gate over all four inputs: `p2a`, `p2b`, `p2c`, and `p2d`. The output is low only when all four inputs are high; otherwise it is high.

**Constraints**

- No clock, reset, or stored state. Outputs must respond purely as a function of the current inputs.
- Port names, directions, and widths must match the table exactly, including the unused `p1d`.
- Every input and output is a single bit.

**Example**

- `p1a=1, p1b=1, p1c=1, p1d=0` → `p1y=0`
- `p1a=1, p1b=1, p1c=0, p1d=1` → `p1y=1`
- `p2a=1, p2b=1, p2c=1, p2d=1` → `p2y=0`
- `p2a=1, p2b=1, p2c=1, p2d=0` → `p2y=1`

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `p1a` | in | 1 |  |
| `p1b` | in | 1 |  |
| `p1c` | in | 1 |  |
| `p1d` | in | 1 |  |
| `p2a` | in | 1 |  |
| `p2b` | in | 1 |  |
| `p2c` | in | 1 |  |
| `p2d` | in | 1 |  |
| `p1y` | out | 1 | |
| `p2y` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
