module mg_08652 (en,clk,din,pre_first_in,y_out,yaddr,ywe,pre_first_out);
input en; 
  input clk; 
  input [7:0] din; 
  input pre_first_in; 
  output [7:0] y_out; 
  output [7:0] yaddr; 
  output ywe; 
  output pre_first_out; 
  wire pre_first_out= pre_first_in; 
  wire [7:0] y_out= {~din[7],din[6:0]}; 
  reg [7:0] yaddr_cntr; 
  reg ywe; 
  wire [7:0] yaddr= {yaddr_cntr[4],yaddr_cntr[7:5],yaddr_cntr[0],yaddr_cntr[3:1]}; 
  [MASKED] 
 endmodule