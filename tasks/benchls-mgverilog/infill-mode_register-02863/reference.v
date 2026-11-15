module mg_02863(output mode,input clk,input modet,input in);
reg modereg = 0; 
  assign mode = modereg; 
  always@(posedge clk) begin 
  if(modet) 
  modereg = in; 
  end 
 endmodule