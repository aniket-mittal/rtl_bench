# Implement `LFSR` (RTLLM: LFSR)

Create `LFSR.v` containing a Verilog module named `LFSR` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

A Linear Feedback Shift Register (LFSR) designed for generating pseudo-random sequences. This 4-bit LFSR uses a specific feedback mechanism to produce a sequence of bits that appears random.

Module name:
    LFSR

Input ports:
    clk: Clock signal to synchronize the shifting operation.
    rst: Active high reset signal to initialize the register.

Output ports:
    out [3:0]: 4-bit output representing the current state of the LFSR.

Implementation:
The LFSR operates on the principle of shifting bits and applying feedback based on the XOR of specific bits in the register.
The feedback is calculated by XORing the most significant bit (out[3]) and the second most significant bit (out[2]). The result is inverted to produce the feedback signal.
On the rising edge of the clock (clk), if the reset (rst) is high, the register is initialized to zero. Otherwise, the bits in the register are shifted left, and the new feedback value is inserted at the least significant bit (LSB).

---

## Files

Edit: `LFSR.v`. Only these files are graded.

## Interface of `LFSR`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v LFSR.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
