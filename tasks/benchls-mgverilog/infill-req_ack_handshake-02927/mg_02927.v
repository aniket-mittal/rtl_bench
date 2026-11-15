module mg_02927 (input clk ,input rstn ,input rc_is_idle,input rc_reqn,output reg rc_ackn);
reg [1:0] state_c, state_n; 
  localparam [1:0] 
  RC_Idle = 4'd0, 
  RC_ReqAck = 4'd1; 
  always @(posedge clk or negedge rstn) begin 
  if (~rstn) 
  state_c <= RC_Idle; 
  else 
  state_c <= state_n; 
  end 
  [MASKED] 
 endmodule