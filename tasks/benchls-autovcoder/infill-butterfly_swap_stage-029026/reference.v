module autovcoder_029026 (
    itr,
    clk,
    ct
    , x0,
    y0
    , x1,
    y1
);

  parameter width = 32;

  input [1:0] ct;
  input clk;
  input [0:0] itr;
  input [width-1:0] x0;
  output reg [width-1:0] y0;
  input [width-1:0] x1;
  output reg [width-1:0] y1;
  wire [width-1:0] t0_0, t0_1;
  reg [width-1:0] t1_0, t1_1;

  reg [0:0] control;

  always @(posedge clk) begin
    case (ct)
      2'd0: control <= 1'b1;
      2'd1: control <= 1'b1;
      2'd2: control <= 1'b0;
      2'd3: control <= 1'b0;
    endcase
  end

  // synthesis attribute rom_style of control is "distributed"
  reg [0:0] control0;
  always @(posedge clk) begin
    control0 <= control;
  end
  assign t0_0 = x0;
  assign t0_1 = x1;
  always @(posedge clk) begin
    t1_0 <= (control0[0] == 0) ? t0_0 : t0_1;
    t1_1 <= (control0[0] == 0) ? t0_1 : t0_0;
  end
  always @(posedge clk) begin
    y0 <= t1_0;
    y1 <= t1_1;
  end
endmodule

