module rtlpp_00232(input clk_in, reset_in, sequence_in, output detector_out);
  parameter IDLE = 3'd1,
            GOT1 = 3'd2,
            GOT11 = 3'd3,
            GOT110 = 3'd4,
            GOT1101 = 3'd5,
            GOT11010 = 3'd6;

  reg [2:0] present_state, next_state;
  reg dout_next, dout_present;

  always @(posedge clk_in or negedge reset_in) begin
    if (reset_in == 1'b0) begin
      present_state <= IDLE;
      dout_present <= 1'b0;
    end else begin
      present_state <= next_state;
      dout_present <= dout_next;
    end
  end

  always @(present_state or sequence_in) begin
    next_state = present_state;
    case (present_state)
      IDLE:     next_state = (sequence_in == 1'b1) ? GOT1 : IDLE;
      GOT1:     next_state = (sequence_in == 1'b1) ? GOT11 : IDLE;
      GOT11:    next_state = (sequence_in == 1'b0) ? GOT110 : GOT11;
      GOT110:   next_state = (sequence_in == 1'b1) ? GOT1101 : IDLE;
      GOT1101:  next_state = (sequence_in == 1'b0) ? GOT11010 : GOT11;
      GOT11010: next_state = (sequence_in == 1'b1) ? GOT1 : IDLE;
      default:  next_state = IDLE;
    endcase
  end

  always @(present_state) begin
    case (present_state)
      IDLE,
      GOT1,
      GOT11,
      GOT110,
      GOT1101:  dout_next = 1'b0;
      GOT11010: dout_next = 1'b1;
      default:  dout_next = 1'b0;
    endcase
  end

  assign detector_out = dout_present;

endmodule