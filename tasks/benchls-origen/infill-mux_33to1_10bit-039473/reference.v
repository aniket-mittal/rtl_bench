`timescale 1ps/1ps

module origen_039473 (
    input [9:0] in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31, in32, in33,
    input [4:0] ctrl1,
    output [9:0] out1
);

    wire [9:0] asc001;
    reg [9:0] asc001_tmp_0;

    assign asc001 = asc001_tmp_0;
    assign out1 = asc001;

    always @(*) begin
        case(ctrl1)
            5'b11110: asc001_tmp_0 = in32;
            5'b11101: asc001_tmp_0 = in31;
            5'b11100: asc001_tmp_0 = in30;
            5'b11011: asc001_tmp_0 = in29;
            5'b11010: asc001_tmp_0 = in28;
            5'b11001: asc001_tmp_0 = in27;
            5'b11000: asc001_tmp_0 = in26;
            5'b10111: asc001_tmp_0 = in25;
            5'b10110: asc001_tmp_0 = in24;
            5'b10101: asc001_tmp_0 = in23;
            5'b10100: asc001_tmp_0 = in22;
            5'b10011: asc001_tmp_0 = in21;
            5'b10010: asc001_tmp_0 = in20;
            5'b10001: asc001_tmp_0 = in19;
            5'b10000: asc001_tmp_0 = in18;
            5'b01111: asc001_tmp_0 = in17;
            5'b01110: asc001_tmp_0 = in16;
            5'b01101: asc001_tmp_0 = in15;
            5'b01100: asc001_tmp_0 = in14;
            5'b01011: asc001_tmp_0 = in13;
            5'b01010: asc001_tmp_0 = in12;
            5'b01001: asc001_tmp_0 = in11;
            5'b01000: asc001_tmp_0 = in10;
            5'b00111: asc001_tmp_0 = in9;
            5'b00110: asc001_tmp_0 = in8;
            5'b00101: asc001_tmp_0 = in7;
            5'b00100: asc001_tmp_0 = in6;
            5'b00011: asc001_tmp_0 = in5;
            5'b00010: asc001_tmp_0 = in4;
            5'b00001: asc001_tmp_0 = in3;
            5'b00000: asc001_tmp_0 = in2;
            default: asc001_tmp_0 = in33;
        endcase
    end

endmodule