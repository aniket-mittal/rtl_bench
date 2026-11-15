module mg_05764 (clock,resetn,valid_in,stall_out,valid_entry,stall_entry,valid_exit,stall_exit);
parameter LIMIT_COUNTER_WIDTH = 16; 
 parameter MAX_VALUE = 2; 
 parameter VALUE_ONE = 1; 
 parameter MAX_VALUE_MIN_ONE = 1; 
 input clock; 
 input resetn; 
 input valid_in; 
 output stall_out; 
 output valid_entry; 
 input stall_entry; 
 input valid_exit; 
 input stall_exit; 
 parameter s_EMPTY = 2'b00; 
 parameter s_RUNNING = 2'b01; 
 parameter s_FULL = 2'b10; 
 reg [1:0] present_state, next_state; 
 reg [LIMIT_COUNTER_WIDTH-1:0] limit_counter; 
 wire increment_counter, decrement_counter; 
 assign increment_counter = ~(stall_entry) & valid_in; 
 assign decrement_counter = ~(stall_exit) & valid_exit; 
 always@(*) 
 begin 
  case (present_state) 
  s_EMPTY: if (increment_counter & ~decrement_counter) 
  next_state <= s_RUNNING; 
  else 
  next_state <= s_EMPTY; 
  s_RUNNING: if ((limit_counter == MAX_VALUE_MIN_ONE) & (increment_counter & ~decrement_counter)) 
  next_state <= s_FULL; 
  else if ((limit_counter == VALUE_ONE) & (~increment_counter & decrement_counter)) 
  next_state <= s_EMPTY; 
  else 
  next_state <= s_RUNNING; 
  s_FULL: if (~increment_counter & decrement_counter) 
  next_state <= s_RUNNING; 
  else 
  next_state <= s_FULL; 
  default: next_state <= 2'bxx; 
  endcase 
 end 
 always@(posedge clock or negedge resetn) 
 begin 
  if (~resetn) 
  present_state <= s_EMPTY; 
  else 
  present_state <= next_state; 
 end 
 always@(posedge clock or negedge resetn) 
 begin 
  if (~resetn) 
  limit_counter <= {LIMIT_COUNTER_WIDTH{1'b0}}; 
  else 
  begin 
  if ((increment_counter & ~decrement_counter) & (present_state != s_FULL)) 
  limit_counter <= limit_counter + 1'b1; 
  else if ((~increment_counter & decrement_counter) & (present_state != s_EMPTY)) 
  limit_counter <= limit_counter - 2'b01; 
  end 
 end 
 assign valid_entry = (valid_in & (present_state == s_FULL)); 
 assign stall_out = ((present_state == s_FULL) | stall_entry); 
 endmodule