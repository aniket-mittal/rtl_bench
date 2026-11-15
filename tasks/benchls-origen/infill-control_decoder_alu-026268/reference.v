module origen_026268 (
    input [5:0] op,
    input zero,
    output reg [2:0] ALUOp,
    output RegDst, InsMemRW, ExtSel, DataMemRW, ALUM2Reg, ALUSrcB, PCSrc, RegWre, PCWre
);

    // Instruction flags
    wire is_add, is_addi, is_sub, is_ori, is_and, is_or, is_move, is_sw, is_lw, is_beq, is_halt;

    // Decode instructions
    assign is_add  = (op == 6'b000000);
    assign is_addi = (op == 6'b000001);
    assign is_sub  = (op == 6'b000010);
    assign is_ori  = (op == 6'b000011);
    assign is_and  = (op == 6'b000100);
    assign is_or   = (op == 6'b000101);
    assign is_move = (op == 6'b000110);
    assign is_sw   = (op == 6'b000111);
    assign is_lw   = (op == 6'b001000);
    assign is_beq  = (op == 6'b001001);
    assign is_halt = (op == 6'b001010);

    // Generate ALUOp
    always @(*) begin
        case (1'b1)
            is_add:  ALUOp = 3'b000;
            is_addi: ALUOp = 3'b000;
            is_sub:  ALUOp = 3'b001;
            is_ori:  ALUOp = 3'b010;
            is_and:  ALUOp = 3'b011;
            is_or:   ALUOp = 3'b010;
            is_move: ALUOp = 3'b100;
            is_sw:   ALUOp = 3'b000;
            is_lw:   ALUOp = 3'b000;
            is_beq:  ALUOp = 3'b001;
            default: ALUOp = 3'b000;
        endcase
    end

    // Generate control signals
    assign PCWre     = ~is_halt;
    assign ALUSrcB   = is_addi | is_ori | is_sw | is_lw;
    assign ALUM2Reg  = is_lw;
    assign RegWre    = ~(is_beq | is_sw | is_halt);
    assign InsMemRW  = 1'b0;
    assign DataMemRW = is_sw;
    assign ExtSel    = is_addi | is_sw | is_lw | is_beq;
    assign RegDst    = is_add | is_sub | is_and | is_or | is_move;
    assign PCSrc     = is_beq & zero;

endmodule