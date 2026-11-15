module origen_034443 (
    input wire cond3, Jump3,
    input wire [31:0] IR2, IR3,
    output reg [1:0] stall_flush_IR2,
    output reg stall_flush_IR3,
    output reg stall_flush,
    output reg PC2_stall, PC_stall
);

    wire flush_cond;
    reg stall_cond;

    assign flush_cond = cond3 | Jump3;

    wire [4:0] opcode2, opcode3, rs2, rt2, rd3;
    assign opcode2 = IR2[31:27];
    assign opcode3 = IR3[31:27];
    assign rs2 = IR2[22:18];
    assign rt2 = IR2[17:13];
    assign rd3 = IR3[12:8];

    [MASKED]

endmodule