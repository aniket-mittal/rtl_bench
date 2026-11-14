# Implement `TopModule` (verilog-eval: Prob063_review2015_shiftcount)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  clk
 - input  shift_ena
 - input  count_ena
 - input  data
 - output q (4 bits)

The module should implement a four-bit shift register that also acts as a
down counter. Data is shifted in most-significant-bit first when
shift_ena is 1. The number currently in the shift register is decremented
when count_ena is 1. Since the full system doesn't ever use shift_ena and
count_ena together, it does not matter what your circuit does if both
control inputs are 1 (this mainly means that it doesn't matter which case
gets higher priority). Assume all sequential logic is triggered on the
positive edge of the clock.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `shift_ena` | in | 1 |  |
| `count_ena` | in | 1 |  |
| `data` | in | 1 |  |
| `q` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
