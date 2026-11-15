module origen_074468 (
    input wire [13:0] DAC_in,
    input wire [3:0] Sel_att,
    input wire clk,
    output reg [13:0] DAC_out
);

    parameter signed [31:0] coeff_0 = -32'd62;
    parameter signed [31:0] coeff_1 = 32'd0;
    parameter signed [31:0] coeff_2 = 32'd194;
    parameter signed [31:0] coeff_3 = 32'd435;
    parameter signed [31:0] coeff_4 = 32'd619;
    parameter signed [31:0] coeff_5 = 32'd619;
    parameter signed [31:0] coeff_6 = 32'd435;
    parameter signed [31:0] coeff_7 = 32'd194;
    parameter signed [31:0] coeff_8 = 32'd0;
    parameter [31:0] coeff_w = 32'd8192;
    parameter [31:0] coeff_x = 32'd8192;
    parameter [31:0] coeff_y = 32'd8192;
    parameter [31:0] coeff_z = 32'd8192;

    reg signed [31:0] tap_delay [0:10];
    reg [13:0] DAC_mov;

    [MASKED]

endmodule