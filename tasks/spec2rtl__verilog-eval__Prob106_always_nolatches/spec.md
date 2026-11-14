# Implement `TopModule` (verilog-eval: Prob106_always_nolatches)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

I would like you to implement a module named TopModule with the following
interface. All input and output ports are one bit unless otherwise
specified.

 - input  scancode (16 bits)
 - output left
 - output down
 - output right
 - output up

The module should process scancodes from a PS/2 keyboard for a game.
Given the last two bytes of scancodes received, you need to indicate
whether one of the arrow keys on the keyboard have been pressed. This
involves a fairly simple mapping, which can be implemented as a case
statement (or if-elseif) with four cases.

  Scancode[15:0] | Arrow key
  16'he06b       | left arrow
  16'he072       | down arrow
  16'he074       | right arrow
  16'he075       | up arrow
  Anything else  | none

Your circuit has one 16-bit input, and four outputs. Build this circuit
that recognizes these four scancodes and asserts the correct output.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `scancode` | in | 16 |  |
| `left` | out | 1 | |
| `down` | out | 1 | |
| `right` | out | 1 | |
| `up` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
