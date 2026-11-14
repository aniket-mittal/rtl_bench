module dut
(
  input clock,
  input a,
  output reg p,
  output reg q
);


  always @(posedge clock) q <= a;


  always @(*) if(clock) p = a; 


endmodule
