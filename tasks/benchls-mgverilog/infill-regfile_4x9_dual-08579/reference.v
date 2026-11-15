module mg_08579(rst, clk, wr_en, rd0_addr, rd1_addr, wr_addr, wr_data,rd0_data, rd1_data);
input rst, clk, wr_en; 
  input [1:0] rd0_addr, rd1_addr, wr_addr; 
  input signed [8:0] wr_data; 
  output signed [8:0] rd0_data, rd1_data; 
  integer i; 
  reg signed [8:0] registers [3:0]; 
  assign rd0_data = registers[rd0_addr]; 
  assign rd1_data = registers[rd1_addr]; 
  always@(posedge clk, posedge rst) begin 
  if(rst) for(i = 0; i < 4; i=i+1) registers[i] = 0; 
  else if(wr_en) registers[wr_addr] = wr_data; 
  end 
 endmodule