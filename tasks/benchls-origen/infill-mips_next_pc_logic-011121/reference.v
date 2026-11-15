module origen_011121 (
    input [25:0] i_Imm26,
    input [31:0] i_PC,
    input [31:0] i_PC_4_dec,
    input [31:0] i_Rs,
    input i_Zero_dec,
    input i_J,
    input i_Jr,
    input i_Beq,
    input i_Bne,
    input i_exeption,
    input i_eret,
    input i_s_rst_dec,
    input [31:0] i_epc_to_pc,
    output reg [31:0] o_NextPC,
    output [31:0] o_PC_4
);

    wire [31:0] PC_4;
    wire [31:0] branch_target;
    wire [31:0] jump_target;
    wire branch_taken;

    // PC + 4 calculation
    assign PC_4 = i_PC + 32'd4;
    assign o_PC_4 = PC_4;

    // Branch target calculation
    assign branch_target = i_PC_4_dec + {{14{i_Imm26[15]}}, i_Imm26[15:0], 2'b00};

    // Jump target calculation
    assign jump_target = {PC_4[31:28], i_Imm26, 2'b00};

    // Branch condition
    assign branch_taken = (i_Beq & i_Zero_dec) | (i_Bne & ~i_Zero_dec);

    // Next PC selection
    always @(*) begin
        if (i_s_rst_dec)
            o_NextPC = i_PC;
        else if (i_eret)
            o_NextPC = i_epc_to_pc;
        else if (i_exeption)
            o_NextPC = 32'h0000_000C;
        else if (i_Jr)
            o_NextPC = i_Rs;
        else if (i_J)
            o_NextPC = jump_target;
        else if (branch_taken)
            o_NextPC = branch_target;
        else
            o_NextPC = PC_4;
    end

endmodule