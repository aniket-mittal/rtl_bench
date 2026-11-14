module dut
(
  input clk,
  input w,
  input R,
  input E,
  input L,
  output reg Q
);


  always @(posedge clk) if(L) Q <= R; 
  else if(E) Q <= w; 
  else Q <= 1'b0;


endmodule
