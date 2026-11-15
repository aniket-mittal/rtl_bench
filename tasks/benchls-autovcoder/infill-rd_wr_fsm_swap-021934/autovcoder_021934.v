module autovcoder_021934 (
    swp,
    init_state,
    rd,
    wr
);

  input swp;
  input [1:0] init_state;
  output rd, wr;

  wire [1:0] init_state;
  reg  [1:0] state;
  reg rd, wr, iterator;

  initial begin
    iterator = 0;
    state = 2'b00;
  end
  //always
  //state=init_state;
  // always@(initial_state)

  [MASKED]

endmodule

