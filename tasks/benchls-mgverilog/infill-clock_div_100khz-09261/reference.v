module mg_09261(clk,rst_n,out_100kHz);
input clk,rst_n; 
 output reg out_100kHz; 
 reg [15:0] counter; 
 always @ (posedge clk or negedge rst_n) 
  if (!rst_n) 
  begin 
  out_100kHz <= 0; 
  counter <= 0; 
  end 
  else 
  if (counter == 16'd499) 
  begin 
  out_100kHz <= !out_100kHz; 
  counter <= 0; 
  end 
  else 
  begin 
  out_100kHz <= out_100kHz; 
  counter <= counter + 1; 
  end 
 endmodule