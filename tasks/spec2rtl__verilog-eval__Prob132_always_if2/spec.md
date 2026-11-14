# Implement `TopModule` (verilog-eval: Prob132_always_if2)

Create `TopModule.sv` containing a module named `TopModule` that does what the problem below asks, with exactly the interface it gives. Verilog-2005 or SystemVerilog is fine.

## Rules

- Write synthesizable code that iverilog (`-g2012`) and yosys can compile.
- Keep the module name and every port name, direction and width exactly as specified. You may add helper modules in the same file.
- Grading simulates your design against a hidden reference and checks formal equivalence with it. Only behavior at the top-module ports counts.

## Problem

Consider the following adder-subtractor with a zero flag:

  module TopModule (
      input      cpu_overheated,
      output reg shut_off_computer,
      input      arrived,
      input      gas_tank_empty,
      output reg keep_driving
  );

      always @(*) begin
          if (cpu_overheated)
             shut_off_computer = 1;
      end

      always @(*) begin
          if (~arrived)
             keep_driving = ~gas_tank_empty;
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
| `cpu_overheated` | in | 1 |  |
| `arrived` | in | 1 |  |
| `gas_tank_empty` | in | 1 |  |
| `shut_off_computer` | out | 1 | |
| `keep_driving` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
