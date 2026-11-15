module origen_185097(
    Opcode,
    RegDst,
    ALUSrc,
    MemtoReg,
    RegWrite,
    MemRead,
    MemWrite,
    Branch,
    ALUOp,
    Jump,
    SignZero
);

    input [5:0] Opcode;
    output reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, SignZero;
    output reg [1:0] ALUOp;

    always @(*) begin
        casex (Opcode)
            6'b000000: begin // R-type
                RegDst = 1'b1;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUOp = 2'b10;
                Jump = 1'b0;
                SignZero = 1'b0;
            end
            6'b100011: begin // Load Word (lw)
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUOp = 2'b00;
                Jump = 1'b0;
                SignZero = 1'b1;
            end
            6'b101011: begin // Store Word (sw)
                RegDst = 1'bx;
                ALUSrc = 1'b1;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                Branch = 1'b0;
                ALUOp = 2'b00;
                Jump = 1'b0;
                SignZero = 1'b1;
            end
            6'b000100: begin // Branch Equal (beq)
                RegDst = 1'bx;
                ALUSrc = 1'b0;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                ALUOp = 2'b01;
                Jump = 1'b0;
                SignZero = 1'b0;
            end
            6'b000010: begin // Jump (j)
                RegDst = 1'bx;
                ALUSrc = 1'bx;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUOp = 2'bxx;
                Jump = 1'b1;
                SignZero = 1'bx;
            end
            default: begin
                RegDst = 1'bx;
                ALUSrc = 1'bx;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ALUOp = 2'bxx;
                Jump = 1'b0;
                SignZero = 1'bx;
            end
        endcase
    end

endmodule