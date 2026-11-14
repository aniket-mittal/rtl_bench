module mg_06266(input clk,input rst,input [10:0] x,input [10:0] y,input [10:0] poX,input [10:0] poY,output reg wing,output reg body);
parameter pL = 40; 
 parameter pW = 10; 
 parameter wL = 15; 
 parameter wW = 15; 
 parameter wP = 10; 
 always@(posedge clk, posedge rst) 
 begin 
  if(rst) body <= 0; 
  else begin 
  if(x < poX+pL && x > poX && y < poY+wL+pW && y >poY+wL) body <= 1; 
  else body <= 0; 
  end 
 end 
 [MASKED] 
 endmodule