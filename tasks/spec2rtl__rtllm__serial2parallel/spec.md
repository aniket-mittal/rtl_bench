# Implement `serial2parallel` (RTLLM: serial2parallel)

Create `serial2parallel.v` containing a Verilog module named `serial2parallel` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a series-parallel conversion circuit. It receives a serial input signal "din_serial" along with a control signal "din_valid" indicating the validity of the input data. The module operates on the rising edge of the clock signal "clk" and uses a synchronous design. The input din_serial is a single-bit data, and when the module receives 8 input data, the output dout_parallel outputs the 8-bit data(The serial input values are sequentially placed in dout_parallel from the most significant bit to the least significant bit), and the dout_valid is set to 1.

Module name:  
    serial2parallel          

Input ports:
	clk: Clock signal.
	rst_n: Reset signal (active low).
	din_serial: Serial input data.
	din_valid: Validity signal for input data.	

Output ports:
	dout_parallel: Parallel output data (8 bits wide).
	dout_valid: Validity signal for the output data.

Implementation:
The module utilizes a 4-bit counter (cnt) to keep track of the number of serial input data bits received. Every eight din_serial input, dout_parallel will output. When all 8 serial data bits have been received, the valid output signal is set to 1, indicating that the parallel output data is valid. Otherwise, the valid output signal is set to 0, indicating that the parallel output data is not valid.

Give me the complete code.

---

## Files

Edit: `serial2parallel.v`. Only these files are graded.

## Interface of `serial2parallel`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `din_serial` | in | 1 |  |
| `din_valid` | in | 1 |  |
| `dout_parallel` | out | 8 | |
| `dout_valid` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v serial2parallel.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
