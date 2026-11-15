module origen_115286 (
    input [5:0] Opcode,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg Jump,
    output reg SignZero,
    output reg [1:0] ALUOp
);

    always @(*) begin
        casex(Opcode)
            6'b000000: begin // R-type
                RegDst = 1'b1;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                SignZero = 1'b0;
                ALUOp = 2'b10;
            end
            6'b100011: begin // Load word
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                SignZero = 1'b0;
                ALUOp = 2'b00;
            end
            6'b101011: begin // Store word
                RegDst = 1'bx;
                ALUSrc = 1'b1;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                SignZero = 1'b0;
                ALUOp = 2'b00;
            end
            6'b000101: begin // Branch not equal
                RegDst = 1'bx;
                ALUSrc = 1'b0;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                Jump = 1'b0;
                SignZero = 1'b0;
                ALUOp = 2'b01;
            end
            6'b001110: begin // XORI
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                SignZero = 1'b1;
                ALUOp = 2'b11;
            end
            6'b000010: begin // Jump
                RegDst = 1'bx;
                ALUSrc = 1'bx;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b1;
                SignZero = 1'b0;
                ALUOp = 2'bxx;
            end
            default: begin
                RegDst = 1'b0;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                SignZero = 1'b0;
                ALUOp = 2'b10;
            end
        endcase
    end

endmodule