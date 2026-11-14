# Implement `alu` (RTLLM: alu)

Create `alu.v` containing a Verilog module named `alu` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional verilog designer.

Implement an ALU for a 32-bit MIPS-ISA CPU. The “a” and “b” are the two operands of the ALU, the “aluc” is the opcode, and the “r” gives out the result. “zero” means if the result is zero, “carry” means if there is a carry bit, “negative” means if the result is negative, “overflow” means if the computation is overflow, the “flag” is the result of “slt” and “sltu” instructions. The supported operations and corresponding opcode are shown below:
    parameter ADD = 6'b100000;
    parameter ADDU = 6'b100001;
    parameter SUB = 6'b100010;
    parameter SUBU = 6'b100011;
    parameter AND = 6'b100100;
    parameter OR = 6'b100101;
    parameter XOR = 6'b100110;
    parameter NOR = 6'b100111;
    parameter SLT = 6'b101010;
    parameter SLTU = 6'b101011;
    parameter SLL = 6'b000000;
    parameter SRL = 6'b000010;
    parameter SRA = 6'b000011;
    parameter SLLV = 6'b000100;
    parameter SRLV = 6'b000110;
    parameter SRAV = 6'b000111;
    parameter LUI = 6'b001111;

Module name:  
    alu               
Input ports:
    a: a 32-bit input operand
    b: a 32-bit input operand
    aluc: a 6-bit control signal for selecting the operation to be performed
Output ports:
    r: a 32-bit output representing the result of the operation
    zero: a 1-bit output indicating whether the result is zero
    carry: a 1-bit output indicating whether a carry occurred during the operation
    negative: a 1-bit output indicating whether the result is negative
    overflow: a 1-bit output indicating whether an overflow occurred during the operation
    flag: a 1-bit output representing a general flag, which is set based on specific operations (SLT and SLTU)

Implementation:
The module uses parameters to define the control signals for various operations, such as ADD, SUB, AND, OR, etc. 
The module assigns the input operands to the signed wires and the output result (r) to the lower 32 bits of the register (res[31:0]). The flag output is determined based on the control signal (aluc) and is set to '1' when the operation is SLT or SLTU, and 'z' (high-impedance) otherwise. The zero output is set to '1' when the result is all zeros, and '0' otherwise.
Inside the always block, a case statement is used to perform the appropriate operation based on the control signal (aluc). The result is assigned to the register (res) accordingly. For shift operations (SLL, SRL, SRA, SLLV, SRLV, SRAV), the shift amount is determined by the value of 'a' or 'a[4:0]'. For the LUI operation, the upper 16 bits of 'a' are concatenated with 16 zeros to form the result.
If the control signal (aluc) does not match any defined operation, the result is assigned as 'z' (high-impedance).

Give me the complete code.

---

## Files

Edit: `alu.v`. Only these files are graded.

## Interface of `alu`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 32 |  |
| `b` | in | 32 |  |
| `aluc` | in | 6 |  |
| `r` | out | 32 | |
| `zero` | out | 1 | |
| `carry` | out | 1 | |
| `negative` | out | 1 | |
| `overflow` | out | 1 | |
| `flag` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v alu.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
