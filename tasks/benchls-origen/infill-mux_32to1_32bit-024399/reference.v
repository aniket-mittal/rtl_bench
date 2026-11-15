`timescale 1ns / 1ps

module origen_024399 #(
    parameter n = 32
)(
    input [n-1:0] R0, R1, R2, R3, R4, R5, R6, R7,
    input [n-1:0] R8, R9, R10, R11, R12, R13, R14, R15,
    input [n-1:0] R16, R17, R18, R19, R20, R21, R22, R23,
    input [n-1:0] R24, R25, R26, R27, R28, R29, R30, R31,
    input [4:0] s,
    output reg [n-1:0] out
);

always @(*) begin
    case(s)
        5'b00000: out = R0;
        5'b00001: out = R1;
        5'b00010: out = R2;
        5'b00011: out = R3;
        5'b00100: out = R4;
        5'b00101: out = R5;
        5'b00110: out = R6;
        5'b00111: out = R7;
        5'b01000: out = R8;
        5'b01001: out = R9;
        5'b01010: out = R10;
        5'b01011: out = R11;
        5'b01100: out = R12;
        5'b01101: out = R13;
        5'b01110: out = R14;
        5'b01111: out = R15;
        5'b10000: out = R16;
        5'b10001: out = R17;
        5'b10010: out = R18;
        5'b10011: out = R19;
        5'b10100: out = R20;
        5'b10101: out = R21;
        5'b10110: out = R22;
        5'b10111: out = R23;
        5'b11000: out = R24;
        5'b11001: out = R25;
        5'b11010: out = R26;
        5'b11011: out = R27;
        5'b11100: out = R28;
        5'b11101: out = R29;
        5'b11110: out = R30;
        5'b11111: out = R31;
    endcase
end

endmodule