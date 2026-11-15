module origen_023987 (
    input wire pixel_clk,
    input wire vsync_in,
    input wire href_in,
    input wire shrap_en,
    input wire [9:0] sharp_threlode_in,
    input wire [7:0] sharp_factor_in,
    input wire [9:0] data_raw_in,
    input wire [9:0] data_gaus_in,
    output reg vsync_out,
    output reg href_out,
    output reg [9:0] data_out
);

reg [9:0] data_raw_r1, data_raw_r2, data_raw_r3, data_raw_r4;
reg [9:0] data_gaus_r1, data_gaus_r2, data_gaus_r3, data_gaus_r4;
reg [9:0] data_abs;
reg [17:0] data_tmp1;
reg [9:0] data_tmp2;
reg [9:0] data_out_reg;
reg vsync_r1, vsync_r2, vsync_r3, vsync_r4;
reg href_r1, href_r2, href_r3, href_r4;

[MASKED]

endmodule