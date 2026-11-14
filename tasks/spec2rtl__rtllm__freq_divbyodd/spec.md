# Implement `freq_divbyodd` (RTLLM: freq_divbyodd)

Create `freq_divbyodd.v` containing a Verilog module named `freq_divbyodd` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

A frequency divider that divides the input clock frequency by odd numbers. The module generates a divided clock output by an odd divisor value provided as a parameter.

Module name:
    freq_divbyodd

Input ports:
    clk: Input clock signal.
    rst_n: Active low reset signal that initializes the divider.
    
Output ports:
    clk_div: Divided clock output.  

Implementation:

The module divides the input clock frequency by an odd number defined by the parameter NUM_DIV, which defaults to 5.
Two counters, cnt1 and cnt2, are used for tracking the rising and falling edges of the clock. Each counter counts up to NUM_DIV - 1.
Two separate clock dividers, clk_div1 and clk_div2, are used for positive and negative edges of the clock, respectively. These are toggled when the counters reach half of NUM_DIV.
The final divided clock output, clk_div, is derived by logically OR-ing clk_div1 and clk_div2 to account for both clock edges.
The active low reset signal rst_n initializes the counters and the clock divider outputs.


Give me the complete code.

---

## Files

Edit: `freq_divbyodd.v`. Only these files are graded.

## Interface of `freq_divbyodd`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `clk_div` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v freq_divbyodd.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
