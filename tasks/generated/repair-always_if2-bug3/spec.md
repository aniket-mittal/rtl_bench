# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Self-Driving Car Controller**

Design a purely combinational Verilog module named `dut` that decides the status of a self-driving car's onboard systems.

**Ports**

| Name | Direction | Width |
|---|---|---|
| `cpu_overheated` | input | 1 |
| `arrived` | input | 1 |
| `gas_tank_empty` | input | 1 |
| `shut_off_computer` | output | 1 |
| `keep_driving` | output | 1 |

**Behavior**

- `shut_off_computer` must be asserted (1) whenever the CPU is overheated, and deasserted (0) otherwise. It depends on no other input.
- `keep_driving` indicates whether the car should continue moving:
  - If the CPU is overheated, `keep_driving` must be 0, regardless of any other input.
  - If the CPU is not overheated, `keep_driving` must be 1 when the gas tank is not empty, and 0 when the gas tank is empty.

**Notes**

- There is no clock and no reset; both outputs must respond immediately to changes in the inputs.
- The `arrived` input is part of the interface and must be declared exactly as specified, but it does not influence either output in this design. Do not make the outputs depend on it, even though one might expect arrival to stop the car.
- Both outputs must be defined for every input combination, with no latches or unknown values.

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
