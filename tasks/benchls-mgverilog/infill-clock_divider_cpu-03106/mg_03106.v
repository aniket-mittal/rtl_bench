module mg_03106(input wire clk,input wire rst,input wire SW2,output reg [31:0] clkdiv,output wire Clk_CPU);
initial clkdiv <= 0; 
  [MASKED] 
  assign Clk_CPU = SW2 ? clkdiv[22] : clkdiv[1]; 
 endmodule