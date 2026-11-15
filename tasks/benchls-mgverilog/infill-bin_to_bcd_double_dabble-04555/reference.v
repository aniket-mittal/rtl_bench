module mg_04555 (input clk,input trigger,input [31:0] in,output reg idle,output reg [31:0] bcd);
localparam S_IDLE = 'b001; 
  localparam S_SHIFT = 'b010; 
  localparam S_ADD3 = 'b100; 
  reg [2:0] state, state_next; 
  reg [31:0] shift, shift_next; 
  reg [31:0] bcd_next; 
  localparam COUNTER_MAX = 32; 
  reg [5:0] counter, counter_next; 
  always @(*) begin 
  state_next = state; 
  shift_next = shift; 
  bcd_next = bcd; 
  counter_next = counter; 
  idle = 1'b0; 
  case (state) 
  S_IDLE: begin 
  counter_next = 'd1; 
  shift_next = 'd0; 
  idle = 1'b1; 
  if (trigger) begin 
  state_next = S_SHIFT; 
  end 
  end 
  S_ADD3: begin 
  if (shift[31:28] >= 5) 
  shift_next[31:28] = shift[31:28] + 4'd3; 
  if (shift[27:24] >= 5) 
  shift_next[27:24] = shift[27:24] + 4'd3; 
  if (shift[23:20] >= 5) 
  shift_next[23:20] = shift[23:20] + 4'd3; 
  if (shift[19:16] >= 5) 
  shift_next[19:16] = shift[19:16] + 4'd3; 
  if (shift[15:12] >= 5) 
  shift_next[15:12] = shift[15:12] + 4'd3; 
  if (shift[11:8] >= 5) 
  shift_next[11:8] = shift[11:8] + 4'd3; 
  if (shift[7:4] >= 5) 
  shift_next[7:4] = shift[7:4] + 4'd3; 
  if (shift[3:0] >= 5) 
  shift_next[3:0] = shift[3:0] + 4'd3; 
  state_next = S_SHIFT; 
  end 
  S_SHIFT: begin 
  shift_next = {shift[30:0], in[COUNTER_MAX - counter_next]}; 
  if (counter == COUNTER_MAX) begin 
  bcd_next = shift_next; 
  state_next = S_IDLE; 
  end else 
  state_next = S_ADD3; 
  counter_next = counter + 'd1; 
  end 
  default: begin 
  state_next = S_IDLE; 
  end 
  endcase 
  end 
  always @(posedge clk) begin 
  state <= state_next; 
  shift <= shift_next; 
  bcd <= bcd_next; 
  counter <= counter_next; 
  end 
 endmodule