module mg_00392 (iSystemClock ,iReset ,oReady ,oLastStep ,iStart ,oPO_Reset);
input iSystemClock ; 
  input iReset ; 
  output oReady ; 
  output oLastStep ; 
  input iStart ; 
  output oPO_Reset ; 
  parameter POR_FSM_BIT = 4; 
  parameter POR_RESET = 4'b0001; 
  parameter POR_READY = 4'b0010; 
  parameter POR_RFRST = 4'b0100; 
  parameter POR_RLOOP = 4'b1000; 
  reg [POR_FSM_BIT-1:0] rPOR_cur_state ; 
  reg [POR_FSM_BIT-1:0] rPOR_nxt_state ; 
  reg rReady ; 
  reg [3:0] rTimer ; 
  wire wJOBDone ; 
  reg rPO_Reset ; 
  assign wJOBDone = (4'b1001 == rTimer[3:0]); 
  always @ (posedge iSystemClock, posedge iReset) begin 
  if (iReset) begin 
  rPOR_cur_state <= POR_RESET; 
  end else begin 
  rPOR_cur_state <= rPOR_nxt_state; 
  end 
  end 
  always @ ( * ) begin 
  case (rPOR_cur_state) 
  POR_RESET: begin 
  rPOR_nxt_state <= POR_READY; 
  end 
  POR_READY: begin 
  rPOR_nxt_state <= (iStart)? POR_RFRST:POR_READY; 
  end 
  POR_RFRST: begin 
  rPOR_nxt_state <= POR_RLOOP; 
  end 
  POR_RLOOP: begin 
  rPOR_nxt_state <= (wJOBDone)? ((iStart)? POR_RFRST:POR_READY):POR_RLOOP; 
  end 
  default: 
  rPOR_nxt_state <= POR_READY; 
  endcase 
  end 
  always @ (posedge iSystemClock, posedge iReset) begin 
  if (iReset) begin 
  rReady <= 0; 
  rTimer[3:0] <= 0; 
  rPO_Reset <= 0; 
  end else begin 
  case (rPOR_nxt_state) 
  POR_RESET: begin 
  rReady <= 0; 
  rTimer[3:0] <= 0; 
  rPO_Reset <= 0; 
  end 
  POR_READY: begin 
  rReady <= 1; 
  rTimer[3:0] <= 0; 
  rPO_Reset <= 0; 
  end 
  POR_RFRST: begin 
  rReady <= 0; 
  rTimer[3:0] <= 4'b0000; 
  rPO_Reset <= 1; 
  end 
  POR_RLOOP: begin 
  rReady <= 0; 
  rTimer[3:0] <= rTimer[3:0] + 1'b1; 
  rPO_Reset <= 1; 
  end 
  endcase 
  end 
  end 
  assign oReady = rReady | wJOBDone ; 
  assign oLastStep = wJOBDone ; 
  assign oPO_Reset = rPO_Reset ; 
 endmodule