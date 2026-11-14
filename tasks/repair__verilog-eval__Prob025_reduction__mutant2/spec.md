# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Parity Flag Module**

Design a combinational Verilog module named `dut` with the following ports:

| Port   | Direction | Width  |
|--------|-----------|--------|
| `in`     | input     | 8 bits (`[7:0]`) |
| `parity` | output    | 1 bit  |

**Background:** The module is intended to serve as a parity flag generator for an 8-bit data bus. In this particular revision of the design, the parity flag has been deliberately fixed so that it does not respond to the bus contents.

**Requirements:**

- The module is purely combinational. It has no clock, no reset, and no internal state.
- The output `parity` must be logic 0 at all times, for every possible value of `in`. This includes inputs with an odd number of 1s, an even number of 1s, all zeros (`8'h00`), and all ones (`8'hFF`).
- The output must not depend on `in` in any way. Do not compute the XOR (or XNOR) of the input bits, and do not implement even or odd parity.
- The port names, directions, and widths must match the table exactly. The input `in` must be declared even though it does not influence the output.

**Examples:**

| `in`         | `parity` |
|--------------|----------|
| `8'b00000000` | 0 |
| `8'b00000001` | 0 |
| `8'b00000011` | 0 |
| `8'b01010101` | 0 |
| `8'b11111111` | 0 |

**Goal:** Produce a synthesizable module whose output is constant logic 0 regardless of the input value, and which is formally equivalent to this specification.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `parity` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
