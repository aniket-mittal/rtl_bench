module origen_101744(
    input [5:0] ins_H,
    input [5:0] ins_L,
    output reg RegDst,
    output reg RegWrite,
    output reg ALUSrc,
    output reg MemWrite,
    output reg MemRead,
    output reg MemToReg,
    output reg PCSrc,
    output reg Branch,
    output reg [2:0] outOp,
    output reg FPO
);

reg [1:0] ALUOp;

always @(*) begin
    // Default values
    RegDst = 0;
    RegWrite = 0;
    ALUSrc = 0;
    MemWrite = 0;
    MemRead = 0;
    MemToReg = 0;
    PCSrc = 0;
    Branch = 0;
    ALUOp = 2'b00;
    FPO = 0;

    case(ins_H)
        6'b000000: begin // R-type
            RegDst = 1;
            RegWrite = 1;
            ALUOp = 2'b10;
        end
        6'b100011: begin // lw
            ALUSrc = 1;
            MemRead = 1;
            MemToReg = 1;
            RegWrite = 1;
        end
        6'b101011: begin // sw
            ALUSrc = 1;
            MemWrite = 1;
        end
        6'b000100: begin // beq
            Branch = 1;
            ALUOp = 2'b01;
        end
        6'b000010: begin // j
            PCSrc = 1;
        end
        6'b001000: begin // addi
            ALUSrc = 1;
            RegWrite = 1;
        end
        6'b001100: begin // andi
            ALUSrc = 1;
            RegWrite = 1;
            ALUOp = 2'b11;
        end
        6'b000101: begin // bne
            Branch = 1;
            ALUOp = 2'b01;
        end
        6'b110000: begin // Floating point operation
            FPO = 1;
            RegWrite = 1;
        end
        default: begin
            // Default behavior for undefined instructions
        end
    endcase
end

always @(*) begin
    case(ALUOp)
        2'b00: outOp = 3'b010; // add
        2'b01: outOp = 3'b110; // sub
        2'b10: begin
            case(ins_L)
                6'b100000: outOp = 3'b010; // add
                6'b100010: outOp = 3'b110; // sub
                6'b100100: outOp = 3'b000; // and
                6'b100101: outOp = 3'b001; // or
                6'b101010: outOp = 3'b111; // slt
                default:   outOp = 3'b010; // default to add
            endcase
        end
        2'b11: outOp = 3'b000; // and (for andi)
        default: outOp = 3'b010; // default to add
    endcase
end

endmodule