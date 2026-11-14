# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Registered Byte Filter with Asynchronous Reset**

Design a Verilog module named `dut` that captures an 8-bit input into an 8-bit output register, with the least significant bit always cleared.

**Ports**

| Name     | Direction | Width |
|----------|-----------|-------|
| `clk`    | input     | 1     |
| `d`      | input     | 8     |
| `areset` | input     | 1     |
| `q`      | output    | 8     |

`q` must be driven by a register (declare it as `output reg [7:0] q`, or equivalent).

**Behavior**

- The circuit is synchronous to the **rising edge** of `clk`.
- On each rising clock edge, when `areset` is low, `q` is loaded with the value of `d`, except that bit 0 of the loaded value is forced to 0. Bits 7 down to 1 of `q` take the corresponding bits of `d` unchanged.
- `areset` is an **active-high, asynchronous** reset. As soon as `areset` goes high, regardless of the clock, `q` is cleared to `8'h00`. While `areset` remains high, `q` stays at zero and `d` is ignored, including on clock edges.
- When `areset` returns low, normal operation resumes on the next rising clock edge. The output does not change at the moment the reset is released.
- `q` only changes in response to a rising clock edge or an assertion of `areset`. It must not change combinationally when `d` changes.
- Consequently, `q[0]` is 0 at all times after the first reset or clock edge.

**Example**

| Event                  | `d`       | `q` after event |
|------------------------|-----------|-----------------|
| `areset` asserted      | any       | `8'h00`         |
| rising edge, reset low | `8'hFF`   | `8'hFE`         |
| rising edge, reset low | `8'h5B`   | `8'h5A`         |
| rising edge, reset low | `8'h01`   | `8'h00`         |

Provide the complete module, with the exact name and port names above.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 8 |  |
| `areset` | in | 1 | reset, active high |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
