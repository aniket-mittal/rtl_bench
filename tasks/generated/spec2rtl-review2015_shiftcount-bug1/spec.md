# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Shift Register with Decrement**

Design a synchronous 4-bit register module named `dut` with the following ports:

| Port | Direction | Width | Description |
|---|---|---|---|
| `clk` | input | 1 | Clock signal |
| `shift_ena` | input | 1 | Shift enable |
| `count_ena` | input | 1 | Count enable |
| `data` | input | 1 | Serial data input |
| `q` | output | 4 | Register contents |

**Behavior**

All state updates occur on the rising edge of `clk`. The output `q` is the registered 4-bit value itself (not a combinational function of the inputs).

On each rising clock edge, exactly one of the following happens, in order of priority:

1. If `count_ena` is high, the register value decreases by one, wrapping around from `0000` to `1111` (modulo 16).
2. Otherwise, if `shift_ena` is high, the register shifts left by one position. The most significant bit is discarded, and `data` becomes the new least significant bit.
3. Otherwise, the register holds its current value.

`count_ena` takes priority over `shift_ena`: if both are high in the same cycle, only the decrement is performed and `data` is ignored.

There is no reset input, and no initial value is specified. The design must not assume any particular starting value for `q`; its behavior is defined purely by the rules above relative to whatever value it currently holds.

**Example**

Suppose `q = 4'b0110`:
- `count_ena=1`, `shift_ena=0` → next `q = 4'b0101`
- `count_ena=0`, `shift_ena=1`, `data=1` → next `q = 4'b1101`
- `count_ena=1`, `shift_ena=1`, `data=1` → next `q = 4'b0101`
- `count_ena=0`, `shift_ena=0` → `q` stays `4'b0110`

Implement the module with exactly the module name and port names/widths given above.

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
