module origen_056401(
    input wire [17:0] ir,
    output reg [4:0] rs1, rs2, rd,
    output reg [17:0] imm,
    output reg imm_s1, imm_s2,
    output reg do_alu, do_shift, do_write, do_readkbd, do_stb, do_jump,
    output reg [3:0] alu_op,
    output reg [1:0] shift_op,
    output reg [11:0] jump_offset,
    output reg [2:0] cond
);

    // ALU operation parameters
    parameter ALU_ADD = 4'b0000;
    parameter ALU_SUB = 4'b0001;
    parameter ALU_AND = 4'b0010;
    parameter ALU_OR  = 4'b0011;
    parameter ALU_XOR = 4'b0100;
    parameter ALU_CMP = 4'b0101;

    // Shift operation parameters
    parameter SHIFT_LEFT  = 2'b00;
    parameter SHIFT_RIGHT = 2'b01;
    parameter ROTATE_LEFT = 2'b10;

    always @(*) begin
        // Default values
        rs1 = ir[11:7];
        rs2 = ir[6:2];
        rd = ir[16:12];
        imm = 18'b0;
        imm_s1 = 1'b0;
        imm_s2 = 1'b0;
        do_alu = 1'b0;
        do_shift = 1'b0;
        do_write = 1'b0;
        do_readkbd = 1'b0;
        do_stb = 1'b0;
        do_jump = 1'b0;
        alu_op = 4'b0;
        shift_op = 2'b0;
        jump_offset = 12'b0;
        cond = 3'b0;

        case(ir[17:12])
            6'b000000: begin // ADD
                do_alu = 1'b1;
                do_write = 1'b1;
                alu_op = ALU_ADD;
            end
            6'b000001: begin // SUB
                do_alu = 1'b1;
                do_write = 1'b1;
                alu_op = ALU_SUB;
            end
            6'b000010: begin // AND
                do_alu = 1'b1;
                do_write = 1'b1;
                alu_op = ALU_AND;
            end
            6'b000011: begin // OR
                do_alu = 1'b1;
                do_write = 1'b1;
                alu_op = ALU_OR;
            end
            6'b000100: begin // XOR
                do_alu = 1'b1;
                do_write = 1'b1;
                alu_op = ALU_XOR;
            end
            6'b001000: begin // SHL
                do_shift = 1'b1;
                do_write = 1'b1;
                shift_op = SHIFT_LEFT;
            end
            6'b001001: begin // SHR
                do_shift = 1'b1;
                do_write = 1'b1;
                shift_op = SHIFT_RIGHT;
            end
            6'b001010: begin // ROL
                do_shift = 1'b1;
                do_write = 1'b1;
                shift_op = ROTATE_LEFT;
            end
            6'b010010: begin // STB
                do_stb = 1'b1;
            end
            6'b011000, 6'b011001, 6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111: begin // Conditional jumps
                do_jump = 1'b1;
                jump_offset = ir[11:0];
                cond = ir[14:12];
            end
            6'b100000, 6'b100001, 6'b100010, 6'b100011: begin // CALL
                do_jump = 1'b1;
                jump_offset = ir[11:0];
                do_write = 1'b1;
                rd = 5'd31; // Link register
            end
            6'b101000: begin // JR
                do_jump = 1'b1;
                jump_offset = {6'b0, ir[11:6]};
            end
            6'b110000, 6'b110001: begin // ANDI
                do_alu = 1'b1;
                do_write = 1'b1;
                alu_op = ALU_AND;
                imm = {12'b0, ir[11:6]};
                imm_s2 = 1'b1;
            end
            6'b110010, 6'b110011: begin // SETHI
                do_write = 1'b1;
                imm = {ir[11:0], 6'b0};
                imm_s1 = 1'b1;
            end
            6'b110100, 6'b110101: begin // ADDI
                do_alu = 1'b1;
                do_write = 1'b1;
                alu_op = ALU_ADD;
                imm = {{12{ir[11]}}, ir[11:6]}; // Sign-extended immediate
                imm_s2 = 1'b1;
            end
            6'b110110, 6'b110111: begin // CMPI
                do_alu = 1'b1;
                alu_op = ALU_CMP;
                imm = {{12{ir[11]}}, ir[11:6]}; // Sign-extended immediate
                imm_s2 = 1'b1;
            end
            6'b111110: begin // READKBD
                do_readkbd = 1'b1;
                do_write = 1'b1;
            end
            default: begin
                // Invalid instruction, do nothing
            end
        endcase
    end

endmodule