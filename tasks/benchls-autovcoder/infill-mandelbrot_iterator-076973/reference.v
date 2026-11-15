module autovcoder_076973 #(
    parameter MAXITERS = 256,               // max number of iterations
    parameter IW       = $clog2(MAXITERS),  // width of iteration vars
    parameter FPW      = 2 * 27,            // bitwidth of fixed-point numbers
    parameter AW       = 11                 // address width
) (
    // system
    input  wire           clk,      // clock
    input  wire           clk_en,   // clock enable
    input  wire           rst,      // reset
    // input cooridnates
    input  wire           in_vld,   // input valid
    output reg            in_rdy,   // input ack
    input  wire [FPW-1:0] x_man,    // mandelbrot x coordinate
    input  wire [FPW-1:0] y_man,    // mandelbrot y cooridnate
    input  wire [ AW-1:0] adr_i,    // mandelbrot coordinate address input
    // output
    output reg            out_vld,  // output valid
    input  wire           out_rdy,  // output ack
    output wire [ IW-1:0] niter,    // number of iterations
    output reg  [ AW-1:0] adr_o     // mandelbrot cooridnate address output
);


  //// local parameters ////
  localparam FP_S = 1;  // fixed-point sign bit
  localparam FP_I = 4;  // fixed-point integer bits
  localparam FP_F = FPW - FP_S - FP_I;  // fixed-point fractional bits 


  //// flow control ////
  reg  busy;
  wire check;

  always @(posedge clk, posedge rst) begin
    if (rst) begin
      in_rdy  <= #1 1'b1;
      out_vld <= #1 1'b0;
      busy    <= #1 1'b0;
    end else if (clk_en) begin
      if (in_vld && in_rdy) begin
        in_rdy <= #1 1'b0;
        busy   <= #1 1'b1;
      end else if (check && !out_vld && busy) begin
        out_vld <= #1 1'b1;
        busy    <= #1 1'b0;
      end else if (check && out_vld && out_rdy) begin
        in_rdy  <= #1 1'b1;
        out_vld <= #1 1'b0;
      end
    end
  end


  //// mandelbrot calculation ////
  reg signed [FPW-1:0] x_man_r, y_man_r;
  wire signed [FPW-1:0] x_comb, y_comb;
  reg signed [FPW-1:0] x, y;
  wire signed [2*FPW-1:0] xx_mul_comb, yy_mul_comb, xy_mul_comb;
  wire signed [FPW-1:0] xx_comb, yy_comb, xy2_comb;
  reg signed [FPW-1:0] xx, yy, xy2;
  wire signed [ FPW-1:0] limit;
  reg         [IW+1-1:0] niters;
  wire                   niters_check;
  wire                   limit_check;
  //wire                    check;


  assign xx_mul_comb  = x * x;
  assign yy_mul_comb  = y * y;
  assign xy_mul_comb  = x * y;
  assign xx_comb      = xx_mul_comb[2*FPW-1-FP_S-FP_I:FPW-FP_S-FP_I];
  assign yy_comb      = yy_mul_comb[2*FPW-1-FP_S-FP_I:FPW-FP_S-FP_I];
  assign xy2_comb     = {xy_mul_comb[2*FPW-2-FP_S-FP_I:FPW-FP_S-FP_I], 1'b0};
  assign limit        = {1'h0, 4'h4, {FP_F{1'h0}}};  // 4.0
  assign niters_check = niters[IW+1-1:1] >= (MAXITERS - 1);
  assign limit_check  = (xx + yy) > limit;
  assign check        = niters_check || limit_check;
  assign x_comb       = xx - yy + x_man_r;
  assign y_comb       = xy2 + y_man_r;

  always @(posedge clk) begin
    if (clk_en) begin
      if (in_vld && in_rdy) begin
        adr_o   <= #1 adr_i;
        x_man_r <= #1 x_man;
        y_man_r <= #1 y_man;
        x       <= #1'd0;
        y       <= #1'd0;
        xx      <= #1'd0;
        yy      <= #1'd0;
        xy2     <= #1'd0;
        niters  <= #1'd0;
      end else if (!check) begin
        x      <= #1 x_comb;
        y      <= #1 y_comb;
        xx     <= #1 xx_comb;
        yy     <= #1 yy_comb;
        xy2    <= #1 xy2_comb;
        niters <= #1 niters + 'd1;
      end
    end
  end

  assign niter = niters[IW+1-1:1];


endmodule

