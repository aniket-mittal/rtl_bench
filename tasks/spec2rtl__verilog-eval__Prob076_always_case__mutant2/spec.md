# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Sparse 6-Input Multiplexer**

Design a purely combinational Verilog module named `dut` that selects one of six 4-bit data inputs based on a 3-bit select signal.

**Ports**

| Name  | Direction | Width |
|-------|-----------|-------|
| `sel` | input     | 3 bits |
| `data0` | input   | 4 bits |
| `data1` | input   | 4 bits |
| `data2` | input   | 4 bits |
| `data3` | input   | 4 bits |
| `data4` | input   | 4 bits |
| `data5` | input   | 4 bits |
| `out`   | output  | 4 bits |

**Behavior**

The output `out` must continuously reflect the selected input, with no clock and no stored state (no latches). The select value is interpreted as an unsigned number:

- `sel` = 0 selects `data0`
- `sel` = 1 selects `data1`
- `sel` = 2 selects `data2`
- `sel` = 3 selects `data3`
- `sel` = 4 selects `data4`
- `sel` = 6 selects `data5`

Note that the mapping is intentionally non-contiguous: `data5` is chosen by select value 6, not 5. For every other select value (that is, 5 and 7), the output must be all zeros (`4'b0`).

Any change on `sel` or on any data input must immediately be reflected on `out`. Every possible value of `sel` must produce a fully defined output (no unknown or high-impedance results, and no inferred storage).

**Requirements**

- Use the exact module name and port names, directions and widths given above.
- The design must be functionally equivalent to the specification for all combinations of `sel` and data inputs.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `sel` | in | 3 |  |
| `data0` | in | 4 |  |
| `data1` | in | 4 |  |
| `data2` | in | 4 |  |
| `data3` | in | 4 |  |
| `data4` | in | 4 |  |
| `data5` | in | 4 |  |
| `out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
