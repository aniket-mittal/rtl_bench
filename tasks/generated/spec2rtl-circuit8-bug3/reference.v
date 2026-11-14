module dut
(
  input clock,
  input a,
  output reg p,
  output reg q
);


  always @(negedge clock) q <= a;


  always @(*) if(clock) p = a; 
  else p = 1'b0;


endmodule
