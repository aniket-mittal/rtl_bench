# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Mux Input Generator**

Design a purely combinational Verilog module named `dut` that produces the four data inputs of a 4-to-1 multiplexer whose select lines are driven by two signals, `c` and `d`. The multiplexer is used to implement a two-variable function, so each data input must be a fixed function of `c` and `d`.

**Ports**

| Name     | Direction | Width |
|----------|-----------|-------|
| `c`      | input     | 1 bit |
| `d`      | input     | 1 bit |
| `mux_in` | output    | 4 bits (`[3:0]`) |

**Required behavior**

Each bit of `mux_in` is determined only by the current values of `c` and `d`:

- `mux_in[0]` is 1 when at least one of `c` or `d` is 1, and 0 otherwise.
- `mux_in[1]` is always 0, regardless of the inputs.
- `mux_in[2]` follows `d` exactly and does not depend on `c`.
- `mux_in[3]` is 1 only when both `c` and `d` are 1, and 0 otherwise.

**Notes**

- There is no clock and no reset; the outputs must respond immediately to any change on the inputs.
- No state may be stored.
- Do not add any additional ports.
- The result is checked by formal equivalence against a reference design, so the module name, port names, directions, and widths must match exactly as specified.

**Example**

| `c` | `d` | `mux_in[3:0]` |
|-----|-----|---------------|
| 0   | 0   | `0000`        |
| 0   | 1   | `0101`        |
| 1   | 0   | `0001`        |
| 1   | 1   | `1101`        |

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `mux_in` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
