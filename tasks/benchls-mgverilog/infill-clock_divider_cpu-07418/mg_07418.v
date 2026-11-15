module mg_07418(clk,rst,SW2,clkdiv,Clk_CPU);
input wire clk, 
  rst; 
  input wire SW2; 
  output reg [31: 0] clkdiv = 0; 
  output wire Clk_CPU; 
  [MASKED] 
  assign Clk_CPU = SW2 ? clkdiv[24] : clkdiv[1]; 
 endmodule