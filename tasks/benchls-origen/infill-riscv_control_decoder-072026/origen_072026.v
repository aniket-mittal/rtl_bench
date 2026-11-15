module origen_072026 (
    input [31:0] instruction,
    output reg alusrc,
    output reg [1:0] writeback_ctrl,
    output reg mem_read,
    output reg regwrite,
    output reg mem_write,
    output reg [2:0] alu_ctrl,
    output reg bge,
    output reg beq,
    output reg jalr
);

    wire [4:0] opcode;
    assign opcode = instruction[6:2];

    [MASKED]

endmodule