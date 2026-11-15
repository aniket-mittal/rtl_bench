module origen_097092 (
    input wire [6:0] opcode,
    input wire reset,
    input wire invert,
    input wire [2:0] funct,
    output reg [1:0] im_sel,
    output reg jump,
    output reg branch,
    output reg Alusrc1,
    output reg Alusrc2,
    output reg regWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg jal,
    output reg csr,
    output reg [1:0] wr_sel,
    output reg [2:0] ALUop,
    output wire fence
);

    // Instruction type decoding
    wire r_type = (opcode == 7'b0110011);
    wire i_type = (opcode == 7'b0010011);
    wire s_type = (opcode == 7'b0100011);
    wire b_type = (opcode == 7'b1100011);
    wire u_type = (opcode == 7'b0110111) || (opcode == 7'b0010111);
    wire j_type = (opcode == 7'b1101111);
    wire csr_type = (opcode == 7'b1110011);
    wire load_type = (opcode == 7'b0000011);

    // Fence signal
    assign fence = (opcode == 7'b0001111);

    [MASKED]

endmodule