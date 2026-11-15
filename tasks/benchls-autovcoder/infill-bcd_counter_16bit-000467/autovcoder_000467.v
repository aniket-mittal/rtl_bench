module autovcoder_000467 (
    input clk,
    input reset,  // Synchronous active-high reset
    output reg [3:1] ena,
    output reg [15:0] q
);

  [MASKED]

  // always @(posedge clk)
  // begin
  //     if(reset)
  //         q <= 0;
  //     else
  //     begin
  //         q <= q + 1;
  //     end
  // end

  always @(posedge clk) begin
    if (reset) ena <= 0;
    else begin
      if (q[3:0] == 4'd8) begin
        ena[1] <= 1'b1;
        if (q[7:4] == 4'd9) begin
          ena[2] <= 1'b1;
          if (q[11:8] == 4'd9) ena[3] <= 1'b1;
        end
      end else ena <= 3'b000;
    end
  end

endmodule

