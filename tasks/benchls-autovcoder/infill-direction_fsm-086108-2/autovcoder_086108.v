module autovcoder_086108 (
    input RESET,
    input CLOCK,
    input [3:0] PUSH_BUTTONS,
    // 0: rechts, 1: unten, 2: oben, 3: links
    output [1:0] STATE_OUT
);

  reg [1:0] CurrState;
  reg [1:0] NextState;

  assign STATE_OUT = CurrState;

  // synchronous logic
  always @(posedge CLOCK) begin
    if (RESET) begin
      CurrState <= 2'b00;  // the right state
    end else begin
      CurrState <= NextState;
    end
  end

  // asynchronous logic
  [MASKED]

endmodule

