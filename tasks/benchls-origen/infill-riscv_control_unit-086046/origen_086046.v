module origen_086046 (
    input wire [6:0] opcode,
    input wire rst_n,
    output reg [1:0] immSel,
    output reg [1:0] ALUop,
    output reg ALUSrc,
    output reg branch,
    output reg jump,
    output reg memRead,
    output reg memWrite,
    output reg memToReg,
    output reg regWrite,
    output reg [1:0] PCSrc
);

    [MASKED]

endmodule