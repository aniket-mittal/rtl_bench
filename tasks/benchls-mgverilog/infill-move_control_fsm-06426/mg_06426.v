module mg_06426(input clk,input go,input stop,input resetn,output reg start,output reg move);
reg [5:0] cur, next; 
  localparam S_READY = 5'd0, 
  S_READY_WAIT = 5'd1, 
  S_MOVE = 5'd2, 
  S_STOP = 5'd3; 
  [MASKED] 
  always @(*) 
  begin: enable_signals 
  start = 1'b0; 
  move = 1'b0; 
  case (cur) 
  S_READY: begin 
  start = 1'b1; 
  end 
  S_MOVE: begin 
  move = 1'b1; 
  end 
  default: begin 
  end 
  endcase 
  end 
  always@(posedge clk) 
  begin: state_FFs 
  if (!resetn) 
  cur <= S_READY; 
  else 
  cur <= next; 
  end 
 endmodule