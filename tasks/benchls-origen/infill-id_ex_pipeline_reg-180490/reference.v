module origen_180490(
    input Reset,
    input [1:0] WB,
    input [1:0] Mem,
    input [6:0] EX,
    input [31:0] PC_id,
    input [31:0] Imm_id,
    input [4:0] rdAddr_id,
    input [4:0] rs1Addr_id,
    input [4:0] rs2Addr_id,
    input [31:0] rs1Data_id,
    input [31:0] rs2Data_id,
    input clk,

    output reg [1:0] WB_out_ID_EX,
    output reg [1:0] Mem_out_ID_EX,
    output reg [6:0] EX_out,
    output reg [31:0] PC_ex,
    output reg [31:0] Imm_ex,
    output reg [4:0] rdAddr_ex,
    output reg [4:0] rs1Addr_ex,
    output reg [4:0] rs2Addr_ex,
    output reg [31:0] rs1Data_ex,
    output reg [31:0] rs2Data_ex
);

    always @(posedge clk) begin
        if (Reset) begin
            WB_out_ID_EX <= 0;
            Mem_out_ID_EX <= 0;
            EX_out <= 0;
            PC_ex <= 0;
            Imm_ex <= 0;
            rdAddr_ex <= 0;
            rs1Addr_ex <= 0;
            rs2Addr_ex <= 0;
            rs1Data_ex <= 0;
            rs2Data_ex <= 0;
        end else begin
            WB_out_ID_EX <= WB;
            Mem_out_ID_EX <= Mem;
            EX_out <= EX;
            PC_ex <= PC_id;
            Imm_ex <= Imm_id;
            rdAddr_ex <= rdAddr_id;
            rs1Addr_ex <= rs1Addr_id;
            rs2Addr_ex <= rs2Addr_id;
            rs1Data_ex <= rs1Data_id;
            rs2Data_ex <= rs2Data_id;
        end
    end

endmodule