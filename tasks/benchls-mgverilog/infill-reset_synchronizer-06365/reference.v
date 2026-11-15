module mg_06365(input clk,input rst_i,output reg rst_o);
reg [6:0] counter_r; 
  reg rst_i_sync_0; 
  reg rst_i_sync_1; 
  initial begin 
  rst_o <= 1'b0; 
  counter_r <= 7'b0; 
  end 
  always @(posedge clk) begin 
  rst_i_sync_0 <= rst_i; 
  rst_i_sync_1 <= rst_i_sync_0; 
  if (rst_o != rst_i_sync_1) begin 
  counter_r <= counter_r + 7'b1; 
  end 
  else begin 
  counter_r <= 7'b0; 
  end 
  if (counter_r == 7'h7F) begin 
  rst_o <= ~rst_o; 
  end 
  else begin 
  rst_o <= rst_o; 
  end 
  end 
 endmodule