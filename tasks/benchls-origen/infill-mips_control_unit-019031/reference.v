module origen_019031(
    input [31:26] instruction,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

    initial begin
        Branch = 0;
        Jump = 0;
    end

    always @(*) begin
        case(instruction)
            6'b000000: begin // R-type
                RegDst = 1;
                Jump = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b10;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 1;
            end
            6'b001000: begin // ADDI
                RegDst = 0;
                Jump = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end
            6'b101011: begin // SW
                RegDst = 1'bx;
                Jump = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 1'bx;
                ALUOp = 2'b00;
                MemWrite = 1;
                ALUSrc = 1;
                RegWrite = 0;
            end
            6'b100011: begin // LW
                RegDst = 0;
                Jump = 0;
                Branch = 0;
                MemRead = 1;
                MemtoReg = 1;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end
            6'b000100: begin // BEQ
                RegDst = 1'bx;
                Jump = 0;
                Branch = 1;
                MemRead = 0;
                MemtoReg = 1'bx;
                ALUOp = 2'b01;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
            end
            6'b000010: begin // J
                RegDst = 1'bx;
                Jump = 1;
                Branch = 1'bx;
                MemRead = 1'bx;
                MemtoReg = 1'bx;
                ALUOp = 2'bxx;
                MemWrite = 1'bx;
                ALUSrc = 1'bx;
                RegWrite = 1'bx;
            end
            default: begin
                RegDst = 1'bx;
                Jump = 1'bx;
                Branch = 1'bx;
                MemRead = 1'bx;
                MemtoReg = 1'bx;
                ALUOp = 2'bxx;
                MemWrite = 1'bx;
                ALUSrc = 1'bx;
                RegWrite = 1'bx;
            end
        endcase
    end
endmodule