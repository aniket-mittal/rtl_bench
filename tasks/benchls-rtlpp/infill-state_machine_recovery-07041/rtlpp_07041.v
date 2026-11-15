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

  [MASKED]
  
endmodule