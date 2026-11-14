module dut
(
  input clock,
  input a,
  output reg p,
  output reg q
);


  always @(negedge clock) q <= a;


  always @(posedge clock) p <= a;


endmodule
