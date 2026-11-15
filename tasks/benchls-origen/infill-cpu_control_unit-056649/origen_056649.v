module origen_056649(
    input [7:0] IR_opcode,
    input [3:0] IR_oldopcode,
    input EXEC1, EXEC2, EXEC3,
    input EQ, MI,
    input [3:0] CMPFlag,
    output reg PC_sync_load,
    output reg PC_count_enable,
    output reg [1:0] MUX1_select,
    output reg RAM_write_enable,
    output reg [1:0] MUX2sel,
    output reg [1:0] MUXLsel,
    output reg EXTRA1, EXTRA2,
    output reg [1:0] SpMux,
    output reg [1:0] SP_Cnt,
    output reg pushpop,
    output reg ldnsel
);

    // Instruction decoding
    wire LDA = (IR_opcode[7:4] == 4'b0000);
    wire STA = (IR_opcode[7:4] == 4'b0001);
    wire ADD = (IR_opcode[7:4] == 4'b0010);
    wire SUB = (IR_opcode[7:4] == 4'b0011);
    wire AND = (IR_opcode[7:4] == 4'b0100);
    wire OR  = (IR_opcode[7:4] == 4'b0101);
    wire XOR = (IR_opcode[7:4] == 4'b0110);
    wire INC = (IR_opcode == 8'b01110000);
    wire DEC = (IR_opcode == 8'b01110001);
    wire NOT = (IR_opcode == 8'b01110010);
    wire SHL = (IR_opcode == 8'b01110011);
    wire SHR = (IR_opcode == 8'b01110100);
    wire JMP = (IR_opcode[7:4] == 4'b1000);
    wire BEQ = (IR_opcode[7:4] == 4'b1001);
    wire BNE = (IR_opcode[7:4] == 4'b1010);
    wire BLT = (IR_opcode[7:4] == 4'b1011);
    wire BGT = (IR_opcode[7:4] == 4'b1100);
    wire CALL = (IR_opcode[7:4] == 4'b1101);
    wire RET = (IR_opcode == 8'b11100000);
    wire PUSH = (IR_opcode == 8'b11110000);
    wire POP = (IR_opcode == 8'b11110001);

    wire LDN_old = (IR_oldopcode == 4'b1111);

    [MASKED]

endmodule