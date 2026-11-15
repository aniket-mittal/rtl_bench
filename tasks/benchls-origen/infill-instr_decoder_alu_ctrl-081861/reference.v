module origen_081861 (
    input [3:0] opcode,
    input [7:0] func,
    input zero_flag,
    output reg [2:0] alu_operation,
    output reg next_sel, ld_window, branch_sel, jump_sel, R_sel, imm_sel, mem_sel, alu_sel, reg_write, mem_read, mem_write
);

    // ALU operation parameters
    parameter MOVE = 3'b000;
    parameter ADD  = 3'b001;
    parameter SUB  = 3'b010;
    parameter AND  = 3'b011;
    parameter OR   = 3'b100;
    parameter NOT  = 3'b101;
    parameter NOP  = 3'b111;

    always @(*) begin
        // Default values
        alu_operation = NOP;
        next_sel = 0;
        ld_window = 0;
        branch_sel = 0;
        jump_sel = 0;
        R_sel = 0;
        imm_sel = 0;
        mem_sel = 0;
        alu_sel = 0;
        reg_write = 0;
        mem_read = 0;
        mem_write = 0;

        case(opcode)
            4'b1000: begin // R-type instructions
                R_sel = 1;
                alu_sel = 1;
                reg_write = 1;
                ld_window = 1;
                case(func[2:0])
                    3'b000: alu_operation = MOVE;
                    3'b001: alu_operation = ADD;
                    3'b010: alu_operation = SUB;
                    3'b011: alu_operation = AND;
                    3'b100: alu_operation = OR;
                    3'b101: alu_operation = NOT;
                    default: alu_operation = NOP;
                endcase
            end
            4'b1100: begin // Immediate ADD
                alu_operation = ADD;
                imm_sel = 1;
                alu_sel = 1;
                reg_write = 1;
            end
            4'b1101: begin // Immediate SUB
                alu_operation = SUB;
                imm_sel = 1;
                alu_sel = 1;
                reg_write = 1;
            end
            4'b1110: begin // Immediate AND
                alu_operation = AND;
                imm_sel = 1;
                alu_sel = 1;
                reg_write = 1;
            end
            4'b1111: begin // Immediate OR
                alu_operation = OR;
                imm_sel = 1;
                alu_sel = 1;
                reg_write = 1;
            end
            4'b0100: begin // Branch
                alu_operation = SUB;
                R_sel = 1;
                branch_sel = zero_flag;
                next_sel = zero_flag;
            end
            4'b0000: begin // Jump
                jump_sel = 1;
                next_sel = 1;
            end
            4'b0010: begin // Load
                alu_operation = ADD;
                imm_sel = 1;
                mem_sel = 1;
                reg_write = 1;
                mem_read = 1;
            end
            4'b0011: begin // Store
                alu_operation = ADD;
                imm_sel = 1;
                mem_write = 1;
            end
            default: alu_operation = NOP;
        endcase
    end

endmodule