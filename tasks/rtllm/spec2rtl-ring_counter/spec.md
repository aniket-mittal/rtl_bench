# Implement `ring_counter` (RTLLM: ring_counter)

Create `ring_counter.v` containing a Verilog module named `ring_counter` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Implement a module of an 8-bit ring counter for cyclic state sequences.

Module name:
ring_counter

Input ports:
        clk: Clock signal that drives the state transitions of the ring counter.
        reset: Reset signal to initialize the counter to its starting state.

Output ports:
        out [7:0]: 8-bit output representing the current state of the ring counter. Only one bit is set high at any time, and the set bit cycles through the 8-bit output.

Internal logic:
1. State Transition: The ring counter follows a cyclic pattern where exactly one bit is set to 1 in the output at any given time, and the 1 shifts to the next bit with each clock pulse.
   
2. Initialization: When the reset signal is high, the counter is initialized to its starting state, typically with the least significant bit (LSB) of out set to 1 (i.e., out = 8'b0000_0001).

3. Cycling Behavior: On each rising edge of the clock signal, the 1 shifts to the next bit in the sequence, and after reaching the most significant bit (MSB), it wraps around to the LSB, creating a cyclic sequence.

Reset Behavior: When reset is high, the ring counter is reset to its initial state (out = 8'b0000_0001).

Give me the complete code.

---

## Files

Edit: `ring_counter.v`. Only these files are graded.

## Interface of `ring_counter`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `out` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v ring_counter.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
