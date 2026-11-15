module origen_099633(
    input [7:0] in,
    output [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : copy_bits
            assign out[i] = in[i];
        end
        for (i = 8; i < 16; i = i + 1) begin : extend_sign
            assign out[i] = in[7];
        end
    endgenerate
endmodule

module bit8to16ZE(
    input [7:0] in,
    output [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : copy_bits
            assign out[i] = in[i];
        end
        for (i = 8; i < 16; i = i + 1) begin : extend_zero
            assign out[i] = 1'b0;
        end
    endgenerate
endmodule

module bit3to16ZE(
    input [2:0] in,
    output [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 3; i = i + 1) begin : copy_bits
            assign out[i] = in[i];
        end
        for (i = 3; i < 16; i = i + 1) begin : extend_zero
            assign out[i] = 1'b0;
        end
    endgenerate
endmodule

module bit7to16ZE(
    input [6:0] in,
    output [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 7; i = i + 1) begin : copy_bits
            assign out[i] = in[i];
        end
        for (i = 7; i < 16; i = i + 1) begin : extend_zero
            assign out[i] = 1'b0;
        end
    endgenerate
endmodule

module bit5to16ZE(
    input [4:0] in,
    output [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 5; i = i + 1) begin : copy_bits
            assign out[i] = in[i];
        end
        for (i = 5; i < 16; i = i + 1) begin : extend_zero
            assign out[i] = 1'b0;
        end
    endgenerate
endmodule

module bit6to16SE(
    input [5:0] in,
    output [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : copy_bits
            assign out[i] = in[i];
        end
        for (i = 6; i < 16; i = i + 1) begin : extend_sign
            assign out[i] = in[5];
        end
    endgenerate
endmodule

module bit11to16SE(
    input [10:0] in,
    output [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 11; i = i + 1) begin : copy_bits
            assign out[i] = in[i];
        end
        for (i = 11; i < 16; i = i + 1) begin : extend_sign
            assign out[i] = in[10];
        end
    endgenerate
endmodule