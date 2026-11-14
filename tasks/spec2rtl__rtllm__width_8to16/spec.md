# Implement `width_8to16` (RTLLM: width_8to16)

Create `width_8to16.v` containing a Verilog module named `width_8to16` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a data width conversion circuit that converts 8-bit data input to 16-bit data output. The module provides two output ports: valid_out, which indicates the validity of the output data, and data_out, which represents the converted 16-bit output data. The first arriving 8-bit data should be placed in the higher 8 bits of the 16-bit data output. The valid_out and data_out signals are generated in the next clock cycle after the two data inputs. When there is only one data input, valid_out and data_out are not generated immediately. Instead, they wait for the arrival of the next data input to complete the concatenation of the two data inputs before generating valid_out and data_out. 

Module name:  
    width_8to16   

Input ports:
    clk: Clock signal used for synchronous operation.
    rst_n: Active-low reset signal. Defined as 0 for reset and 1 for reset signal inactive.
    valid_in: Input signal indicating the validity of the input data.
    data_in: 8-bit input data to be converted.

Output ports:
    valid_out: Output signal indicating the validity of the output data.
    data_out: 16-bit output data resulting from the width conversion.

Implementation:
The data_out register is triggered on the positive edge of the clock signal (posedge clk) or the negative edge of the reset signal (negedge rst_n).
On reset, indicated by !rst_n, the data_out register is cleared to 0.
If the input data is valid (valid_in) and the flag signal is active, the data_out register is updated by concatenating the contents of the data_lock register (8 bits) and the data_in register (8 bits) to form a 16-bit output. The first valid data is temporarily stored, and when the second valid data is inputted, they are concatenated to produce the output valid_out and data_out.

Give me the complete code.

---

## Files

Edit: `width_8to16.v`. Only these files are graded.

## Interface of `width_8to16`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `valid_in` | in | 1 |  |
| `data_in` | in | 8 |  |
| `valid_out` | out | 1 | |
| `data_out` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v width_8to16.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
