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

[MASKED]

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