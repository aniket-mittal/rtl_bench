module origen_033279 (
    input wire rx0_pclk,
    input wire rstbtn_n,
    input wire rx0_hsync,
    input wire rx0_vsync,
    output reg video_en,
    output reg [11:0] index,
    output reg [10:0] video_hcnt,
    output reg [10:0] video_vcnt
);

reg [10:0] vcounter, hcounter;
reg vactive, hactive;
reg hsync_buf;

[MASKED]

endmodule