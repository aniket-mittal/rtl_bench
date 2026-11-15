module origen_178603(
    input clk,
    input [31:0] A,
    input [31:0] B,
    input [2:0] CtrlFunc,
    output reg [31:0] Result,
    output reg [3:0] Flags
);

reg [31:0] Result_temp;
reg [31:0] CMPtemp;
reg [3:0] Flags_temp;

always @(*) begin
    case (CtrlFunc)
        3'b011: // Addition
            Result_temp = A + B;
        3'b010: // Subtraction
            Result_temp = A - B;
        3'b110: // Multiplication
            Result_temp = A * B;
        3'b000: // Bitwise AND
            Result_temp = A & B;
        3'b001: // Bitwise XOR
            Result_temp = A ^ B;
        3'b101: // Bitwise OR
            Result_temp = A | B;
        3'b100: // Comparison
            begin
                CMPtemp = A - B;
                if (CMPtemp == 0)
                    Result_temp = A;
                else
                    Result_temp = CMPtemp;
            end
        default:
            Result_temp = 32'b0;
    endcase

    if (Result_temp == 0)
        Flags_temp = 4'b0100;
    else if (Result_temp[31])
        Flags_temp = 4'b1000;
    else
        Flags_temp = 4'b0000;
end

always @(negedge clk) begin
    Result <= Result_temp;
    Flags <= Flags_temp;
end

endmodule