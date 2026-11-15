module mg_04857(input clk,input reset,input [3:0] delay,input valid,output ready);
reg [14:0] rdy_reg; 
  [MASKED] 
  always @ (posedge clk or posedge reset) begin 
  if (reset) rdy_reg <=0; 
  else if (!valid || ready) rdy_reg <=0; 
  else rdy_reg <={rdy_reg[13:0],valid}; 
  end 
 endmodule