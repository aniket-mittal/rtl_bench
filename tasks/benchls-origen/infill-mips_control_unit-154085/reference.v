module origen_154085(
    input [5:0] opCode,
    output reg PCSrc,
    output reg RegWrite,
    output reg RegDst,
    output reg ALUSrc,
    output reg Branch,
    output reg MemWrite,
    output reg MemRead,
    output reg MemToReg,
    output reg zeroExt,
    output reg [3:0] ALUOp
);

    initial begin
        PCSrc = 0;
        RegWrite = 0;
        RegDst = 0;
        ALUSrc = 0;
        Branch = 0;
        MemWrite = 0;
        MemRead = 0;
        MemToReg = 0;
        zeroExt = 0;
        ALUOp = 4'b0000;
    end

    always @(*) begin
        case (opCode)
            6'b000000: begin // R-type
                PCSrc = 0;
                RegWrite = 1;
                RegDst = 1;
                ALUSrc = 0;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                zeroExt = 0;
                ALUOp = 4'b0010;
            end
            6'b100011: begin // Load Word (LW)
                PCSrc = 0;
                RegWrite = 1;
                RegDst = 0;
                ALUSrc = 1;
                Branch = 0;
                MemWrite = 0;
                MemRead = 1;
                MemToReg = 1;
                zeroExt = 1;
                ALUOp = 4'b0000;
            end
            6'b101011: begin // Store Word (SW)
                PCSrc = 0;
                RegWrite = 0;
                RegDst = 0;
                ALUSrc = 1;
                Branch = 0;
                MemWrite = 1;
                MemRead = 0;
                MemToReg = 0;
                zeroExt = 1;
                ALUOp = 4'b0000;
            end
            6'b000100: begin // Branch Equal (BEQ)
                PCSrc = 1;
                RegWrite = 0;
                RegDst = 0;
                ALUSrc = 0;
                Branch = 1;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                zeroExt = 0;
                ALUOp = 4'b0001;
            end
            default: begin
                PCSrc = 0;
                RegWrite = 0;
                RegDst = 0;
                ALUSrc = 0;
                Branch = 0;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                zeroExt = 0;
                ALUOp = 4'b0000;
            end
        endcase
    end

endmodule