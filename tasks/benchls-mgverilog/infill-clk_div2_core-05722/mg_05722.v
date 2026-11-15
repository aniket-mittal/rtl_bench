module mg_05722(input clk_i,output reg clk_core,output clk_bus);
assign clk_bus = clk_i; 
  initial begin 
  clk_core <= 1'b0; 
  end 
  [MASKED] 
 endmodule