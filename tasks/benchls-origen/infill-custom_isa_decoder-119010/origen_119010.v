module origen_119010(
    input [31:0] instr,
    output [5:0] rs, rt, rd,
    output [14:0] imm,
    output reg [3:0] ALUopsel,
    output MUXsel1,
    output reg MUXsel2,
    output reg REGwrite,
    output reg MEMwrite
);

    assign MUXsel1 = instr[31];
    assign rs = instr[30:25];
    assign rd = instr[24:19];
    assign rt = instr[14:9];
    assign imm = instr[14:0];

    [MASKED]

endmodule