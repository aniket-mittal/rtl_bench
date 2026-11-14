# Task: repair `dut`

The starter file `dut.v` contains a module `dut` that does **not** fully match the specification below. Find where its behavior differs from the specification and fix `dut.v` so that module `dut` implements the specification exactly. Keep the module name `dut` and its port list unchanged.

## Specification

**Problem: Neighbor-AND Register**

Design a synchronous module named `dut` with the following ports:

| Name | Direction | Width |
|--------|-----------|-------|
| `clk` | input | 1 |
| `load` | input | 1 |
| `data` | input | 512 |
| `q` | output | 512 (registered) |

**Behavior**

On every rising edge of `clk`, the 512-bit register `q` is updated as follows:

- **Load mode (`load` = 1):** `q` takes the value of `data`.
- **Update mode (`load` = 0):** every bit of `q` is replaced by the logical AND of its two immediate neighbors, the bit directly above it (index + 1) and the bit directly below it (index - 1). The bit's own current value does not contribute to its next value.
  - Positions outside the register are treated as logic 0. As a result, the least significant bit (bit 0) and the most significant bit (bit 511) each have only one real neighbor, so both always become 0 after an update step.
  - All bits are updated simultaneously, using the values of `q` from before the clock edge.

**Notes**

- There is no reset. The initial value of `q` is unspecified, and the circuit's behavior is defined only by the rules above.
- `q` changes only on the rising edge of `clk`. It is a registered output, not combinational.
- `load` has priority over the update rule.

**Example (shown on 8 bits for clarity; your design is 512 bits wide)**

If `q` = `8'b1111_1111` and `load` = 0, the next `q` is `8'b0111_1110`. Bits 0 and 7 become 0, and the interior bits see two 1 neighbors.

If `q` = `8'b1011_0110` and `load` = 0, the next `q` is `8'b0010_0100`.

Implement the module with the exact name and port list above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `data` | in | 512 |  |
| `q` | out | 512 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
