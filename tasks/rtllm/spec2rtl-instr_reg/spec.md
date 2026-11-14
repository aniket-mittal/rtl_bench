# Implement `instr_reg` (RTLLM: instr_reg)

Create `instr_reg.v` containing a Verilog module named `instr_reg` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

An instruction register module designed to hold and process CPU instructions. It captures incoming instructions from various sources and separates them into distinct fields for further processing.

Module name:
    instr_reg

Input ports:
    clk: Clock signal for synchronization.
    rst: Active low reset signal to initialize the register.
    fetch [1:0]: Control signal indicating the source of the instruction (1 for register, 2 for RAM/ROM).
    data [7:0]: 8-bit data input representing the instruction to be fetched.

Output ports:
    ins [2:0]: High 3 bits of the instruction, indicating the opcode or operation.
    ad1 [4:0]: Low 5 bits of the instruction, representing the register address.
    ad2 [7:0]: The full 8-bit data from the second source.

Implementation:
    The instruction register contains two 8-bit registers (ins_p1 and ins_p2) to store instructions from different sources.
    On the rising edge of the clock (clk), if the reset (rst) signal is low, both registers are initialized to zero.
    Based on the fetch signal:
    If fetch is 2'b01, the instruction is fetched from the data input into ins_p1.
    If fetch is 2'b10, the instruction is fetched from the data input into ins_p2.
    If neither condition is met, the previous values in both registers are retained.
    The outputs ins, ad1, and ad2 are derived from the stored instructions.


Give me the complete code.

---

## Files

Edit: `instr_reg.v`. Only these files are graded.

## Interface of `instr_reg`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `rst` | in | 1 | reset, active high |
| `fetch` | in | 2 |  |
| `data` | in | 8 |  |
| `ins` | out | 3 | |
| `ad1` | out | 5 | |
| `ad2` | out | 8 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v instr_reg.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
