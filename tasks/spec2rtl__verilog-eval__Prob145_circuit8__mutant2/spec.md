# Task: implement `dut`

Create the file `dut.v` containing a synthesizable Verilog module named `dut` that implements the specification below exactly, including the port names and widths it describes.

## Specification

**Clock-Sampled Input: Latch and Flip-Flop Pair**

Design a Verilog module named `dut` with the following ports:

| Name  | Direction | Width |
|-------|-----------|-------|
| `clock` | input  | 1 |
| `a`     | input  | 1 |
| `p`     | output | 1 |
| `q`     | output | 1 |

Both outputs capture the single-bit input `a`, but they use different timing mechanisms:

- **`q`** is an edge-triggered register. On every rising edge of `clock`, it takes on the value of `a` present at that edge. It holds that value until the next rising edge.

- **`p`** is a level-sensitive storage element that is controlled by `clock`. While `clock` is high, `p` continuously follows `a` (any change in `a` while `clock` is high is immediately reflected on `p`). While `clock` is low, `p` retains the last value it had when `clock` was high; it does not change in response to `a`.

Additional requirements:

- There is no reset signal. Neither output has a defined initial value beyond what the storage behavior implies.
- `p` must not be modeled as an edge-triggered flip-flop. It is a transparent latch that is open when `clock` is high and closed when `clock` is low.
- `q` must update only on the rising edge of `clock`, never on the falling edge or in response to changes in `a` alone.
- Both outputs are single-bit signals and must be declared as outputs of the module with the exact names above.

Your implementation will be checked for equivalence against a reference design, so port names, directions, widths, and the latch-versus-flip-flop distinction must match exactly.

---

## Files

Edit: `dut.v`. Only these files are graded.

## Interface of `dut`

| port | dir | width | note |
|---|---|---|---|
| `clock` | in | 1 | clock, rising edge |
| `a` | in | 1 |  |
| `p` | out | 1 | |
| `q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v dut.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
