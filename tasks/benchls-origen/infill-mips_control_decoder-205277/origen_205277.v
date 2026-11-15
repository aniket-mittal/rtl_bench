module origen_205277(
    input [5:0] opcode,
    input [5:0] func,
    input MIO_ready,
    input zero,
    output reg RegDst,
    output reg ALUSrc_B,
    output reg DatatoReg,
    output reg Jal,
    output reg [1:0] Branch,
    output reg RegWrite,
    output reg mem_w,
    output reg [3:0] ALU_Control,
    output reg CPU_MIO
);

    [MASKED]

endmodule