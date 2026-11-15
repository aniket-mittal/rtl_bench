module mg_05160 (input clk,input rst,input[4:0] rd_addr_1,input[4:0] rd_addr_2,output[31:0] rd_data_1,output[31:0] rd_data_2,input[4:0] wr_addr,input wr_en,input[31:0] wr_data);
reg[31:0] greg[31:1]; 
  integer i; 
  assign rd_data_1= rd_addr_1==5'd0 ? 32'd0 : greg[rd_addr_1]; 
  assign rd_data_2= rd_addr_2==5'd0 ? 32'd0 : greg[rd_addr_2]; 
  generate 
  genvar gi; 
  for(gi=1;gi<32;gi=gi+1) 
  begin:gen 
  always @(posedge clk) 
  if(rst) 
  greg[gi]<=32'd0; 
  else 
  greg[gi]<= wr_en & wr_addr==gi ? wr_data : greg[gi]; 
  end 
  endgenerate 
 endmodule