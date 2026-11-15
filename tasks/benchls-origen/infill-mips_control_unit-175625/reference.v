module origen_175625(
    input [5:0] op,
    output reg [1:0] RegDst,
    output reg Jump, Branch, MemtoReg, 
    output reg [3:0] ALUOp,
    output reg MemWrite, ALUSrc, RegWrite, PCToReg,
    output reg ExtMode
);

    always @(*) begin
        case (op)
            6'b000000: begin // R-type instruction
                RegDst = 2'b01;
                ALUOp = 4'b0010;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                PCToReg = 1'b0;
                ExtMode = 1'b1;
            end
            6'b000101: begin // Branch on equal
                RegDst = 2'b00;
                ALUOp = 4'b0001;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                Jump = 1'b0;
                PCToReg = 1'b0;
                ExtMode = 1'b1;
            end
            6'b000011: begin // Jump
                RegDst = 2'b10;
                ALUOp = 4'bxxxx;
                ALUSrc = 1'bx;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b1;
                PCToReg = 1'b1;
                ExtMode = 1'bx;
            end
            6'b001110: begin // Load upper immediate
                RegDst = 2'b01;
                ALUOp = 4'b0011;
                ALUSrc = 1'b1;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                PCToReg = 1'b0;
                ExtMode = 1'b0;
            end
            6'b001010: begin // Add immediate
                RegDst = 2'b01;
                ALUOp = 4'b0100;
                ALUSrc = 1'b1;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                PCToReg = 1'b0;
                ExtMode = 1'b1;
            end
            6'b001100: begin // Logical AND
                RegDst = 2'b01;
                ALUOp = 4'b1000;
                ALUSrc = 1'b1;
                MemtoReg = 1'b0;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                PCToReg = 1'b0;
                ExtMode = 1'bx;
            end
            6'b000100: begin // Branch on not equal
                RegDst = 2'b00;
                ALUOp = 4'b0001;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                Jump = 1'b0;
                PCToReg = 1'b0;
                ExtMode = 1'b1;
            end
            default: begin
                RegDst = 2'bxx;
                ALUOp = 4'bxxxx;
                ALUSrc = 1'bx;
                MemtoReg = 1'bx;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                PCToReg = 1'b0;
                ExtMode = 1'bx;
            end
        endcase
    end

endmodule