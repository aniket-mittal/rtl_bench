# Implement `counter_12` (RTLLM: counter_12)

Create `counter_12.v` containing a Verilog module named `counter_12` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module of a counter design that requires counting from 4 'b0000 to 4' d11. The counting can be controlled by the input signal valid_count. That is, the count is paused if valid_count is 0. The counter increments on each clock cycle when the valid_count signal is active and resets to 0 when the reset signal (rst_n) is active.

Module name:  
    counter_12               
Input ports:
    rst_n: Reset signal (active low)
    clk: Clock signal
    valid_count: Signal to enable counting
Output ports:
    out: 4-bit output representing the current count value

Implementation:
If the reset signal is active (!rst_n), the counter is reset to 0 by assigning the value 4'b0000 to the output register (out). If the valid_count signal is 1, the counter increments. It checks if the current count value (out) is equal to 4'd11 (maximum count value). If it is, the counter wraps around and resets to 0 by assigning the value 4'b0000 to the output register (out). Otherwise, it increments the output register by 1. If the valid_count = 0, the counter will stop, and the output register (out) remains unchanged.

Give me the complete code.

---

## Files

Edit: `counter_12.v`. Only these files are graded.

## Interface of `counter_12`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `valid_count` | in | 1 |  |
| `out` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v counter_12.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
