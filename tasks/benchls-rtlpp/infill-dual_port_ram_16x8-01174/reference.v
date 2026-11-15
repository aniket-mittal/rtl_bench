module rtlpp_01174   
      (clk, we, a, dpra, di, dpo); 

parameter addr_width = 4;
parameter data_width = 8;
parameter depth = 16;

input clk;   
input we;   
input  [addr_width-1:0] a;   
input  [addr_width-1:0] dpra;   
input  [data_width-1:0] di;   

output [data_width-1:0] dpo;   
reg    [data_width-1:0] ram [depth-1:0]; 

reg  [data_width-1:0] dpo;   

always @(posedge clk) begin   
  if (we)   
    ram[a] <= di;   
end   

always @(*) begin
  dpo = ram[dpra];   
end

endmodule