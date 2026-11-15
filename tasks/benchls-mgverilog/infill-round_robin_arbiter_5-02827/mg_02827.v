module mg_02827(input sys_clk,input sys_rst,input [4:0] req,output [2:0] gnt);
reg [2:0] state; 
 reg [2:0] next_state; 
 assign gnt = state; 
 always @(posedge sys_clk) begin 
  if(sys_rst) 
  state <= 3'd0; 
  else 
  state <= next_state; 
 end 
 [MASKED] 
 endmodule