# Implement `TopModule` (verilog-eval: Prob104_mt2015_muxdff)

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
 - input  L
 - input  q_in
 - input  r_in
 - output Q

Consider this Verilog module "full_module":

  module full_module (
      input [2:0] r,
      input L,
      input clk,
      output reg [2:0] q);

    always @(posedge clk) begin
      if (L) begin
        q <= r;
      end else begin
        q <= {q[1] ^ q[2], q[0], q[2]};
      end
    end

  endmodule

Note that q[2:0] is three bits wide, representing three flip-flops that can be
loaded from r when L is asserted. You want to factor full_module into a hierarchical
design, flipflop and 2:1 multiplexer are in a submodule "TopModule", and that submodule
will be instantiated three times in full_module code. Create the submodule called "TopModule".
You do not have to provide the revised full_module.

---

## Files

Edit: `TopModule.sv`. Only these files are graded.

## Interface of `TopModule`

| port | dir | width | note |
|---|---|---|---|
| `clk` | in | 1 | clock, rising edge |
| `L` | in | 1 |  |
| `q_in` | in | 1 |  |
| `r_in` | in | 1 |  |
| `Q` | out | 1 | |

## Testing

    iverilog -g2012 -s tb -o sim public_tb.v TopModule.sv && vvp sim

It prints `PASS` or the mismatching cycles. Grading also runs hidden tests and a Yosys formal
equivalence check against the reference, so passing the public tests is not enough on its own.
