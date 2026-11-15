module mg_08958(input clk,input rst,input [13:0] divider,output reg snd);
reg [18:0] counter; 
  always @(posedge clk) begin 
  if(rst == 1) begin 
  snd <= 0; 
  counter <= 0; 
  end 
  if(counter == 0) begin 
  counter <= {divider,5'b0}; 
  if(divider != 0) 
  snd <= ~snd; 
  end 
  else 
  counter <= counter - 1; 
  end 
 endmodule