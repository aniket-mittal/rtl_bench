# Implement `traffic_light` (RTLLM: traffic_light)

Create `traffic_light.v` containing a Verilog module named `traffic_light` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a traffic light, with red, yellow and green three small indicators and a pedestrian button, under normal circumstances, the motor vehicle lane indicator light according to 60 clock cycles of green, 5 clock cycles of yellow, 10 clock cycles of red. When the pedestrian button is pressed, if the remaining green time is greater than 10 clocks, it is shortened to 10 clocks, and if it is less than 10 clocks, it remains unchanged. The lane light and the sidewalk light should be paired, when the lane light is green or yellow, the sidewalk light is red; When the lane light is red, the sidewalk light is green, and for the sake of simplicity, only the lane light is considered.

Module name:  
    traffic_light

Inputs:
    rst_n: Reset signal (active low).
    clk: Clock signal.
    pass_request: Request signal for allowing vehicles to pass.

Outputs:
    clock[7:0]: An 8-bit output representing the count value of the internal counter.
    red, yellow, green: Output signals representing the state of the traffic lights.

Parameters:
    idle, s1_red, s2_yellow, s3_green: Enumeration values representing different states of the traffic light controller.

Registers and Wires:
    cnt: A 8-bit register used as an internal counter for timing purposes.
    state: A 2-bit register representing the current state of the traffic light controller.
    p_red, p_yellow, p_green: 1-bit registers representing the next values for the red, yellow, and green signals.

Implementation:
The following is the design track we recommend:
The first always block is responsible for the state transition logic. It uses a case statement to handle different states. Here's a summary of each state:
idle: Initial state where all signals are set to 0. Transition to s1_red state occurs immediately.
s1_red: Sets the red signal to 1 and waits for a count of 3 before transitioning to s3_green state. Otherwise, it remains in s1_red state.
s2_yellow: Sets the yellow signal to 1 and waits for a count of 3 before transitioning to s1_red state. Otherwise, it remains in s2_yellow state.
s3_green: Sets the green signal to 1 and waits for a count of 3 before transitioning to s2_yellow state. Otherwise, it remains in s3_green state.
The second always block handles the counting logic of the internal counter (cnt). The counter is decremented by 1 on every positive edge of the clock or negative edge of the reset signal. The counter values are adjusted based on various conditions:
If (!rst_n), the counter is set to 10.
If the pass_request signal is active and the green signal is active, the counter is set to 10.
If the green signal is inactive and the previous green signal (p_green) was active, the counter is set to 60.
If the yellow signal is inactive and the previous yellow signal (p_yellow) was active, the counter is set to 5.
If the red signal is inactive and the previous red signal (p_red) was active, the counter is set to 10.
Otherwise, the counter is decremented normally.
The assign statement assigns the value of the internal counter (cnt) to the output clock.
The final always block handles the output signals. It assigns the previous values (p_red, p_yellow, p_green) to the output signals (red, yellow, green) on the positive edge of the clock or negative edge of the reset signal.

Give me the complete code.

---

## Files

Edit: `traffic_light.v`. Only these files are graded.

## Interface of `traffic_light`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst_n` | in | 1 | reset, active low |
| `pass_request` | in | 1 |  |
| `clock` | out | 8 | |
| `red` | out | 1 | |
| `yellow` | out | 1 | |
| `green` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v traffic_light.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
