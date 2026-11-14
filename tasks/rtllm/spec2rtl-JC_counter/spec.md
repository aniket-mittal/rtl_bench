# Implement `JC_counter` (RTLLM: JC_counter)

Create `JC_counter.v` containing a Verilog module named `JC_counter` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a 64-bit Johnson counter (torsional ring counter), and the state of the similar 4-bit Johnson counter example is as follows: 0000, 1000, 1100, 1110, 1111, 0111, 0011, 0001, 0000.

Module name:  
    JC_counter               
Input ports:
    clk: Clock signal used for synchronous operation.
    rst_n: Active-low reset signal to initialize the counter.
Output port:
    Q: 64-bit register representing the current count value.

Implementation:
On every rising edge of the clock signal (clk) or the falling edge of the reset signal (rst_n), the counter value is updated.
If the reset signal (rst_n) is low, indicating a reset condition, the counter value (Q) is set to 0.
Otherwise, if the least significant bit (Q[0]) is 0, the counter increments by shifting the current value (Q[63:1]) to the right and appending a 1 at the most significant bit position.
If the least significant bit (Q[0]) is 1, the counter decrements by shifting the current value (Q[63:1]) to the right and appending a 0 at the most significant bit position.

Give me the complete code.

---

## Files

Edit: `JC_counter.v`. Only these files are graded.

## Interface of `JC_counter`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `Q` | out | 64 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v JC_counter.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
