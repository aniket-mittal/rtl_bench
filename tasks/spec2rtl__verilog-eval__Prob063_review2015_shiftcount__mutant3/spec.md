# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Shift-or-Count 4-bit Register**

Design a synchronous Verilog module named `dut` that implements a 4-bit register which can either shift in serial data or act as an up-counter, depending on two control inputs.

**Ports**

| Name | Direction | Width |
|------|-----------|-------|
| `clk` | input | 1 |
| `shift_ena` | input | 1 |
| `count_ena` | input | 1 |
| `data` | input | 1 |
| `q` | output | 4 |

**Behavior**

All state changes occur on the rising edge of `clk`. The output `q` is the registered 4-bit value and must be declared so that it holds its value between clock edges.

On each rising clock edge, exactly one of the following happens, in priority order:

1. If `shift_ena` is high, the register shifts left by one position. The most significant bit is discarded and the value on `data` enters at the least significant bit.
2. Otherwise, if `count_ena` is high, the register value is incremented by one, wrapping from 15 back to 0.
3. Otherwise, the register retains its current value.

`shift_ena` takes priority over `count_ena`: if both are high in the same cycle, only the shift occurs.

There is no reset input. The design should not include any reset logic, and the initial value of `q` is unspecified. Your solution will be judged on its behavior after the register has been loaded with known values through the shift operation.

**Example**

Suppose `q = 4'b0110`.
- With `shift_ena=1`, `data=1`, the next value is `4'b1101`.
- With `shift_ena=0`, `count_ena=1`, the next value is `4'b0111`.
- With `shift_ena=0`, `count_ena=0`, the value stays `4'b0110`.
- If `q = 4'b1111` and only `count_ena=1`, the next value is `4'b0000`.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `shift_ena` | in | 1 |  |
| `count_ena` | in | 1 |  |
| `data` | in | 1 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
