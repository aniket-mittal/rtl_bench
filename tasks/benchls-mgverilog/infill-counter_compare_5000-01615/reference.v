module mg_01615(input clk, input reset, input in, output p);
reg [13-1:0] r; 
  always @(posedge clk or posedge reset) begin 
  if(reset) 
  r <= 0; 
  else begin 
  if(r) 
  r <= r + 13'b1; 
  if(in) 
  r <= 1; 
  end 
  end 
  assign p = r == 5000; 
 endmodule