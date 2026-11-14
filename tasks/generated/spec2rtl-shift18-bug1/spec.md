# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**64-bit Loadable Shift Register with Selectable Shift Mode**

Design a synchronous module named `dut` with the following ports:

| Port | Direction | Width | Description |
|---|---|---|---|
| `clk` | input | 1 | Clock |
| `load` | input | 1 | Parallel-load control |
| `ena` | input | 1 | Shift control (active low, see below) |
| `amount` | input | 2 | Selects the shift operation |
| `data` | input | 64 | Parallel-load value |
| `q` | output | 64 | Register contents (registered output) |

**Behavior**

All state updates occur on the rising edge of `clk`. There is no reset signal, so the initial value of `q` is unspecified.

On each rising clock edge, the following priority applies:

1. If `load` is high, `q` takes the value of `data`. This overrides everything else.
2. Otherwise, if `ena` is **low**, `q` is updated according to `amount`:
   - `2'b00`: shift left by 1 bit, filling the vacated least-significant bit with 0.
   - `2'b01`: shift left by 8 bits, filling the vacated low-order bits with 0.
   - `2'b10`: arithmetic shift right by 1 bit, so the most-significant bit (sign) is preserved and replicated.
   - `2'b11`: arithmetic shift right by 8 bits, so the sign bit is replicated into the upper 8 bits.
3. Otherwise (`load` is low and `ena` is high), `q` holds its current value.

Note that `ena` is active low for shifting: the register shifts only when `ena` is 0 and holds when `ena` is 1.

Implement the module so that its cycle-by-cycle behavior matches this specification exactly, using the module name and port names/widths given above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `ena` | in | 1 |  |
| `amount` | in | 2 |  |
| `data` | in | 64 |  |
| `q` | out | 64 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
