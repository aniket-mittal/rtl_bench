# Implement `fsm` (RTLLM: fsm)

Create `fsm.v` containing a Verilog module named `fsm` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a Mealy FSM detection circuit that detects a single-bit input IN. When the input is 10011, output MATCH is 1, and MATCH is 0 in other cases. Support for continuous input and loop detection. 

Module name:  
    fsm               
Input ports:
    IN: Input signal to the FSM.
    CLK: Clock signal used for synchronous operation.
    RST: Reset signal to initialize the FSM.
Output ports:
    MATCH: Output signal indicating a match condition based on the FSM state.

Implementation:
The module implements an FSM detection.
On every change in the input signal (IN) or positive edge of CLK or RST, if RST is active, the output signal MATCH is set to 0.
If the sequence of inputs IN is 1, 0, 0, 1, 1, the MATCH signal is 1 at the same time as the last occurrence of IN=1. If the sequence of inputs IN is 1, 0, 0, 1, 1, 0, 0, 1, 1, the MATCH signal becomes 1 at the fifth and ninth of IN; otherwise, it is set to 0.

Give me the complete code.

---

## Files

Edit: `fsm.v`. Only these files are graded.

## Interface of `fsm`

| port | dir | width | note |
|---|---|---|---|
| `CLK` | in | 1 | clock, rising edge |
| `IN` | in | 1 |  |
| `RST` | in | 1 | reset, active high |
| `MATCH` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v fsm.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
