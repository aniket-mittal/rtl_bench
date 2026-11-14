# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Road Trip Controller**

Design a purely combinational Verilog module named `dut` that controls a car's computer and driving state from a few status signals.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `cpu_overheated` | input | 1 |
| `arrived` | input | 1 |
| `gas_tank_empty` | input | 1 |
| `shut_off_computer` | output | 1 |
| `keep_driving` | output | 1 |

**Required behavior**

1. `shut_off_computer`: Note the unusual polarity. The output is asserted (1) when `cpu_overheated` is **low**, and deasserted (0) when `cpu_overheated` is **high**. In other words, the computer is told to shut off while the CPU is *not* overheated, and not told to shut off when it is.

2. `keep_driving`: The car keeps driving (1) only if it has not yet arrived **and** the gas tank is not empty. In every other case, including whenever `arrived` is high regardless of `gas_tank_empty`, the output is 0.

**Constraints**

- There is no clock and no reset. Both outputs must respond immediately to any change in the inputs.
- Each output depends only on the inputs described above. `shut_off_computer` must not depend on `arrived` or `gas_tank_empty`, and `keep_driving` must not depend on `cpu_overheated`.
- Do not "fix" the polarity of `shut_off_computer`. The behavior described above is the required one.

Your module must match the module name and port names, directions, and widths exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `cpu_overheated` | in | 1 |  |
| `arrived` | in | 1 |  |
| `gas_tank_empty` | in | 1 |  |
| `shut_off_computer` | out | 1 | |
| `keep_driving` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
