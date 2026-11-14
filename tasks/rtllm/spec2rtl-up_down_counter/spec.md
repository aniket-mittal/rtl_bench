# Implement `up_down_counter` (RTLLM: up_down_counter)

Create `up_down_counter.v` containing a Verilog module named `up_down_counter` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

Module name: 
    up_down_counter

Function:
    A 16-bit counter that can increment or decrement based on control signals.

Input ports:
    clk: Clock signal (1-bit), used to synchronize the counting process.
    reset: Reset signal (1-bit), used to reset the counter to zero.
    up_down: Control signal (1-bit), determines the counting direction. 
             If up_down = 1, the counter increments; if up_down = 0, it decrements.

Output ports:
    count [15:0]: 16-bit output representing the current counter value.

Implementation:
    The module uses a synchronous process triggered by the rising edge of the clock signal (`clk`).
    If the reset signal (`reset`) is active, the counter resets to zero.
    If the `up_down` control signal is high, the counter increments on each clock cycle.
    If the `up_down` control signal is low, the counter decrements on each clock cycle.
    The `count` output reflects the current value of the counter, which can range from 0 to 65535.

Give me the complete code.

---

## Files

Edit: `up_down_counter.v`. Only these files are graded.

## Interface of `up_down_counter`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `reset` | in | 1 | reset, active high |
| `up_down` | in | 1 |  |
| `count` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v up_down_counter.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
