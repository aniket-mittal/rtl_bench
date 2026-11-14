module dut
(
  input clk,
  input a,
  output reg q
);


  always @(*) q = ~a;


endmodule
