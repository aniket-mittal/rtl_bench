# Implement `pulse_detect` (RTLLM: pulse_detect)

Create `pulse_detect.v` containing a Verilog module named `pulse_detect` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module for pulse detection. The 1-bit input signal data_in is a continuous input, which is triggered by clk. When "data_in" changes from 0 to 1 to 0(3 cycles), this is considered as a "pulse". The indicating signal dataout is 1 at the end cycle of the "pulse", and then returns to 0 until the corresponding pulse appears again. For example, if data_in is 01010(5 cycles), the data_out is 00101.


Module name:  
    pulse_detect

Input ports：
    clk: Clock signal.
    rst_n: Reset signal (active low).
    data_in: One-bit input signal.

Output ports：
    data_out: Output signal indicating the presence of pulses.

Implementation:
Declare the module pulse_detect with input and output ports as specified in the ports statement.
Declare a register state to keep track of the current state of the pulse detection process.
Inside an always block, sensitive to the positive edge of the clk signal and the negative edge of the rst_n signal, implement the logic for pulse detection and output generation.
In the reset condition (~rst_n), set the state register to the initial state and set the data_out output to 0, indicating no pulse. Continue the detection process for the remaining states. For each state, check the value of data_in and transition to the next state accordingly. If the current state satisfies the last state of a "pulse", set data_out to 1, indicating the end of a pulse. Otherwise, set data_out to 0.

Give me the complete code.

---

## Files

Edit: `pulse_detect.v`. Only these files are graded.

## Interface of `pulse_detect`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `data_in` | in | 1 |  |
| `data_out` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v pulse_detect.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
