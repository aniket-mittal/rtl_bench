module origen_145975(
    input [15:0] A,
    input [15:0] B,
    input [3:0] S,
    input [3:0] BCD_input,
    output [7:0] final_output
);

    wire [15:0] barrel_shifter_out;
    wire [3:0] bcd_out1, bcd_out2;

    // Barrel Shifter
    barrel_shifter bs (
        .A(A),
        .B(B),
        .S(S),
        .Y(barrel_shifter_out)
    );

    // BCD Converter
    bcd_converter bcd (
        .A(BCD_input),
        .OUT1(bcd_out1),
        .OUT2(bcd_out2)
    );

    // Functional Module
    functional_module fm (
        .barrel_msb(barrel_shifter_out[15:8]),
        .bcd1(bcd_out1),
        .bcd2(bcd_out2),
        .result(final_output)
    );

endmodule

module barrel_shifter(
    input [15:0] A,
    input [15:0] B,
    input [3:0] S,
    output reg [15:0] Y
);
    always @(*) begin
        case(S)
            4'b0000: Y = A;
            4'b0001: Y = {A[0], A[15:1]};
            4'b0010: Y = {A[1:0], A[15:2]};
            4'b0011: Y = {A[2:0], A[15:3]};
            4'b0100: Y = {A[3:0], A[15:4]};
            4'b0101: Y = {A[4:0], A[15:5]};
            4'b0110: Y = {A[5:0], A[15:6]};
            4'b0111: Y = {A[6:0], A[15:7]};
            4'b1000: Y = {A[7:0], A[15:8]};
            4'b1001: Y = {A[8:0], A[15:9]};
            4'b1010: Y = {A[9:0], A[15:10]};
            4'b1011: Y = {A[10:0], A[15:11]};
            4'b1100: Y = {A[11:0], A[15:12]};
            4'b1101: Y = {A[12:0], A[15:13]};
            4'b1110: Y = {A[13:0], A[15:14]};
            4'b1111: Y = {A[14:0], A[15]};
        endcase
    end
endmodule

module bcd_converter(
    input [3:0] A,
    output reg [3:0] OUT1,
    output reg [3:0] OUT2
);
    always @(*) begin
        case(A)
            4'b0000: {OUT1, OUT2} = 8'b0000_0000;
            4'b0001: {OUT1, OUT2} = 8'b0000_0001;
            4'b0010: {OUT1, OUT2} = 8'b0000_0010;
            4'b0011: {OUT1, OUT2} = 8'b0000_0011;
            4'b0100: {OUT1, OUT2} = 8'b0000_0100;
            4'b0101: {OUT1, OUT2} = 8'b0000_0101;
            4'b0110: {OUT1, OUT2} = 8'b0000_0110;
            4'b0111: {OUT1, OUT2} = 8'b0000_0111;
            4'b1000: {OUT1, OUT2} = 8'b0000_1000;
            4'b1001: {OUT1, OUT2} = 8'b0000_1001;
            4'b1010: {OUT1, OUT2} = 8'b0001_0000;
            4'b1011: {OUT1, OUT2} = 8'b0001_0001;
            4'b1100: {OUT1, OUT2} = 8'b0001_0010;
            4'b1101: {OUT1, OUT2} = 8'b0001_0011;
            4'b1110: {OUT1, OUT2} = 8'b0001_0100;
            4'b1111: {OUT1, OUT2} = 8'b0001_0101;
        endcase
    end
endmodule

module functional_module(
    input [7:0] barrel_msb,
    input [3:0] bcd1,
    input [3:0] bcd2,
    output reg [7:0] result
);
    always @(*) begin
        result = barrel_msb + {4'b0000, bcd1} + {4'b0000, bcd2};
    end
endmodule