module mg_09739 (input clk,input rst,output reg [7:0] LED,input [31:0] addr_b,input [31:0] data_b_in,input [31:0] data_b_we);
always @(posedge clk) 
  if (~rst) begin 
  LED <= 0; 
  end else begin 
  if (addr_b == 65540) 
  LED <= data_b_in[7:0]; 
  end 
 endmodule