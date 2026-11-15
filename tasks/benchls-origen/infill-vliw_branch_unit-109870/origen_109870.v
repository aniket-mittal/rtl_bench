module origen_109870 (
    input [10:0] opcode,
    input [63:0] pc_in,
    input [127:0] ra,
    input [127:0] rc,
    input [15:0] imm,
    output reg [63:0] pc,
    output reg [127:0] result,
    output reg branch_jump_signal,
    output reg take_or_not,
    output reg stop
);

    wire [63:0] sign_extended_imm;
    assign sign_extended_imm = {{46{imm[15]}}, imm, 2'b00};

    [MASKED]

endmodule