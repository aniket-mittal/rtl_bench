module mg_05518(input rst,input clk,input enable,input jump,input out_enable,input [ADDRESS_WIDTH-1 : 0] bus_in,output [ADDRESS_WIDTH-1 : 0] bus_out);
parameter ADDRESS_WIDTH = 4; 
  reg [ADDRESS_WIDTH-1 : 0] counter; 
  assign bus_out = (out_enable) ? counter : 0; 
  [MASKED] 
 endmodule