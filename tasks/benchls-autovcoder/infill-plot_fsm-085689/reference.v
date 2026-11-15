module autovcoder_085689 (
    go,
    reset_n,
    blackout,
    clk,
    plot,
    enable,
    colour_out,
    colour_bar
);
  input go, reset_n, clk, blackout;
  output reg enable, plot;
  output reg [2:0] colour_out, colour_bar;

  reg [2:0] current_state, next_state;

  localparam S_LOAD_X = 3'd0, S_LOAD_X_WAIT = 3'd1, S_LOAD_Y = 3'd2, S_FIN = 3'd3;


  always @(*) begin : state_table
    case (current_state)
      S_LOAD_X: next_state = go ? S_LOAD_X_WAIT : S_LOAD_X;
      S_LOAD_X_WAIT: next_state = go ? S_LOAD_X_WAIT : S_LOAD_Y;
      S_LOAD_Y: next_state = blackout ? S_LOAD_Y : S_FIN;
      S_FIN: next_state = reset_n ? S_FIN : S_LOAD_X;
      default: next_state = S_LOAD_X;
    endcase
  end

  always @(*) begin : enable_signals
    enable = 1'b0;
    plot = 1'b0;
    colour_out = 3'b000;
    colour_bar = 3'b000;

    case (current_state)
      S_LOAD_Y: begin
        enable = 1'b1;
        plot = 1'b1;
        colour_out = 3'b111;
        colour_bar = 3'b111;
      end
      S_FIN: begin
        enable = 1'b1;
        plot = 1'b1;
        colour_out = 3'b000;
        colour_bar = 3'b000;
      end
    endcase
  end



  always @(posedge clk) begin
    if (!reset_n) current_state <= S_LOAD_X;
    else current_state <= next_state;
  end

endmodule

