# Implement `TopModule` (verilog-eval: Prob105_rotate100)

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
 - input  load
 - input  ena  (  2 bits)
 - input  data (100 bits)
 - output q    (100 bits)

The module should implement a 100-bit left/right rotator, with
synchronous load and left/right enable. A rotator shifts-in the
shifted-out bit from the other end of the register, unlike a shifter that
discards the shifted-out bit and shifts in a zero. If enabled, a rotator
rotates the bits around and does not modify/discard them.

  (1) load: Loads shift register with data[99:0] instead of rotating.
      Synchronous active high.

  (2) ena[1:0]: Synchronous. Chooses whether and which direction to
      rotate:
      (a) 2'b01 rotates right by one bit,
      (b) 2'b10 rotates left by one bit,
      (c) 2'b00 and 2'b11 do not rotate.

  (3) q: The contents of the rotator.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `load` | in | 1 |  |
| `ena` | in | 2 |  |
| `data` | in | 100 |  |
| `q` | out | 100 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
