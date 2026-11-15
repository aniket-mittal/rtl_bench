module origen_211217(
    input [5:0] Op_i,
    output reg FlushMUX_o,
    output reg jumpCtrl_o,
    output reg brenchCtrl_o,
    output reg [1:0] WB_o,
    output reg [3:0] EX_o,
    output reg [1:0] MEM_o
);

    reg ALUSrc;
    reg [1:0] ALUOp;
    reg RegDst;
    reg MemWrite;
    reg MemRead;
    reg RegWrite;
    reg MemtoReg;

    always @(*) begin
        case (Op_i)
            6'b000000: begin // R-type
                ALUSrc = 1'b0;
                ALUOp = 2'b10;
                RegDst = 1'b1;
                MemWrite = 1'b0;
                MemRead = 1'b0;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
            end
            6'b001000: begin // ADDI
                ALUSrc = 1'b1;
                ALUOp = 2'b00;
                RegDst = 1'b0;
                MemWrite = 1'b0;
                MemRead = 1'b0;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
            end
            6'b100011: begin // LW
                ALUSrc = 1'b1;
                ALUOp = 2'b00;
                RegDst = 1'b0;
                MemWrite = 1'b0;
                MemRead = 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b1;
            end
            6'b101011: begin // SW
                ALUSrc = 1'b1;
                ALUOp = 2'b00;
                RegDst = 1'b0;
                MemWrite = 1'b1;
                MemRead = 1'b0;
                RegWrite = 1'b0;
                MemtoReg = 1'b0;
            end
            6'b000100: begin // BEQ
                ALUSrc = 1'b0;
                ALUOp = 2'b01;
                RegDst = 1'b0;
                MemWrite = 1'b0;
                MemRead = 1'b0;
                RegWrite = 1'b0;
                MemtoReg = 1'b0;
            end
            6'b000010: begin // J
                ALUSrc = 1'b0;
                ALUOp = 2'b00;
                RegDst = 1'b0;
                MemWrite = 1'b0;
                MemRead = 1'b0;
                RegWrite = 1'b0;
                MemtoReg = 1'b0;
            end
            default: begin
                ALUSrc = 1'b0;
                ALUOp = 2'b00;
                RegDst = 1'b0;
                MemWrite = 1'b0;
                MemRead = 1'b0;
                RegWrite = 1'b0;
                MemtoReg = 1'b0;
            end
        endcase

        FlushMUX_o = 1'b0;
        jumpCtrl_o = (Op_i == 6'b000010) ? 1'b1 : 1'b0;
        brenchCtrl_o = (Op_i == 6'b000100) ? 1'b1 : 1'b0;
        WB_o = {RegWrite, MemtoReg};
        EX_o = {ALUSrc, ALUOp, RegDst};
        MEM_o = {MemRead, MemWrite};
    end
endmodule