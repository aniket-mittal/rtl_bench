module mg_07000 (input rd_en,input wr_en,input rst_n,input clk,output reg_en,output reg_wr_en);
wire c_rd_en; 
  wire c_wr_en; 
  assign reg_en = c_wr_en | c_rd_en; 
  assign reg_wr_en = c_wr_en; 
  reg [2:0] rden, wren; 
 always @ ( posedge clk or negedge rst_n) begin 
  if(!rst_n) begin 
  rden <= 3'b0; 
  wren <= 3'b0; 
  end 
  else begin 
  rden <= {rden[1:0], rd_en}; 
  wren <= {wren[1:0], wr_en}; 
  end 
 end 
 assign c_rd_en = rden[1] & ~rden[2]; 
 assign c_wr_en = wren[1] & ~wren[2]; 
 endmodule