module origen_031450 #(
    parameter v2 = 0
) (
    input wire clk,
    input wire [1:0] scanlines,
    input wire [23:0] din,
    input wire hs_in,
    input wire vs_in,
    input wire de_in,
    output reg [23:0] dout,
    output reg hs_out,
    output reg vs_out,
    output reg de_out
);

reg [1:0] scanline;
reg [23:0] din_r;
reg hs_in_r, vs_in_r, de_in_r;
reg [23:0] din_r2;
reg hs_in_r2, vs_in_r2, de_in_r2;

wire [7:0] r = din[23:16];
wire [7:0] g = din[15:8];
wire [7:0] b = din[7:0];

always @(posedge clk) begin
    if (~vs_in)
        scanline <= 2'b00;
    else if (~hs_in)
        scanline <= v2 ? (scanline == scanlines ? 2'b00 : scanline + 1'b1) : (scanline ? 2'b00 : scanlines);
end

[MASKED]

endmodule