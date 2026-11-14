# Implement `barrel_shifter` (RTLLM: barrel_shifter)

Create `barrel_shifter.v` containing a Verilog module named `barrel_shifter` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Module name: 
    barrel_shifter

Function:
    A barrel shifter for rotating bits efficiently. This 8-bit barrel shifter takes an 8-bit input and shifts or rotates the bits based on a 3-bit control signal.

Input ports:
    in [7:0]: 8-bit input to be shifted.
    ctrl [2:0]: 3-bit control signal that determines how many positions to shift. The control signal specifies the amount of shift, where each bit indicates a shift by 1, 2, or 4 positions.

Output ports:
    out [7:0]: 8-bit shifted output.

Implementation:
    The barrel shifter shifts the input `in` based on the value of the `ctrl` signal. The shifting happens in stages, where each stage shifts by 4, 2, or 1 position, as controlled by `ctrl[2]`, `ctrl[1]`, and `ctrl[0]`, respectively.
    The shifts are achieved using a series of 2-to-1 multiplexers (`mux2X1`) that select between the shifted input and the original input. Each stage of multiplexers performs the shift, and the result is passed to the next stage for further shifting if required.
    - When `ctrl[2]` is high, the input is shifted by 4 positions.
    - When `ctrl[1]` is high, the intermediate result is shifted by 2 positions.
    - When `ctrl[0]` is high, the intermediate result is shifted by 1 position.
    
    The `mux2X1` submodule is used to select between two input values based on the `sel` signal, determining which bit is used in the shifted output at each stage.

Give me the complete code.

---

## Files

Edit: `barrel_shifter.v`. Only these files are graded.

## Interface of `barrel_shifter`

| port | dir | width | note |
|---|---|---|---|
| `in` | in | 8 |  |
| `ctrl` | in | 3 |  |
| `out` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v barrel_shifter.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
