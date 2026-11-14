# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Road Trip Controller**

Design a Verilog module named `dut` that implements simple control logic for a road trip. The module has the following ports:

| Port | Direction | Width |
|---|---|---|
| `cpu_overheated` | input | 1 |
| `shut_off_computer` | output | 1 |
| `arrived` | input | 1 |
| `gas_tank_empty` | input | 1 |
| `keep_driving` | output | 1 |

**Required behavior**

1. **Computer shutdown (combinational):** `shut_off_computer` must continuously reflect `cpu_overheated`. It is 1 whenever `cpu_overheated` is 1, and 0 otherwise. It has no clock or memory.

2. **Driving decision (edge-triggered):** `keep_driving` is a stored value that is updated only on a rising edge of the `arrived` input; `arrived` itself acts as the triggering signal, not as a clock accompanied by a separate clock port. There is no other clock and no reset.

   Since the update occurs only on a rising edge of `arrived`, the `arrived` signal is necessarily 1 at the moment of the update. Consequently, at every update `keep_driving` is loaded with the value 0, regardless of `gas_tank_empty`. The `gas_tank_empty` input therefore never has any observable effect on `keep_driving`.

   Between rising edges of `arrived`, `keep_driving` holds its previous value. Its initial value before the first rising edge is unspecified (unknown), so the design should not assume any particular power-up state.

Implement the module so that the ports, names, and widths match exactly as listed above. Output both signals as variables suitable for procedural assignment (`output reg`).

**Example**

- `cpu_overheated = 1` → `shut_off_computer = 1`.
- `cpu_overheated = 0` → `shut_off_computer = 0`.
- A rising edge on `arrived` (with any `gas_tank_empty`) → `keep_driving` becomes 0 and stays 0 until the next rising edge of `arrived`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `arrived` | in | 1 | clock, rising edge |
| `cpu_overheated` | in | 1 |  |
| `gas_tank_empty` | in | 1 |  |
| `shut_off_computer` | out | 1 | |
| `keep_driving` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
