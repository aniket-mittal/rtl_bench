# Implement `freq_div` (RTLLM: freq_div)

Create `freq_div.v` containing a Verilog module named `freq_div` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a frequency divider that the input clock frequency of 100MHz signal, and the outputs are 3 clock frequencies: 50MHz, 10MHz, 1MHz.

Module name:  
    freq_div      

Input ports:
    CLK_in: Input clock signal
    RST: Reset signal

Output ports:
    CLK_50: Output clock signal with a frequency of CLK_in divided by 2.
    CLK_10: Output clock signal with a frequency of CLK_in divided by 10.
    CLK_1: Output clock signal with a frequency of CLK_in divided by 100.

Implementation:
The module uses three counters to divide the input clock frequency. 
CLK_50 generation:
On every positive edge of CLK_in or RST, if RST is active, CLK_50 is set to 0.
Otherwise, CLK_50 is toggled by inverting its current value.
CLK_10 generation:
On every positive edge of CLK_in or RST, if RST is active, CLK_10 is set to 0, and the counter cnt_10 is reset to 0.
If the counter cnt_10 reaches a value of 4, CLK_10 is toggled by inverting its current value, and the counter cnt_10 is reset to 0.
Otherwise, the counter cnt_10 is incremented by 1.
CLK_1 generation:
On every positive edge of CLK_in or RST, if RST is active, CLK_1 is set to 0, and the counter cnt_100 is reset to 0.
If the counter cnt_100 reaches a value of 49, CLK_1 is toggled by inverting its current value, and the counter cnt_100 is reset to 0.
Otherwise, the counter cnt_100 is incremented by 1.

Give me the complete code.

---

## Files

Edit: `freq_div.v`. Only these files are graded.

## Interface of `freq_div`

| port | dir | width | note |
|---|---|---|---|
| `CLK_in` | in | 1 | clock, rising edge |
| `RST` | in | 1 | reset, active high |
| `CLK_50` | out | 1 | |
| `CLK_10` | out | 1 | |
| `CLK_1` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v freq_div.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
