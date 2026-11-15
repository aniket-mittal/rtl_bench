module origen_065249(
    input [5:0] OPCODE,
    input lw_hazard,
    output reg regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch,
    output reg [1:0] aluop
);

    // Instruction type parameters
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter R_TYPE = 6'b000000;
    parameter I_TYPE = 6'b001000;

    [MASKED]
endmodule