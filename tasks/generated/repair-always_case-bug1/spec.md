# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Six-Way Selector with a Swapped Pair**

Design a purely combinational Verilog module named `dut` that routes one of six 4-bit data inputs to a single 4-bit output, based on a 3-bit select value.

**Ports**

| Name   | Direction | Width  |
|--------|-----------|--------|
| `sel`  | input     | 3 bits [2:0] |
| `data0`| input     | 4 bits [3:0] |
| `data1`| input     | 4 bits [3:0] |
| `data2`| input     | 4 bits [3:0] |
| `data3`| input     | 4 bits [3:0] |
| `data4`| input     | 4 bits [3:0] |
| `data5`| input     | 4 bits [3:0] |
| `out`  | output    | 4 bits [3:0] |

**Required behavior**

The output must follow the select value as shown below (the select value is given in decimal):

- `sel` = 0: `out` equals `data0`
- `sel` = 1: `out` equals `data1`
- `sel` = 2: `out` equals `data3`
- `sel` = 3: `out` equals `data2`
- `sel` = 4: `out` equals `data4`
- `sel` = 5: `out` equals `data5`
- `sel` = 6 or 7: `out` equals 0 (all four bits low)

Note that the mapping for select values 2 and 3 is intentionally non-sequential: the data inputs for these two cases are exchanged relative to the natural ordering. Your design must reproduce this exactly.

**Timing**

There is no clock and no reset. The output must update combinationally whenever `sel` or any data input changes, and the design must not infer any storage elements or latches.

**Requirements**

- Use the exact module name and port names, directions, and widths given above.
- Every possible value of `sel` must produce a fully defined output.
- Your solution will be checked by formal equivalence against a reference design, so the behavior must match for all input combinations.

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
