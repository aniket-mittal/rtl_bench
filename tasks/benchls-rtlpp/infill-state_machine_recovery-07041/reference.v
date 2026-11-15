module rtlpp_07041 (clk, rst, c, d, q);

  input              clk;
  input              rst;
  input       [3:0]  c;
  input       [3:0]  d;
  output reg  [3:0]  q;
  
  localparam [4:0]
    idle     = 5'b00001,
    state0   = 5'b00010,
    state1   = 5'b00100,
    state2   = 5'b01000,
    recovery = 5'b10000;

  reg   [4:0]  state;
  reg   [4:0]  next_state;

  always @ (posedge clk)
  begin
      if (rst)
        state <= idle;
      else
        state <= next_state;
  end

  always @(*)
  begin
    next_state = state;  // Use blocking assignment for combinational logic
    q = 4'b0000;         // Default output value for all states

    case (state)
      idle: begin
          if (c[0])
            next_state = state0;
          q = 4'b0000;
      end

      state0: begin
          if (c[0] && c[1])
            next_state = state1;
          q = d;
      end

      state1: begin
          next_state = state2;
          q = 4'b1100;
      end

      state2: begin
          if (~c[1])
            next_state = state1;
          else if (c[2])
            next_state = state2;
          else if (c[3])
            next_state = idle;
          q = 4'b0101;
      end

      recovery: begin
          next_state = state0;
          q = 4'b1111;
      end

      default: begin
          next_state = recovery;
          q = 4'b1111;
      end
    endcase
  end
  
endmodule