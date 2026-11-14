# Implement `freq_diveven` (RTLLM: freq_divbyeven)

Create `freq_diveven.v` containing a Verilog module named `freq_diveven` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Frequency divider that divides the input clock frequency by even numbers. This module generates a divided clock signal by toggling its output every specified number of input clock cycles.

Module name: 
    freq_diveven

Input ports:
    clk: Input clock signal that will be divided.
    rst_n: Active-low reset signal to initialize the module.

Output ports:
    clk_div: Divided clock output signal.

Implementation:
    The frequency divider uses a counter (`cnt`) to count the number of clock cycles. The `NUM_DIV` parameter specifies the division factor, which must be an even number.
    - When the reset signal (`rst_n`) is low, the counter and the divided clock signal (`clk_div`) are initialized to zero.
    - On each positive edge of the input clock (`clk`), if the counter is less than half of `NUM_DIV - 1`, the counter increments without changing the divided clock output.
    - When the counter reaches the specified limit, it resets to zero and toggles the `clk_div` output signal, effectively dividing the frequency of the input clock by the even number specified by `NUM_DIV`.

Counter:
    - The counter is a 4-bit register (`cnt`) that tracks the number of clock cycles.

Give me the complete code.

---

## Files

Edit: `freq_diveven.v`. Only these files are graded.

## Interface of `freq_diveven`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `clk_div` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v freq_diveven.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
