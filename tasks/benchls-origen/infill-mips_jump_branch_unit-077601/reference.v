module origen_077601 (
    input wire rst,
    input wire [5:0] i_op,
    input wire [31:0] i_sign_ext,
    input wire [31:0] i_jump_address,
    input wire [31:0] i_pc,
    input wire [31:0] i_rs_reg,
    input wire [31:0] i_rt_reg,
    input wire is_stall,
    output reg os_taken,
    output reg os_write_pc,
    output reg os_select_addr_reg,
    output reg [31:0] o_jump_address,
    output reg [31:0] o_pc_to_reg
);

    always @(*) begin
        if (rst) begin
            os_taken = 1'b0;
            os_write_pc = 1'b0;
            os_select_addr_reg = 1'b0;
            o_jump_address = 32'b0;
            o_pc_to_reg = 32'b0;
        end else if (!is_stall) begin
            case (i_op)
                6'b000000: begin // R-type instructions
                    case (i_sign_ext[5:0]) // Use i_sign_ext for function code
                        6'b001000: begin // JR
                            os_taken = 1'b1;
                            os_write_pc = 1'b1;
                            os_select_addr_reg = 1'b1;
                            o_jump_address = i_rs_reg;
                            o_pc_to_reg = 32'b0;
                        end
                        6'b001001: begin // JALR
                            os_taken = 1'b1;
                            os_write_pc = 1'b1;
                            os_select_addr_reg = 1'b1;
                            o_jump_address = i_rs_reg;
                            o_pc_to_reg = i_pc + 32'd4;
                        end
                        default: begin
                            os_taken = 1'b0;
                            os_write_pc = 1'b0;
                            os_select_addr_reg = 1'b0;
                            o_jump_address = 32'b0;
                            o_pc_to_reg = 32'b0;
                        end
                    endcase
                end
                6'b000100: begin // BEQ
                    os_taken = (i_rs_reg == i_rt_reg);
                    os_write_pc = (i_rs_reg == i_rt_reg);
                    os_select_addr_reg = 1'b0;
                    o_jump_address = i_pc + (i_sign_ext << 2);
                    o_pc_to_reg = 32'b0;
                end
                6'b000101: begin // BNE
                    os_taken = (i_rs_reg != i_rt_reg);
                    os_write_pc = (i_rs_reg != i_rt_reg);
                    os_select_addr_reg = 1'b0;
                    o_jump_address = i_pc + (i_sign_ext << 2);
                    o_pc_to_reg = 32'b0;
                end
                6'b000010: begin // J
                    os_taken = 1'b1;
                    os_write_pc = 1'b1;
                    os_select_addr_reg = 1'b0;
                    o_jump_address = {i_pc[31:28], i_jump_address[27:0]};
                    o_pc_to_reg = 32'b0;
                end
                6'b000011: begin // JAL
                    os_taken = 1'b1;
                    os_write_pc = 1'b1;
                    os_select_addr_reg = 1'b0;
                    o_jump_address = {i_pc[31:28], i_jump_address[27:0]};
                    o_pc_to_reg = i_pc + 32'd4;
                end
                default: begin
                    os_taken = 1'b0;
                    os_write_pc = 1'b0;
                    os_select_addr_reg = 1'b0;
                    o_jump_address = 32'b0;
                    o_pc_to_reg = 32'b0;
                end
            endcase
        end else begin
            os_taken = 1'b0;
            os_write_pc = 1'b0;
            os_select_addr_reg = 1'b0;
            o_jump_address = 32'b0;
            o_pc_to_reg = 32'b0;
        end
    end

endmodule