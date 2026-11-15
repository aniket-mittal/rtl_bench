module mg_10069 (clock ,reset ,req_0 ,req_1 ,gnt_0 ,gnt_1);
input clock,reset,req_0,req_1; 
 output gnt_0,gnt_1; 
 wire clock,reset,req_0,req_1; 
 reg gnt_0,gnt_1; 
 parameter SIZE = 3 ; 
 parameter IDLE = 3'b001,GNT0 = 3'b010,GNT1 = 3'b100 ; 
 reg [SIZE-1:0] state ; 
 reg [SIZE-1:0] next_state ; 
 [MASKED] 
 always @ (posedge clock) 
 begin : FSM_SEQ 
  if (reset == 1'b1) begin 
  state <= IDLE; 
  end else begin 
  state <= next_state; 
  end 
 end 
 always @ (state) 
 begin : OUTPUT_LOGIC 
  case(state) 
  IDLE : begin 
  gnt_0 = 1'b0; 
  gnt_1 = 1'b0; 
  end 
  GNT0 : begin 
  gnt_0 = 1'b1; 
  gnt_1 = 1'b0; 
  end 
  GNT1 : begin 
  gnt_0 = 1'b0; 
  gnt_1 = 1'b1; 
  end 
  default : begin 
  gnt_0 = 1'b0; 
  gnt_1 = 1'b0; 
  end 
  endcase 
 end 
 endmodule