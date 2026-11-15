module origen_052328(
    input [5:0] OpCode,
    input [5:0] Funct,
    input Interrupt,
    output reg [2:0] PCSrc,
    output reg Branch,
    output reg RegWrite,
    output reg [1:0] RegDst,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemtoReg,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg ExtOp,
    output reg LuOp,
    output reg [3:0] ALUOp,
    output reg BadOp
);

    always @(*) begin
        // Default values
        PCSrc = 3'b000;
        Branch = 1'b0;
        RegWrite = 1'b0;
        RegDst = 2'b00;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 2'b00;
        ALUSrc1 = 1'b0;
        ALUSrc2 = 1'b0;
        ExtOp = 1'b0;
        LuOp = 1'b0;
        ALUOp = 4'b0000;
        BadOp = 1'b0;

        case(OpCode)
            6'b000000: begin // R-type instructions
                RegWrite = 1'b1;
                RegDst = 2'b01;
                ALUOp = {1'b1, Funct[3:1]};
            end
            6'b100011: begin // lw
                RegWrite = 1'b1;
                MemRead = 1'b1;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b1;
                MemtoReg = 2'b01;
                ALUOp = 4'b0000;
            end
            6'b101011: begin // sw
                MemWrite = 1'b1;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b1;
                ALUOp = 4'b0000;
            end
            6'b000100: begin // beq
                Branch = 1'b1;
                ALUOp = 4'b0001;
            end
            6'b000101: begin // bne
                Branch = 1'b1;
                ALUOp = 4'b0001;
            end
            6'b001000: begin // addi
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b1;
                ALUOp = 4'b0000;
            end
            6'b001101: begin // ori
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                ALUOp = 4'b0011;
            end
            6'b001111: begin // lui
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                LuOp = 1'b1;
                ALUOp = 4'b0000;
            end
            6'b000010: begin // j
                PCSrc = 3'b010;
            end
            6'b000011: begin // jal
                PCSrc = 3'b010;
                RegWrite = 1'b1;
                RegDst = 2'b10;
                MemtoReg = 2'b10;
            end
            default: begin
                BadOp = 1'b1;
            end
        endcase

        if (Interrupt) begin
            PCSrc = 3'b100;
        end
    end

endmodule