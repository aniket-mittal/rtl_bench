# Implement `accu` (RTLLM: accu)

Create `accu.v` containing a Verilog module named `accu` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module to achieve serial input data accumulation output, input is 8bit data. The valid_in will be set to 1 before the first data comes in. Whenever the module receives 4 input data, the data_out outputs 4 received data accumulation results and sets the valid_out to be 1 (will last only 1 cycle).

Module name:  
    accu               
Input ports:
	clk: Clock input for synchronization.
	rst_n: Active-low reset signal.
	data_in[7:0]: 8-bit input data for addition.
	valid_in: Input signal indicating readiness for new data.   
Output ports:
    valid_out: Output signal indicating when 4 input data accumulation is reached.
	data_out[9:0]: 10-bit output data representing the accumulated sum.

Implementation:
When valid_in is 1, data_in is a valid input. Accumulate four valid input data_in values and calculate the output data_out by adding these four values together. 
There is no output when there are fewer than four data_in inputs in the interim. Along with the output data_out, a cycle of valid_out=1 will appear as a signal. 
The valid_out signal is set to 1 when the data_out outputs 4 received data accumulation results. Otherwise, it is set to 0.

Give me the complete code.

---

## Files

Edit: `accu.v`. Only these files are graded.

## Interface of `accu`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `data_in` | in | 8 |  |
| `valid_in` | in | 1 |  |
| `valid_out` | out | 1 | |
| `data_out` | out | 10 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v accu.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
