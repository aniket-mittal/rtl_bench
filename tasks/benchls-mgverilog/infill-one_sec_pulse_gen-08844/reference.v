module mg_08844 (input wire clk,input wire reset,output wire time_out);
reg [24:0] clk_number; 
  reg [0:0] sec_kp; 
  assign time_out = sec_kp; 
  always @(posedge clk) 
  begin 
  if (!reset) 
  begin 
  clk_number <= 25'd0; 
  sec_kp <= 1'd0; 
  end 
  else 
  begin 
  if (clk_number <= 25'd25000000) 
  clk_number <= clk_number + 25'd1; 
  else 
  clk_number <= 25'd0; 
  if (clk_number > 25'd12500000) 
  sec_kp <= 1'd1; 
  else 
  sec_kp <= 1'd0; 
  end 
  end 
 endmodule