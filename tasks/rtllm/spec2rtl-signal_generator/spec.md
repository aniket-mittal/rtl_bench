# Implement `signal_generator` (RTLLM: signal_generator)

Create `signal_generator.v` containing a Verilog module named `signal_generator` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a Triangle Wave signal generator module that generates a waveform by incrementing and decrementing a 5-bit signal named "wave". The waveform cycles between 0 and 31, which is incremented or decremented by 1.


Module name:  
    signal_generator 
                 
Input ports:
    clk: Clock signal used for synchronous operation.
    rst_n: Active-low reset signal. Defined as 0 for reset and 1 for reset signal inactive.

Output ports:
    wave: 5-bit output waveform signal representing the generated waveform.

Implementation:
State and Waveform Generation:
The module includes a register, state, used to control the state of the waveform generation.
The module also includes a register, wave, with a width of 5 bits, which represents the generated waveform.
The state and waveform registers are updated in the always block, triggered on the positive edge of the clock signal (posedge clk) or the negative edge of the reset signal (negedge rst_n).
On reset, indicated by ~rst_n, the state register is cleared to 0, and the wave register is cleared to 0.
The waveform generation is controlled using a case statement based on the current state:
If the state is 0, the waveform (wave) is incremented by 1.
If the waveform reaches 31 (wave == 31), the state is transitioned to 1.
If the state is 1, the waveform is decremented by 1.
If the waveform reaches 0 (wave == 0), the state is transitioned back to 0.
The waveform generation continues to cycle between 0 and 31 based on the state transitions.

Give me the complete code.

---

## Files

Edit: `signal_generator.v`. Only these files are graded.

## Interface of `signal_generator`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `wave` | out | 5 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v signal_generator.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
