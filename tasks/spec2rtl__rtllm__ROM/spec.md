# Implement `ROM` (RTLLM: ROM)

Create `ROM.v` containing a Verilog module named `ROM` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

A Read-Only Memory (ROM) module designed for storing fixed data. This module provides a way to access predefined data based on an 8-bit address input.

Module name:
    ROM

Input ports:
    addr [7:0]: 8-bit address input used to select the data location in memory.

Output ports:
    dout [15:0]: 16-bit output that delivers the data stored in the ROM at the specified address.
Memory Array:
    reg [15:0] mem [0:255]: Defines a ROM with 256 locations, each 16 bits wide.
Initial Block:
    The initial block is used to pre-load the ROM with fixed data. In this example, memory locations 0 through 3 are initialized with specific values (16'hA0A0, 16'hB1B1, 16'hC2C2, 16'hD3D3). Other locations can be initialized as needed.
Behavior:
    The always @(*) block continuously outputs the data stored in the ROM at the memory location specified by addr.
Since ROM is read-only, this module includes only read operations.

Give me the complete code.

---

## Files

Edit: `ROM.v`. Only these files are graded.

## Interface of `ROM`

| port | dir | width | note |
|---|---|---|---|
| `addr` | in | 8 |  |
| `dout` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v ROM.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
