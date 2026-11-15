module mg_09383 (input clock,input reset,input PB,output reg send16,input busy,output [1:0] stateID);
reg[1:0] next_state, state; 
  localparam IDLE = 2'd0; 
  localparam TX_OPERAND01 = 2'd1; 
  localparam TX_OPERAND02 = 2'd2; 
  localparam TX_ALU_CTRL = 2'd3; 
  assign stateID = state; 
  [MASKED] 
  always@(posedge clock) begin 
  if(reset) 
  state <= IDLE; 
  else 
  state <= next_state; 
  end 
 endmodule