# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Loadable Single-Bit Register Cell**

Design a synchronous Verilog module named `dut` that implements a one-bit storage element whose next value is chosen between two data inputs by a select signal.

**Ports**

| Name   | Direction | Width |
|--------|-----------|-------|
| `clk`  | input     | 1     |
| `L`    | input     | 1     |
| `q_in` | input     | 1     |
| `r_in` | input     | 1     |
| `Q`    | output    | 1     |

**Behavior**

- `Q` is a registered output. It changes only on the rising edge of `clk`; it must not respond to input changes between clock edges.
- At each rising edge of `clk`, the value sampled is determined by `L`:
  - If `L` is 1, `Q` takes the value of `r_in`.
  - If `L` is 0, `Q` takes the value of `q_in`.
- There is no reset input. Instead, `Q` must hold the value 1 from the start of operation, before any clock edge has occurred (i.e., its power-up/initial value is 1).
- Inputs are single-bit and are assumed to be driven with defined (0/1) values.

**Requirements**

- Use exactly the module name and port names given above.
- The output `Q` must be declared so that it can be assigned within a clocked process and must have the specified initial value.
- No other outputs or ports are permitted.

**Example**

Assume `Q` is 1 initially.

| Edge | L | q_in | r_in | Q after edge |
|------|---|------|------|--------------|
| 1    | 0 | 0    | 1    | 0            |
| 2    | 1 | 0    | 1    | 1            |
| 3    | 1 | 1    | 0    | 0            |
| 4    | 0 | 1    | 0    | 1            |

Write the module that satisfies this specification.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `L` | in | 1 |  |
| `q_in` | in | 1 |  |
| `r_in` | in | 1 |  |
| `Q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
