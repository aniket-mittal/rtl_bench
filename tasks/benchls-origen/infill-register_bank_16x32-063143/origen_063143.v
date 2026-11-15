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

    [MASKED]

endmodule