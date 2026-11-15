module mg_06881(input wire [ 7 : 0] address,input wire [ 7 : 0] data_in,input wire clk,input wire write_enable,output reg [ 7 : 0] data_out);
reg [ 7 : 0] memory [255 : 0]; 
  always @(posedge clk) begin 
  if(write_enable) 
  memory[address] <= data_in; 
  data_out <= memory[address]; 
  end 
 endmodule