# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Resettable 8-bit Register**

Design a Verilog module named `dut` that implements an 8-bit register with a synchronous reset and a non-zero reset value.

**Ports**

| Name  | Direction | Width | Description                          |
|-------|-----------|-------|--------------------------------------|
| `clk` | input     | 1     | Clock signal                         |
| `d`   | input     | 8     | Data input                           |
| `reset` | input   | 1     | Synchronous, active-high reset       |
| `q`   | output    | 8     | Registered output                    |

**Behavior**

- The output `q` is a registered value that changes only on the rising edge of `clk`.
- On each rising edge of `clk`:
  - If `reset` is high, `q` is loaded with the hexadecimal value `0x34` (binary `00110100`), regardless of the value on `d`.
  - Otherwise, `q` captures the current value of `d`.
- The reset is purely synchronous: changes on `reset` between clock edges have no effect on `q`. There is no asynchronous reset.
- No initial value is specified for `q` before the first clock edge in which `reset` is asserted, so the behavior prior to that is not checked.
- Between clock edges, `q` holds its previous value.

**Example**

| Cycle (rising edge) | `reset` | `d`  | `q` after edge |
|---------------------|---------|------|----------------|
| 1                   | 1       | 0xFF | 0x34           |
| 2                   | 0       | 0xA5 | 0xA5           |
| 3                   | 0       | 0x00 | 0x00           |
| 4                   | 1       | 0x7E | 0x34           |
| 5                   | 0       | 0x12 | 0x12           |

Implement the module with exactly the module name and port names/widths given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `reset` | in | 1 | reset, active high |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
