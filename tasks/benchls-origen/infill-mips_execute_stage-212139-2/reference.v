module origen_212139(
    input clk,
    input rst,
    input [31:0] DX_PC,
    input DX_Branch,
    input DX_MemWrite, DX_MemToReg, DX_RegWrite,
    input lhWrite, lhRead, mflo,
    input ALUSrc,
    input [3:0] ALUCtr,
    input [4:0] DX_RD,
    input [31:0] A, B, Imm,
    output [31:0] BAddr,
    output XF_Branch,
    output XM_MemWrite, XM_MemToReg, XM_RegWrite,
    output [4:0] XM_RD,
    output [31:0] XM_B, ALUout
);

    // Branch address calculation and branch condition evaluation
    assign BAddr = DX_PC + (Imm << 2);
    assign XF_Branch = DX_Branch && (A == B);

    // Low/high register write/read operations
    reg [31:0] LO, HI;
    always @(posedge clk) begin
        if (lhWrite) begin
            LO <= A;
            HI <= B;
        end
    end
    assign ALUout = lhRead ? (mflo ? LO : HI) : 32'b0;

    // ALU operations
    reg [31:0] ALUResult;
    always @(*) begin
        case (ALUCtr)
            4'b0000: ALUResult = A & B;    // AND
            4'b0001: ALUResult = A | B;    // OR
            4'b0010: ALUResult = A + B;    // ADD
            4'b0110: ALUResult = A - B;    // SUB
            4'b0111: ALUResult = (A < B) ? 32'd1 : 32'd0; // SLT
            default: ALUResult = 32'b0;
        endcase
    end
    assign XM_B = B;
    assign ALUout = ALUSrc ? Imm : ALUResult;

    // Control signal updates
    assign XM_MemWrite = DX_MemWrite;
    assign XM_MemToReg = DX_MemToReg;
    assign XM_RegWrite = DX_RegWrite;
    assign XM_RD = DX_RD;

endmodule