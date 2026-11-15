module origen_172618(
    input wire clk,
    input wire [1:0] theme,
    output reg [31:0] borderColor,
    output reg [31:0] bgColor,
    output reg [31:0] lowColor,
    output reg [31:0] midColor,
    output reg [31:0] highColor
);

    localparam Black = 32'h00000000;
    localparam White = 32'hFFFFFFFF;
    localparam Green = 32'h00FF00FF;
    localparam Red = 32'hFF0000FF;
    localparam Yellow = 32'hFFFF00FF;

    localparam t1border = 32'hFF0000FF;
    localparam t1bg = 32'h00FFFFFF;
    localparam t1low = 32'h00FF00FF;
    localparam t1mid = 32'hFFFF00FF;
    localparam t1high = 32'hFF00FFFF;

    localparam t2border = 32'hFFFF00FF;
    localparam t2bg = 32'h0000FFFF;
    localparam t2low = 32'h00FFFFFF;
    localparam t2mid = 32'hFF00FFFF;
    localparam t2high = 32'hFFFFFFFF;

    [MASKED]

endmodule