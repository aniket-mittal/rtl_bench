module origen_207874(
    input [5:0] Op,
    input [5:0] Funct,
    output reg RegWrite,
    output reg ALUSrc,
    output reg RegDst,
    output reg Branch,
    output reg MemWrite,
    output reg MemtoReg,
    output reg Jump,
    output reg [5:0] ALUControl
);

    parameter OP_RTYPE = 6'b000000;
    parameter OP_LW = 6'b100011;
    parameter OP_SW = 6'b101011;
    parameter OP_BEQ = 6'b000100;
    parameter OP_ADDI = 6'b001000;
    parameter OP_J = 6'b000010;

    always @(*) begin
        // Instruction Decoding
        case (Op)
            OP_RTYPE: begin
                RegWrite = 1'b1;
                ALUSrc = 1'b0;
                RegDst = 1'b1;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                Jump = 1'b0;
                ALUControl = Funct;
            end
            OP_LW: begin
                RegWrite = 1'b1;
                ALUSrc = 1'b1;
                RegDst = 1'b0;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                Jump = 1'b0;
                ALUControl = 6'b100000;
            end
            OP_SW: begin
                RegWrite = 1'b0;
                ALUSrc = 1'b1;
                RegDst = 1'bx;
                Branch = 1'b0;
                MemWrite = 1'b1;
                MemtoReg = 1'bx;
                Jump = 1'b0;
                ALUControl = 6'b100000;
            end
            OP_BEQ: begin
                RegWrite = 1'b0;
                ALUSrc = 1'b0;
                RegDst = 1'bx;
                Branch = 1'b1;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                Jump = 1'b0;
                ALUControl = 6'b100010;
            end
            OP_ADDI: begin
                RegWrite = 1'b1;
                ALUSrc = 1'b1;
                RegDst = 1'b0;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                Jump = 1'b0;
                ALUControl = 6'b100000;
            end
            OP_J: begin
                RegWrite = 1'b0;
                ALUSrc = 1'b0;
                RegDst = 1'bx;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'bx;
                Jump = 1'b1;
                ALUControl = 6'bxxxxxx;
            end
            default: begin
                RegWrite = 1'b0;
                ALUSrc = 1'b0;
                RegDst = 1'b0;
                Branch = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                Jump = 1'b0;
                ALUControl = 6'bxxxxxx;
            end
        endcase
    end

endmodule