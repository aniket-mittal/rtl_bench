module origen_063143 (
    input wire clk,
    input wire clr,
    input wire R0_in, R1_in, R2_in, R3_in, R4_in, R5_in, R6_in, R7_in,
    input wire R8_in, R9_in, R10_in, R11_in, R12_in, R13_in, R14_in, R15_in,
    input wire [31:0] BusMuxOut,
    output reg [31:0] BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3,
    output reg [31:0] BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7,
    output reg [31:0] BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11,
    output reg [31:0] BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15
);

    always @(posedge clk or negedge clr) begin
        if (!clr) begin
            BusMuxIn_R0 <= 32'b0;
            BusMuxIn_R1 <= 32'b0;
            BusMuxIn_R2 <= 32'b0;
            BusMuxIn_R3 <= 32'b0;
            BusMuxIn_R4 <= 32'b0;
            BusMuxIn_R5 <= 32'b0;
            BusMuxIn_R6 <= 32'b0;
            BusMuxIn_R7 <= 32'b0;
            BusMuxIn_R8 <= 32'b0;
            BusMuxIn_R9 <= 32'b0;
            BusMuxIn_R10 <= 32'b0;
            BusMuxIn_R11 <= 32'b0;
            BusMuxIn_R12 <= 32'b0;
            BusMuxIn_R13 <= 32'b0;
            BusMuxIn_R14 <= 32'b0;
            BusMuxIn_R15 <= 32'b0;
        end else begin
            if (R0_in) BusMuxIn_R0 <= BusMuxOut;
            if (R1_in) BusMuxIn_R1 <= BusMuxOut;
            if (R2_in) BusMuxIn_R2 <= BusMuxOut;
            if (R3_in) BusMuxIn_R3 <= BusMuxOut;
            if (R4_in) BusMuxIn_R4 <= BusMuxOut;
            if (R5_in) BusMuxIn_R5 <= BusMuxOut;
            if (R6_in) BusMuxIn_R6 <= BusMuxOut;
            if (R7_in) BusMuxIn_R7 <= BusMuxOut;
            if (R8_in) BusMuxIn_R8 <= BusMuxOut;
            if (R9_in) BusMuxIn_R9 <= BusMuxOut;
            if (R10_in) BusMuxIn_R10 <= BusMuxOut;
            if (R11_in) BusMuxIn_R11 <= BusMuxOut;
            if (R12_in) BusMuxIn_R12 <= BusMuxOut;
            if (R13_in) BusMuxIn_R13 <= BusMuxOut;
            if (R14_in) BusMuxIn_R14 <= BusMuxOut;
            if (R15_in) BusMuxIn_R15 <= BusMuxOut;
        end
    end

endmodule