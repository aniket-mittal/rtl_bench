module dut
(
  input clk,
  input w,
  input R,
  input E,
  input L,
  output reg Q
);


  always @(posedge clk) if(L) Q <= R & w; 
  else if(E) Q <= w; 


endmodule
