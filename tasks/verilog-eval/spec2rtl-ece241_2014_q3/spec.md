# Implement `TopModule` (verilog-eval: Prob093_ece241_2014_q3)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  c
 - input  d
 - output mux_in (4 bits)

For the following Karnaugh map, give the circuit implementation using one
4-to-1 multiplexer and as many 2-to-1 multiplexers as required, but using
as few as possible. You are not allowed to use any other logic gate and
you must use _a_ and _b_ as the multiplexer selector inputs, as shown on
the 4-to-1 multiplexer below.

      ab
  cd  00  01  11  10
  00 | 0 | 0 | 0 | 1 |
  01 | 1 | 0 | 0 | 0 |
  11 | 1 | 0 | 1 | 1 |
  10 | 1 | 0 | 0 | 1 |

Consider a block diagram with inputs 'c' and 'd' going into a module
called "TopModule". This "TopModule" has four outputs, mux_in[3:0], that
connect to a four input mux. The mux takes as input {a,b} and ab = 00 is
connected to mux_in[0], ab=01 is connected to mux_in[1], and so in. You
are implementing in Verilog just the portion labelled "TopModule", such
that the entire circuit (including the 4-to-1 mux) implements the K-map.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `c` | in | 1 |  |
| `d` | in | 1 |  |
| `mux_in` | out | 4 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
