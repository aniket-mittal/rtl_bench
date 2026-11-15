module origen_067324 (
    input wire clk,
    input wire Reset,
    input wire PCSrc_in, RegDst_in, RegWr_in, ALUSrc1_in, ALUSrc2_in, Sign_in, MemWr_in, MemRd_in, MemToReg_in,
    input wire [3:0] ALUFun_in,
    input wire [31:0] PC4_in, R1_in, R2_in, Imm_in,
    input wire [4:0] RdAdress_in,
    
    output reg PCSrc_out, RegDst_out, RegWr_out, ALUSrc1_out, ALUSrc2_out, Sign_out, MemWr_out, MemRd_out, MemToReg_out,
    output reg [3:0] ALUFun_out,
    output reg [31:0] PC4_out, R1_out, R2_out, Imm_out,
    output reg [4:0] RdAdress_out
);

    [MASKED]

endmodule