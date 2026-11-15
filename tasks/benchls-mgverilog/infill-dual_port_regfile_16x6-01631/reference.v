module mg_01631 (input h_reset_n,input we,input h_hclk,input clk,input clk_en,input [3:0] addr1,input [3:0] addr2,input [5:0] din,output reg [5:0] dout1,output reg [5:0] dout2);
reg [5:0] storage[15:0]; 
  integer i; 
  always @(posedge h_hclk or negedge h_reset_n) 
  if (!h_reset_n) begin 
  for (i = 0; i < 16; i = i + 1) storage[i] <= 6'b0; 
  end else begin 
  if (we) storage[addr1] <= din; 
  dout1 <= storage[addr1]; 
  end 
  always @(posedge clk or negedge h_reset_n) 
  if (!h_reset_n) dout2 <= 6'b0; 
  else if(clk_en) dout2 <= storage[addr2]; 
 endmodule