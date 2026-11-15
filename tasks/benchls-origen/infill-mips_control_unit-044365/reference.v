module origen_044365(
    input [5:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg bne,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUsrc,
    output reg RegWrite,
    output reg [1:0] ALUop
);

    initial begin
        RegDst = 0;
        Jump = 0;
        Branch = 0;
        bne = 0;
        MemRead = 0;
        MemtoReg = 0;
        MemWrite = 0;
        ALUsrc = 0;
        RegWrite = 0;
        ALUop = 2'b00;
    end

    always @(*) begin
        RegDst = 0;
        Jump = 0;
        Branch = 0;
        bne = 0;
        MemRead = 0;
        MemtoReg = 0;
        MemWrite = 0;
        ALUsrc = 0;
        RegWrite = 0;
        ALUop = 2'b00;

        case(opcode)
            6'h00: begin // R-type
                RegDst = 1;
                ALUop = 2'b10;
                RegWrite = 1;
            end
            6'h08: begin // ADDI
                ALUsrc = 1;
                RegWrite = 1;
            end
            6'h0C: begin // ANDI
                ALUop = 2'b11;
                ALUsrc = 1;
                RegWrite = 1;
            end
            6'h04: begin // BEQ
                Branch = 1;
                ALUop = 2'b01;
            end
            6'h05: begin // BNE
                bne = 1;
                ALUop = 2'b01;
            end
            6'h02: begin // JUMP
                Jump = 1;
            end
            6'h23: begin // LW
                MemRead = 1;
                MemtoReg = 1;
                ALUsrc = 1;
                RegWrite = 1;
            end
            6'h2B: begin // SW
                MemWrite = 1;
                ALUsrc = 1;
            end
            default: begin
                RegDst = 0;
                Jump = 0;
                Branch = 0;
                bne = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                ALUsrc = 0;
                RegWrite = 0;
                ALUop = 2'b00;
            end
        endcase
    end

endmodule