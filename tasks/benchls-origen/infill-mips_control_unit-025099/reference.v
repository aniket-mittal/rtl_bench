module origen_025099(
    input [5:0] op,
    input [5:0] func,
    output reg Branch,
    output reg Jump,
    output reg RegDst,
    output reg ALUSrc,
    output reg [3:0] ALUctr,
    output reg MemtoReg,
    output reg RegWr,
    output reg MemWr,
    output reg ExtOp
);

    // Instruction type parameters
    parameter R = 6'b000000;
    parameter ADDI = 6'b001000;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter J = 6'b000010;
    parameter ORI = 6'b001101;
    parameter ADDIU = 6'b001001;
    parameter LUI = 6'b001111;

    // R-type function codes
    parameter ADD = 6'b100000;
    parameter ADDU = 6'b100001;
    parameter SUB = 6'b100010;
    parameter SUBU = 6'b100011;
    parameter SLT = 6'b101010;
    parameter SLTU = 6'b101011;
    parameter AND = 6'b100100;
    parameter OR = 6'b100101;

    always @(*) begin
        case(op)
            R: begin
                Branch = 0;
                Jump = 0;
                RegDst = 1;
                ALUSrc = 0;
                MemtoReg = 0;
                RegWr = 1;
                MemWr = 0;
                ExtOp = 1;
                case(func)
                    ADD, ADDU: ALUctr = 4'b0000;
                    SUB, SUBU: ALUctr = 4'b0100;
                    AND: ALUctr = 4'b0010;
                    OR: ALUctr = 4'b0011;
                    SLT: ALUctr = 4'b0111;
                    SLTU: ALUctr = 4'b0110;
                    default: ALUctr = 4'b0000;
                endcase
            end
            ADDI: begin
                Branch = 0;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 1;
                ALUctr = 4'b0001;
                MemtoReg = 0;
                RegWr = 1;
                MemWr = 0;
                ExtOp = 1;
            end
            LW: begin
                Branch = 0;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 1;
                ALUctr = 4'b0000;
                MemtoReg = 1;
                RegWr = 1;
                MemWr = 0;
                ExtOp = 1;
            end
            SW: begin
                Branch = 0;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 1;
                ALUctr = 4'b0000;
                MemtoReg = 0;
                RegWr = 0;
                MemWr = 1;
                ExtOp = 1;
            end
            BEQ: begin
                Branch = 1;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 0;
                ALUctr = 4'b0100;
                MemtoReg = 0;
                RegWr = 0;
                MemWr = 0;
                ExtOp = 1;
            end
            J: begin
                Branch = 0;
                Jump = 1;
                RegDst = 0;
                ALUSrc = 0;
                ALUctr = 4'b0000;
                MemtoReg = 0;
                RegWr = 0;
                MemWr = 0;
                ExtOp = 0;
            end
            ORI: begin
                Branch = 0;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 1;
                ALUctr = 4'b0011;
                MemtoReg = 0;
                RegWr = 1;
                MemWr = 0;
                ExtOp = 0;
            end
            ADDIU: begin
                Branch = 0;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 1;
                ALUctr = 4'b0000;
                MemtoReg = 0;
                RegWr = 1;
                MemWr = 0;
                ExtOp = 1;
            end
            LUI: begin
                Branch = 0;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 1;
                ALUctr = 4'b1000;
                MemtoReg = 0;
                RegWr = 1;
                MemWr = 0;
                ExtOp = 0;
            end
            default: begin
                Branch = 0;
                Jump = 0;
                RegDst = 0;
                ALUSrc = 0;
                ALUctr = 4'b0000;
                MemtoReg = 0;
                RegWr = 0;
                MemWr = 0;
                ExtOp = 0;
            end
        endcase
    end

endmodule