module origen_192445 #(
  parameter N = 2,
  parameter HALF = N / 2,
  parameter WIDTH = $clog2(N)
)(
  input  wire     clk,
  input  wire     rst_n,
  output reg      clk_out,
  output wire     cnt_max
);

  reg [WIDTH-1:0] cnt;
  reg             clk_p;
  reg             clk_n;

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      cnt <= 0;
      clk_p <= 1'b0;
    end
    else begin
      if (cnt == N-1) begin
        cnt <= 0;
        clk_p <= 1'b0;
      end
      else begin
        cnt <= cnt + 1;
        if (cnt < HALF)
          clk_p <= 1'b1;
        else
          clk_p <= 1'b0;
      end
    end
  end

  always @(negedge clk or negedge rst_n) begin
    if (~rst_n)
      clk_n <= 1'b0;
    else
      clk_n <= clk_p;
  end

  assign cnt_max = (cnt == N-1) ? 1'b1 : 1'b0;

  always @(*) begin
    if (N == 1)
      clk_out = clk;
    else if (N[0] == 0)
      clk_out = clk_p;
    else
      clk_out = clk_p | clk_n;
  end

endmodule