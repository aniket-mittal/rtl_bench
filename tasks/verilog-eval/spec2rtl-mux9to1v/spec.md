# Implement `TopModule` (verilog-eval: Prob097_mux9to1v)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  a   (16 bits)
 - input  b   (16 bits)
 - input  c   (16 bits)
 - input  d   (16 bits)
 - input  e   (16 bits)
 - input  f   (16 bits)
 - input  g   (16 bits)
 - input  h   (16 bits)
 - input  i   (16 bits)
 - input  sel ( 4 bits)
 - output out (16 bits)

The module should implement a 16-bit wide, 9-to-1 multiplexer. sel=0
chooses a, sel=1 chooses b, etc. For the unused cases (sel=9 to 15), set
all output bits to '1'.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `a` | in | 16 |  |
| `b` | in | 16 |  |
| `c` | in | 16 |  |
| `d` | in | 16 |  |
| `e` | in | 16 |  |
| `f` | in | 16 |  |
| `g` | in | 16 |  |
| `h` | in | 16 |  |
| `i` | in | 16 |  |
| `sel` | in | 4 |  |
| `out` | out | 16 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
