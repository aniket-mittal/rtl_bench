module mg_10019 (input clk,input reset,input sync,input [15:0]len,output [15:0]size,input start,input stop,output reg running);
reg [15:0]cnt; 
  wire timeout = cnt == len; 
  always @(posedge clk or posedge reset) 
  begin 
  if (reset) running <= 0; 
  else if (sync) 
  begin 
  if (stop || timeout) running <= 0; 
  else if (start) running <= 1; 
  end 
  end 
  always @(posedge clk or posedge reset) 
  begin 
  if (reset) cnt <= 0; 
  else if (sync) 
  begin 
  if (running) cnt <= cnt + 1; 
  else if (start) cnt <= 0; 
  end 
  end 
  assign size = cnt; 
 endmodule