module rtlpp_06397(seq_seen, inp_bit, reset, clk);

  output seq_seen;
  input inp_bit;
  input reset;
  input clk;

  parameter IDLE = 3'b000,
            SEQ_1 = 3'b001, 
            SEQ_10 = 3'b010,
            SEQ_101 = 3'b011,
            SEQ_1011 = 3'b100;

  reg [2:0] current_state, next_state;
  
  assign seq_seen = (current_state == SEQ_1011) ? 1 : 0;

  always @(posedge clk or posedge reset)
  begin
    if (reset)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end

  [MASKED]
endmodule