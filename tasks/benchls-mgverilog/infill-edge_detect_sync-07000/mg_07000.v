module mg_07000 (input rd_en,input wr_en,input rst_n,input clk,output reg_en,output reg_wr_en);
wire c_rd_en; 
  wire c_wr_en; 
  assign reg_en = c_wr_en | c_rd_en; 
  assign reg_wr_en = c_wr_en; 
  reg [2:0] rden, wren; 
 [MASKED] 
 assign c_rd_en = rden[1] & ~rden[2]; 
 assign c_wr_en = wren[1] & ~wren[2]; 
 endmodule