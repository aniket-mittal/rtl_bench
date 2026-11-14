# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: 8-Bit Pass-Through Bus**

Design a purely combinational Verilog module named `dut` that forwards an 8-bit input bus to an 8-bit output bus.

**Ports**

| Name  | Direction | Width  |
|-------|-----------|--------|
| `in`  | input     | 8 bits (`[7:0]`) |
| `out` | output    | 8 bits (`[7:0]`) |

**Required behavior**

- Each output bit must carry the value of the input bit with the same index: `out[i]` equals `in[i]` for every `i` from 0 to 7. Bit ordering is preserved, with no reversal, rotation, inversion, or shifting.
- The circuit is entirely combinational. There is no clock, no reset, and no state. Any change on `in` must appear on `out` immediately, with no latency and no registering.
- Every one of the 256 possible input values must be reproduced exactly on the output. This includes all-zeros, all-ones, and alternating patterns, and no value receives special treatment.
- Unknown (`x`) or high-impedance (`z`) values on an input bit are simply passed along to the corresponding output bit, with no masking or conditioning.

**Constraints**

- Use exactly the module name and port names above. Port widths must match exactly, since your design will be checked for formal equivalence against a reference.
- Do not add any extra ports.

**Examples**

| `in`         | `out`        |
|--------------|--------------|
| `8'b00000000` | `8'b00000000` |
| `8'b11111111` | `8'b11111111` |
| `8'b10100101` | `8'b10100101` |
| `8'b00000001` | `8'b00000001` |
| `8'b10000000` | `8'b10000000` |

Implement the module so that the output always mirrors the input, bit for bit.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `out` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
