module gpio_slave (
  input         reset_n,
  input         clk,
  input         sync,
  input         mosi,
  output        miso,

  input   [7:0] leds,
  output  [7:0] dipsw
);

  wire [7:0] i_leds;
  reg  [7:0] i_dipsw;
  reg  [7:0] q_leds;
  reg  [7:0] q_dipsw;

  assign i_leds = ~leds;
  assign miso   = q_leds[0];
  assign dipsw  = q_dipsw;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      i_dipsw <= 8'b00000000;
    end else begin
      i_dipsw <= {mosi, i_dipsw[7:1]};
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      q_leds  <= 8'b11111111;
      q_dipsw <= 8'b00000000;
    end else if (sync) begin
      q_leds  <= i_leds;
      q_dipsw <= i_dipsw;
    end else begin
      q_leds  <= {1'b1, q_leds[7:1]};
      q_dipsw <= q_dipsw;
    end
  end

endmodule