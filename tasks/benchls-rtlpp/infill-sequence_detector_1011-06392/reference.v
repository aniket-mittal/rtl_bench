module rtlpp_06392(seq_seen, inp_bit, reset, clk);

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

  assign seq_seen = (current_state == SEQ_1011) ? 1'b1 : 1'b0;

  always @(posedge clk)
  begin
    if (reset)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end

  always @(inp_bit or current_state)
  begin
    case (current_state)
      IDLE:
        if (inp_bit)
          next_state = SEQ_1;
        else
          next_state = IDLE;
      SEQ_1:
        if (inp_bit)
          next_state = SEQ_1;
        else
          next_state = SEQ_10;
      SEQ_10:
        if (inp_bit)
          next_state = SEQ_101;
        else
          next_state = IDLE;
      SEQ_101:
        if (inp_bit)
          next_state = SEQ_1011;
        else
          next_state = SEQ_10;
      SEQ_1011:
        if (inp_bit)
          next_state = SEQ_1;
        else
          next_state = IDLE;
      default:
        next_state = IDLE;
    endcase
  end
endmodule