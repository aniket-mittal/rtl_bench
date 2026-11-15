module mg_06408 (input clk,input reset,input sync,input [5:0]del,input in,output out);
reg running; 
  reg [5:0]cnt; 
  wire start = in && !running; 
  wire stop = cnt == 0; 
  always @(posedge clk or posedge reset) 
  begin 
  if (reset) 
  begin 
  running <= 0; 
  cnt <= 0; 
  end 
  else if (sync) 
  begin 
  if (start) running <= 1; 
  else if (stop) running <= 0; 
  if (start) cnt <= del; 
  else if (!stop) cnt <= cnt - 1; 
  end 
  end 
  assign out = running && stop; 
 endmodule