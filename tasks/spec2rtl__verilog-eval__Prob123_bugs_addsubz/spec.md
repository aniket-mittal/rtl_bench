# Implement `TopModule` (verilog-eval: Prob123_bugs_addsubz)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

Consider the following adder-subtractor with a zero flag:

  synthesis verilog_input_version verilog_2001
  module TopModule (
      input do_sub,
      input [7:0] a,
      input [7:0] b,
      output reg [7:0] out,
      output reg result_is_zero
  );

      always @(*) begin
          case (do_sub)
            0: out = a+b;
            1: out = a-b;
          endcase

          if (~out)
              result_is_zero = 1;
      end

  endmodule

Unfortunately, this module has a bug. Implement a new version of this
module that fixes the bug.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `do_sub` | in | 1 |  |
| `a` | in | 8 |  |
| `b` | in | 8 |  |
| `out` | out | 8 | |
| `result_is_zero` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
