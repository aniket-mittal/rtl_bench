module mg_00271(input reset, input wire in_clk,output reg out_clk, input [7:0] ratio);
reg [7:0] counter; 
  always @(posedge in_clk or posedge reset) 
  if(reset) 
  counter <= #1 8'd0; 
  else if(counter == 0) 
  counter <= #1 ratio[7:1] + (ratio[0] & out_clk) - 8'b1; 
  else 
  counter <= #1 counter-8'd1; 
  always @(posedge in_clk or posedge reset) 
  if(reset) 
  out_clk <= #1 1'b0; 
  else if(counter == 0) 
  out_clk <= #1 ~out_clk; 
 endmodule