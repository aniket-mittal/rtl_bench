module mg_00100(clk, rst, button, LED);
input clk, rst, button; 
 output LED; 
 reg flagButton; 
 reg LED; 
 reg [24:0]delayButton; 
 always@(posedge clk) 
 begin 
  if(!rst) 
  begin 
  LED = 1'b0; 
  flagButton = 1'b0; 
  delayButton = 25'd0; 
  end 
  else 
  begin 
  if((!button)&&(!flagButton)) flagButton = 1'b1; 
  else if(flagButton) 
  begin 
  delayButton = delayButton + 1'b1; 
  if(delayButton == 25'b1000000000000000000000000) 
  begin 
  flagButton = 1'b0; 
  delayButton = 25'd0; 
  LED = 1'b1; 
  end 
  end 
  else LED = 1'b0; 
  end 
 end 
 endmodule