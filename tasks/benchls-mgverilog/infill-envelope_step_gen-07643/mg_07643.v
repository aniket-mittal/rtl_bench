module mg_07643(input [2:0] state_V,input [5:0] rate_V,input [2:0] cnt_V,output reg step_V);
localparam ATTACK=3'd0, DECAY1=3'd1, DECAY2=3'd2, RELEASE=3'd7, HOLD=3'd3; 
 reg [7:0] step_idx; 
 reg [7:0] step_ram; 
 [MASKED] 
 always @(*) begin : rate_step 
  if( rate_V[5:2]==4'hf && state_V == ATTACK) 
  step_idx = 8'b11111111; 
  else 
  if( rate_V[5:2]==4'd0 && state_V != ATTACK) 
  step_idx = 8'b11111110; 
  else 
  step_idx = step_ram; 
  step_V = rate_V[5:1]==5'd0 ? 1'b0 : step_idx[ cnt_V ]; 
 end 
 endmodule