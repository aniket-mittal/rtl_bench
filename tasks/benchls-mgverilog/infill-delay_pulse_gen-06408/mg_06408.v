module mg_06408 (input clk,input reset,input sync,input [5:0]del,input in,output out);
reg running; 
  reg [5:0]cnt; 
  wire start = in && !running; 
  wire stop = cnt == 0; 
  [MASKED] 
  assign out = running && stop; 
 endmodule