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

    always @(posedge clk) begin
        if (Reset) begin
            PCSrc_out <= 0;
            RegDst_out <= 0;
            RegWr_out <= 0;
            ALUSrc1_out <= 0;
            ALUSrc2_out <= 0;
            ALUFun_out <= 4'b0000;
            Sign_out <= 0;
            MemWr_out <= 0;
            MemRd_out <= 0;
            MemToReg_out <= 0;
            PC4_out <= PC4_in;
            R1_out <= 32'b0;
            R2_out <= 32'b0;
            Imm_out <= 32'b0;
            RdAdress_out <= 5'b0;
        end
        else begin
            PCSrc_out <= PCSrc_in;
            RegDst_out <= RegDst_in;
            RegWr_out <= RegWr_in;
            ALUSrc1_out <= ALUSrc1_in;
            ALUSrc2_out <= ALUSrc2_in;
            ALUFun_out <= ALUFun_in;
            Sign_out <= Sign_in;
            MemWr_out <= MemWr_in;
            MemRd_out <= MemRd_in;
            MemToReg_out <= MemToReg_in;
            PC4_out <= PC4_in;
            R1_out <= R1_in;
            R2_out <= R2_in;
            Imm_out <= Imm_in;
            RdAdress_out <= RdAdress_in;
        end
    end

endmodule