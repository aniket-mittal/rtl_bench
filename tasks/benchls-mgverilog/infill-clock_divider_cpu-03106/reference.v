module mg_03106(input wire clk,input wire rst,input wire SW2,output reg [31:0] clkdiv,output wire Clk_CPU);
initial clkdiv <= 0; 
  always @ (posedge clk or posedge rst) begin 
  if (rst) begin 
  clkdiv <= 0; 
  end else begin 
  clkdiv <= clkdiv + 1'b1; 
  end 
  end 
  assign Clk_CPU = SW2 ? clkdiv[22] : clkdiv[1]; 
 endmodule