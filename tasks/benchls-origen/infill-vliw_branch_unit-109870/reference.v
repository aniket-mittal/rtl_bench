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

    always @(*) begin
        pc = pc_in + 8;
        result = 128'b0;
        branch_jump_signal = 1'b0;
        take_or_not = 1'b0;
        stop = 1'b0;

        case (opcode)
            11'b00000000000: begin // STOP
                stop = 1'b1;
            end
            11'b00100000000: begin // BR
                pc = pc_in + sign_extended_imm;
                branch_jump_signal = 1'b1;
                take_or_not = 1'b1;
            end
            11'b00100000001: begin // BRR
                pc = ra[63:0];
                branch_jump_signal = 1'b1;
                take_or_not = 1'b1;
            end
            11'b00100000010: begin // BR.N
                if (rc[63:0] != 64'b0) begin
                    pc = pc_in + sign_extended_imm;
                    take_or_not = 1'b1;
                end
                branch_jump_signal = 1'b1;
            end
            11'b00100000011: begin // BR.Z
                if (rc[63:0] == 64'b0) begin
                    pc = pc_in + sign_extended_imm;
                    take_or_not = 1'b1;
                end
                branch_jump_signal = 1'b1;
            end
            11'b00110000000: begin // JMP
                pc = {pc_in[63:32], sign_extended_imm[31:0]};
                branch_jump_signal = 1'b1;
                take_or_not = 1'b1;
            end
            11'b00110000001: begin // JMP.N
                if (rc[63:0] != 64'b0) begin
                    pc = {pc_in[63:32], sign_extended_imm[31:0]};
                    take_or_not = 1'b1;
                end
                branch_jump_signal = 1'b1;
            end
            11'b00110000010: begin // JMP.Z
                if (rc[63:0] == 64'b0) begin
                    pc = {pc_in[63:32], sign_extended_imm[31:0]};
                    take_or_not = 1'b1;
                end
                branch_jump_signal = 1'b1;
            end
            11'b00110000011: begin // JMPR
                pc = ra[63:0];
                branch_jump_signal = 1'b1;
                take_or_not = 1'b1;
            end
            11'b00111000000: begin // JAL
                pc = {pc_in[63:32], sign_extended_imm[31:0]};
                result = {pc_in + 64'd8, 64'b0};
                branch_jump_signal = 1'b1;
                take_or_not = 1'b1;
            end
            11'b00111000001: begin // JALR
                pc = ra[63:0];
                result = {pc_in + 64'd8, 64'b0};
                branch_jump_signal = 1'b1;
                take_or_not = 1'b1;
            end
            default: begin
                // No operation, just move to next instruction
            end
        endcase
    end

endmodule