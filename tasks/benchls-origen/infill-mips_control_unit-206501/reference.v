module origen_206501(
    input [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [2:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg Branch_o,
    output reg MemWrite_o,
    output reg MemRead_o,
    output reg MemToReg_o,
    output reg Jump_o
);

    reg R_format, beq, addi, slti, lui, ori, bne, lw, sw, j;

    always @(*) begin
        // Decode instruction opcode
        R_format = (instr_op_i == 6'b000000);
        beq = (instr_op_i == 6'b000100);
        addi = (instr_op_i == 6'b001000);
        slti = (instr_op_i == 6'b001010);
        lui = (instr_op_i == 6'b001111);
        ori = (instr_op_i == 6'b001101);
        bne = (instr_op_i == 6'b000101);
        lw = (instr_op_i == 6'b100011);
        sw = (instr_op_i == 6'b101011);
        j = (instr_op_i == 6'b000010);

        // Assign control signals
        RegDst_o = R_format;
        ALUSrc_o = addi | slti | lui | ori | lw | sw;
        Branch_o = beq | bne;
        RegWrite_o = ~(Branch_o | sw | j);
        MemWrite_o = sw;
        MemRead_o = lw;
        MemToReg_o = ~lw;
        Jump_o = j;

        // Assign ALU operation
        case (instr_op_i)
            6'b000000: ALU_op_o = 3'b010; // R-format (add)
            6'b000100: ALU_op_o = 3'b001; // beq
            6'b000101: ALU_op_o = 3'b001; // bne
            6'b001000: ALU_op_o = 3'b000; // addi
            6'b001010: ALU_op_o = 3'b111; // slti
            6'b001111: ALU_op_o = 3'b100; // lui
            6'b001101: ALU_op_o = 3'b011; // ori
            6'b100011: ALU_op_o = 3'b000; // lw
            6'b101011: ALU_op_o = 3'b000; // sw
            default:   ALU_op_o = 3'b000; // Default to add
        endcase
    end

endmodule