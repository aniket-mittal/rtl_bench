# Implement `LIFObuffer` (RTLLM: LIFObuffer)

Create `LIFObuffer.v` containing a Verilog module named `LIFObuffer` that implements the design described below, with exactly the ports the description lists (same names, directions and widths).

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Design description

Please act as a professional Verilog designer.

A Last-In-First-Out (LIFO) buffer for temporary data storage. This 4-bit wide buffer can hold up to 4 entries, allowing for push and pop operations controlled by read/write (RW) signals.

Module name:
    LIFObuffer

Input ports:
    dataIn [3:0]: 4-bit input data to be pushed onto the buffer.
    RW: Read/Write control signal (1 for read, 0 for write).
    EN: Enable signal to activate buffer operations.
    Rst: Active high reset signal to initialize the buffer.
    Clk: Clock signal for synchronous operations.

Output ports:
    EMPTY: Flag indicating whether the buffer is empty.
    FULL: Flag indicating whether the buffer is full.
    dataOut [3:0]: 4-bit output data retrieved from the buffer.

Implementation:
    The buffer uses a stack memory array (stack_mem) to store the data. A stack pointer (SP) tracks the current position in the stack.
    On the rising edge of the clock (Clk), if the enable (EN) signal is high:
    If the reset (Rst) signal is high, the stack is cleared, the stack pointer is set to 4 (indicating an empty buffer), and all memory locations are initialized to 0.
    If the reset signal is low, the buffer checks if it is full or empty and processes data accordingly:
    If RW is low (write operation) and the buffer is not full, data from dataIn is pushed onto the stack, and the stack pointer is decremented.
    If RW is high (read operation) and the buffer is not empty, data is popped from the stack into dataOut, the corresponding stack memory is cleared, and the stack pointer is incremented.
    Flags for EMPTY and FULL are updated based on the stack pointer status.

Give me the complete code.

---

## Files

Edit: `LIFObuffer.v`. Only these files are graded.

## Interface of `LIFObuffer`

| port | dir | width | note |
|---|---|---|---|
| `Clk` | in | 1 | clock, rising edge |
| `dataIn` | in | 4 |  |
| `RW` | in | 1 |  |
| `EN` | in | 1 |  |
| `Rst` | in | 1 | reset, active high |
| `EMPTY` | out | 1 | |
| `FULL` | out | 1 | |
| `dataOut` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v LIFObuffer.v && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
