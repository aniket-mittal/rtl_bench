module origen_006768(
    input [5:0] op,
    input [5:0] func,
    output reg [3:0] alu_op,
    output reg mem_to_reg,
    output reg mem_write,
    output reg reg_write,
    output reg reg_dst,
    output reg alu_src_b,
    output reg signed_ext,
    output reg beq,
    output reg bne,
    output reg jal,
    output reg jmp,
    output reg jr,
    output reg syscall,
    output my_B_signal,
    output [1:0] my_A_signal
);

    // ALU operation control signals
    reg S3, S2, S1, S0;

    // Fixed signals
    assign my_B_signal = 1'b0;
    assign my_A_signal = 2'b00;

    always @(*) begin
        // Default values
        {mem_to_reg, mem_write, reg_write, reg_dst, alu_src_b, signed_ext, beq, bne, jal, jmp, jr, syscall} = 12'b0;
        {S3, S2, S1, S0} = 4'b0;

        case(op)
            6'b000000: begin // R-type instructions
                reg_write = 1'b1;
                reg_dst = 1'b1;
                case(func)
                    6'b000000: begin // SLL
                        S1 = 1'b1;
                    end
                    6'b100000: begin // ADD
                        S0 = 1'b1;
                    end
                    6'b100010: begin // SUB
                        S1 = 1'b1;
                        S0 = 1'b1;
                    end
                    6'b100100: begin // AND
                        S2 = 1'b1;
                    end
                    6'b100101: begin // OR
                        S2 = 1'b1;
                        S0 = 1'b1;
                    end
                    6'b101010: begin // SLT
                        S2 = 1'b1;
                        S1 = 1'b1;
                    end
                    6'b001000: begin // JR
                        reg_write = 1'b0;
                        jr = 1'b1;
                    end
                    6'b001100: begin // SYSCALL
                        reg_write = 1'b0;
                        syscall = 1'b1;
                    end
                endcase
            end
            6'b001000: begin // ADDI
                reg_write = 1'b1;
                alu_src_b = 1'b1;
                signed_ext = 1'b1;
                S0 = 1'b1;
            end
            6'b001100: begin // ANDI
                reg_write = 1'b1;
                alu_src_b = 1'b1;
                S2 = 1'b1;
            end
            6'b001101: begin // ORI
                reg_write = 1'b1;
                alu_src_b = 1'b1;
                S2 = 1'b1;
                S0 = 1'b1;
            end
            6'b100011: begin // LW
                reg_write = 1'b1;
                alu_src_b = 1'b1;
                mem_to_reg = 1'b1;
                signed_ext = 1'b1;
                S0 = 1'b1;
            end
            6'b101011: begin // SW
                alu_src_b = 1'b1;
                mem_write = 1'b1;
                signed_ext = 1'b1;
                S0 = 1'b1;
            end
            6'b000100: begin // BEQ
                beq = 1'b1;
                signed_ext = 1'b1;
                S1 = 1'b1;
                S0 = 1'b1;
            end
            6'b000101: begin // BNE
                bne = 1'b1;
                signed_ext = 1'b1;
                S1 = 1'b1;
                S0 = 1'b1;
            end
            6'b000010: begin // J
                jmp = 1'b1;
            end
            6'b000011: begin // JAL
                reg_write = 1'b1;
                jal = 1'b1;
            end
        endcase

        // Set ALU operation
        alu_op = {S3, S2, S1, S0};
    end

endmodule