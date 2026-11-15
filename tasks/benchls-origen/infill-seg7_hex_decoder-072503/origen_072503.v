module origen_072503(
    input [3:0] iNum,
    output reg [7:0] oHex
);
    [MASKED]
endmodule

module hex4(
    input [15:0] iNum,
    output [31:0] oHex
);
    hex1 h0(.iNum(iNum[3:0]), .oHex(oHex[7:0]));
    hex1 h1(.iNum(iNum[7:4]), .oHex(oHex[15:8]));
    hex1 h2(.iNum(iNum[11:8]), .oHex(oHex[23:16]));
    hex1 h3(.iNum(iNum[15:12]), .oHex(oHex[31:24]));
endmodule

module hex8(
    input [31:0] iNum,
    output [63:0] oHex
);
    hex1 h0(.iNum(iNum[3:0]), .oHex(oHex[7:0]));
    hex1 h1(.iNum(iNum[7:4]), .oHex(oHex[15:8]));
    hex1 h2(.iNum(iNum[11:8]), .oHex(oHex[23:16]));
    hex1 h3(.iNum(iNum[15:12]), .oHex(oHex[31:24]));
    hex1 h4(.iNum(iNum[19:16]), .oHex(oHex[39:32]));
    hex1 h5(.iNum(iNum[23:20]), .oHex(oHex[47:40]));
    hex1 h6(.iNum(iNum[27:24]), .oHex(oHex[55:48]));
    hex1 h7(.iNum(iNum[31:28]), .oHex(oHex[63:56]));
endmodule