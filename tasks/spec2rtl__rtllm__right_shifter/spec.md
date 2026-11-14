# Implement `right_shifter` (RTLLM: right_shifter)

Create `right_shifter.v` containing a Verilog module named `right_shifter` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement a right shifter. The module performs an 8-bit right shift on a 1-bit input by first initializing the q register to 0. On each rising edge of the clock, the module shifts the contents of the q register to the right by one bit and inserts the new input bit d into the most significant position of the register.

Module name:  
    right_shifter    

Input ports:
    clk: Clock signal used for synchronous operation.
    d: Input signal to be right-shifted.

Output ports:
    q: Output signal representing the result of the right shift operation.

Implementation:
The register is defined as reg [7:0] q and initialized to 0 using the initial statement. The value of q is right-shifted by 1 bit using the >> operator: q <= (q >> 1).
The most significant bit (q[7]) of the register is assigned the value of the input signal (d): q[7] <= d.

Give me the complete code.

---

## Files

Edit: `right_shifter.v`. Only these files are graded.

## Interface of `right_shifter`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `d` | in | 1 |  |
| `q` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v right_shifter.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
