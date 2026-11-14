# Implement `adder_pipe_64bit` (RTLLM: adder_pipe_64bit)

Create `adder_pipe_64bit.v` containing a Verilog module named `adder_pipe_64bit` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module of a 64-bit ripple carry adder, which includes several registers to enable the pipeline stages. The output result is available on the result port, and the o_en = 1 indicates the availability of the result.

Module name:  
    adder_pipe_64bit               
Input ports:
    clk: Clock input
    rst_n: Active low reset signal
    i_en: Enable signal for addition operation
    adda: 64-bit input operand A
    addb: 64-bit input operand B
   
Output ports:
    result: 65-bit output representing the sum of adda and addb.
    o_en: Output enable signal.   

Implementation:
The module includes several registers to enable the pipeline stages and synchronize the input enable signal (i_en). These registers are controlled by the clock (clk) and reset (rst_n) signals.
The sum values for each pipeline stage are calculated by adding the corresponding input operands and carry signals.
The output enable signal (o_en) is updated based on the pipeline stages and synchronized with the clock (clk) and reset (rst_n) signals.

Give me the complete code.

---

## Files

Edit: `adder_pipe_64bit.v`. Only these files are graded.

## Interface of `adder_pipe_64bit`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `i_en` | in | 1 |  |
| `adda` | in | 64 |  |
| `addb` | in | 64 |  |
| `result` | out | 65 | |
| `o_en` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v adder_pipe_64bit.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
