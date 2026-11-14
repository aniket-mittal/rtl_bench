# Implement `freq_divbyfrac` (RTLLM: freq_divbyfrac)

Create `freq_divbyfrac.v` containing a Verilog module named `freq_divbyfrac` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

A frequency divider that divides the input clock frequency by fractional values. It generates a clock signal with a fractional frequency division (3.5x), using the double-edge clocking technique to achieve half-integer division while adjusting for duty cycle imbalance. By dividing uneven clock cycles and phase-shifting them, a smooth fractional clock output is produced.

Module name: 
    freq_divbyfrac

Input ports:
    clk: Input clock signal.
    rst_n: Active low reset signal to initialize the module.
    
Output ports:
    clk_div: Fractionally divided clock output.

Implementation:
The module performs fractional frequency division by counting clock cycles and generating an intermediate divided clock signal. For 3.5x division:
The counter cycles through 7 clock cycles (MUL2_DIV_CLK = 7).
It generates two uneven clock periods: one with 4 source clock cycles and another with 3 source clock cycles.
In the next cycle, phase-shifted versions of the divided clock are generated. One phase is delayed by half a clock period, and the other is advanced by half a clock period.
Finally, the two intermediate clocks are logically OR-ed to produce the final fractional divided clock output, ensuring the divided clock signal has a uniform period.

Give me the complete code.

---

## Files

Edit: `freq_divbyfrac.v`. Only these files are graded.

## Interface of `freq_divbyfrac`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `clk_div` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v freq_divbyfrac.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
