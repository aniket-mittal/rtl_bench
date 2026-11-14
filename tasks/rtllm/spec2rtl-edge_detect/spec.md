# Implement `edge_detect` (RTLLM: edge_detect)

Create `edge_detect.v` containing a Verilog module named `edge_detect` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module for edge detection. There is a slowly changing 1-bit signal a. When "a" changes from 0 to 1, the indicating signal rise is 1. When "a" changes from 1 to 0, the falling edge of signal a is shown, the indicating signal down is 1. rise or down will be set to 1 on the next clock when the corresponding edge appears, and then return to 0 until the corresponding edge appears again.

Module name:  
    edge_detect      

Input ports:
    clk: Clock signal.
    rst_n: Reset signal (active low).
    a: Input signal.

Output ports:
    rise: Output signal indicating a rising edge.
    down: Output signal indicating a falling edge.

Implementation:
The edge_detect module detects rising and falling edges in the input signal a and generates corresponding output signals rise and down. The rising and falling edges are detected on the positive edge of the clock signal clk. If a rising edge is detected, the rise output signal is set to 1. If a falling edge is detected, the down output signal is set to 1. Otherwise, both output signals are set to 0. These output signals are synchronized with the clock and remain set to 1 until the corresponding edge appears again.

Give me the complete code.

---

## Files

Edit: `edge_detect.v`. Only these files are graded.

## Interface of `edge_detect`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `a` | in | 1 |  |
| `rise` | out | 1 | |
| `down` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v edge_detect.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
