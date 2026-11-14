# Implement `parallel2serial` (RTLLM: parallel2serial)

Create `parallel2serial.v` containing a Verilog module named `parallel2serial` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module for parallel-to-serial conversion, where every four input bits are converted to a serial one bit output (from MSB to LSB). The output signal valid_out is set to 1 to indicate the availability of valid serial output. When valid_out = 1, the most significant bit of d is output, and the remaining three bits are output sequentially in the following 3 cycles.

Module name:  
    parallel2serial     

Input ports:
    clk: Clock signal used for synchronous operations.
    rst_n: Reset signal. Defined as 0 for reset and 1 for reset signal inactive.
    d: 4-bit parallel data input.

Output ports:
    valid_out: Valid signal indicating the availability of serial output.
    dout: Serial output representing the converted data.

Implementation:
The most significant bit of the parallel input is assigned to the serial output (dout). On each clock cycle, if the counter (cnt) is 3, indicating the last bit of the parallel input, the module updates the data register (data) with the parallel input (d), resets the counter (cnt) to 0, and sets the valid signal (valid) to 1.
Otherwise, the module increments the counter (cnt) by 1, sets the valid signal (valid) to 0, and shifts the data register (data) one bit to the left, with the most significant bit shifted to the least significant bit.
Counter Register: If the reset signal (rst_n) is high, the register (cnt) is incremented by 1.

Give me the complete code.

---

## Files

Edit: `parallel2serial.v`. Only these files are graded.

## Interface of `parallel2serial`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `d` | in | 4 |  |
| `valid_out` | out | 1 | |
| `dout` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v parallel2serial.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
