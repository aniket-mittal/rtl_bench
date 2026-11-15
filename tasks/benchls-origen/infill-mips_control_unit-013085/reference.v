module origen_013085 (
    input [5:0] Op_i,
    output reg Jump_o,
    output reg Branch_o,
    output reg [7:0] Control_o
);

    reg ALUSrc, RegDst, MemRead, MemtoReg, MemWrite, RegWrite;
    reg [1:0] ALUOp;

    always @(*) begin
        // Default values
        {Jump_o, Branch_o, RegWrite, MemtoReg, MemRead, MemWrite, ALUSrc, ALUOp, RegDst} = 10'b0;

        case (Op_i)
            6'b000000: begin // R-type
                RegWrite = 1'b1;
                ALUOp = 2'b11;
                RegDst = 1'b1;
            end
            6'b000010: begin // Jump
                Jump_o = 1'b1;
            end
            6'b000100: begin // Branch
                Branch_o = 1'b1;
                ALUOp = 2'b01;
            end
            6'b001000: begin // ADDI
                RegWrite = 1'b1;
                ALUSrc = 1'b1;
            end
            6'b001101: begin // ORI
                RegWrite = 1'b1;
                ALUSrc = 1'b1;
                ALUOp = 2'b10;
            end
            6'b100011: begin // LW
                RegWrite = 1'b1;
                MemtoReg = 1'b1;
                MemRead = 1'b1;
                ALUSrc = 1'b1;
            end
            6'b101011: begin // SW
                MemWrite = 1'b1;
                ALUSrc = 1'b1;
            end
            default: begin
                {Jump_o, Branch_o, RegWrite, MemtoReg, MemRead, MemWrite, ALUSrc, ALUOp, RegDst} = 10'b0;
            end
        endcase

        Control_o = {RegWrite, MemtoReg, MemRead, MemWrite, ALUSrc, ALUOp, RegDst};
    end

endmodule