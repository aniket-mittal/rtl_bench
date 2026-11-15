module mg_01844 (input clock,input reset,input s_tick,input tx_start,input [7:0] data_in,output reg tx,output reg tx_done);
localparam [1:0] IDLE = 0, 
  START = 1, 
  SEND = 2, 
  STOP = 3; 
  localparam B_start=1'b0, 
  B_stop= 1'b1; 
  reg [1:0] current_state, next_state; 
  reg [2:0] B_sent; 
  reg [7:0] d_in; 
  always @(posedge clock, posedge reset) 
  begin 
  if(reset) begin 
  current_state <= IDLE; 
  end 
  else 
  current_state <= next_state; 
  end 
  [MASKED] 
 endmodule