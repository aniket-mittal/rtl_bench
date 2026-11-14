# Implement `square_wave` (RTLLM: square_wave)

Create `square_wave.v` containing a Verilog module named `square_wave` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

The module is a simple yet effective generator designed to produce square wave signals with variable frequency. It takes an input clock signal and a frequency value, and outputs a square wave signal toggling at the specified frequency.

Module name:  
    square_wave 
                 
Input ports:
    clk: Clock signal that drives the module.
    [7:0]freq: Frequency control, specifying how often the square wave toggles.

Output ports:
    wave_out: Square wave output signal.

Internal Registers:
    count (reg [7:0]): Counter register used to track cycles between wave toggles.
    
Implementation:
Counter Operation:
    The count register increments on each rising edge of the clk.
    When count reaches (freq - 1), the count is reset to 0 and wave_out is toggled (i.e., flipped from 0 to 1 or from 1 to 0).
    If count has not reached freq, it simply increments by one on the next clock cycle.
Square Wave Generation:
    The module produces a square wave by flipping the wave_out signal at the rate determined by freq.
    The higher the freq value, the slower the square wave toggles (i.e., the lower the output frequency), and vice versa.
    
Give me the complete code.

---

## Files

Edit: `square_wave.v`. Only these files are graded.

## Interface of `square_wave`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `freq` | in | 8 |  |
| `wave_out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v square_wave.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
