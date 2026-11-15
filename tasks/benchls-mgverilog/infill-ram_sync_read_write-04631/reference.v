module mg_04631 (input clk_i,input rst_i,input [ 7:0] addr_i,input [ 19:0] data_i,input wr_i,output [ 19:0] data_o);
reg [19:0] ram [255:0] ; 
 reg [19:0] ram_read_q; 
 always @ (posedge clk_i) 
 begin 
  if (wr_i) 
  ram[addr_i] <= data_i; 
  ram_read_q <= ram[addr_i]; 
 end 
 assign data_o = ram_read_q; 
 endmodule