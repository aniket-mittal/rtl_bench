module mg_03863(input wire prev,input wire req,output reg next,input wire loop_in,output reg loop_out);
[MASKED] 
  always @* 
  begin 
  next = req ? loop_in : 1'b0; 
  end 
 endmodule