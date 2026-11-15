module mg_02030(input clk, input rst, output reg clk_out);
reg [25:0] counter; 
  initial 
  begin 
  counter <= 26'd0; 
  clk_out <= 1'b1; 
  end 
  always @(posedge clk or posedge rst) 
  begin 
  if(rst) 
  begin 
  counter <= 26'd0; 
  clk_out <= ~clk_out; 
  end 
  else 
  if(counter == 26'd25000000) 
  begin 
  counter <= 26'd0; 
  clk_out <= ~clk_out; 
  end 
  else 
  begin 
  counter <= counter+1; 
  end 
  end 
 endmodule