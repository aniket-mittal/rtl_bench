module origen_164727(
    input [5:0] opcode,
    output reg regDst,
    output reg branch,
    output reg memRead,
    output reg mentoReg,
    output reg [1:0] aluOP1,
    output reg [1:0] aluOP2,
    output reg memWrite,
    output reg aluSrc,
    output reg regWrite,
    output reg jump
);

    parameter opcodeLW = 6'b100011;
    parameter opcodeSW = 6'b101011;
    parameter opcodeR = 6'b000000;
    parameter opcodeBeq = 6'b000100;
    parameter opcodeJ = 6'b000010;

    [MASKED]

endmodule