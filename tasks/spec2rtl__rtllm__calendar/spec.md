# Implement `calendar` (RTLLM: calendar)

Create `calendar.v` containing a Verilog module named `calendar` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a module of perpetual calendar. The starting value of Secs, Mins, and Hours are all 0. Both Secs and Mins loop continuously from 0 to 59. When Secs=59, Min increases by 1 at the next cycle, and when Min=59 && Secs=59, Hours increases by 1 at the next cycle. Hours is counted from the 0-23 cycle.

Module name:  
    calendar  
                 
Input ports:
    CLK: Clock input
    RST: Active high reset signal

Output ports:
    Hours: 6-bit output representing the current hours
    Mins: 6-bit output representing the current minutes
    Secs: 6-bit output representing the current seconds

Implementation:
The calendar module uses three always blocks to update the values of seconds, minutes, and hours based on the clock signal and reset signal.
The first always block triggers on the positive edge of the clock signal (posedge CLK) or the positive edge of the reset signal (posedge RST). It checks if the reset signal is active (RST) and sets the seconds value (Secs) to 0. If the seconds value is 59, it wraps around and sets the seconds value to 0. Otherwise, it increments the seconds value by 1.
The second always block also triggers on the positive edge of the clock signal or the positive edge of the reset signal. It handles the minutes value (Mins). If the reset signal is active, it sets the minutes value to 0. If both the minutes and seconds values are 59, it wraps around and sets the minutes value to 0. If the seconds value is 59, it increments the minutes value by 1. Otherwise, it keeps the minutes value unchanged.
The third always block triggers on the positive edge of the clock signal or the positive edge of the reset signal. It handles the hours value (Hours). If the reset signal is active, it sets the hours value to 0. If the hours, minutes, and seconds values are all at their maximum (23, 59, and 59 respectively), it wraps around and sets the hours value to 0. If the minutes and seconds values are both 59, it increments the hours value by 1. Otherwise, it keeps the hours value unchanged.

Give me the complete code.

---

## Files

Edit: `calendar.v`. Only these files are graded.

## Interface of `calendar`

| port | dir | width | note |
|---|---|---|---|
| `CLK` | in | 1 | clock, rising edge |
| `RST` | in | 1 | reset, active high |
| `Hours` | out | 6 | |
| `Mins` | out | 6 | |
| `Secs` | out | 6 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v calendar.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
