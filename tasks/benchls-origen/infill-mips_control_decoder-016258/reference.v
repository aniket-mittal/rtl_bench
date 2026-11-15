module origen_016258(
    input [3:0] opcode,
    input [2:0] func,
    output reg reg_dst,
    output reg reg_write,
    output reg alusrc,
    output reg [2:0] alufn,
    output reg mem_write,
    output reg mem_read,
    output reg mem_to_reg,
    output reg nia
);

always @(*) begin
    case(opcode)
        4'b0000: begin // R-type instructions
            case(func)
                3'b000: begin // ADD
                    reg_dst = 1'b1;
                    reg_write = 1'b1;
                    alusrc = 1'b0;
                    alufn = 3'b000;
                    mem_write = 1'b0;
                    mem_read = 1'b0;
                    mem_to_reg = 1'b0;
                    nia = 1'b1;
                end
                3'b010: begin // SUB
                    reg_dst = 1'b1;
                    reg_write = 1'b1;
                    alusrc = 1'b0;
                    alufn = 3'b001;
                    mem_write = 1'b0;
                    mem_read = 1'b0;
                    mem_to_reg = 1'b0;
                    nia = 1'b1;
                end
                3'b100: begin // AND
                    reg_dst = 1'b1;
                    reg_write = 1'b1;
                    alusrc = 1'b0;
                    alufn = 3'b010;
                    mem_write = 1'b0;
                    mem_read = 1'b0;
                    mem_to_reg = 1'b0;
                    nia = 1'b1;
                end
                3'b101: begin // OR
                    reg_dst = 1'b1;
                    reg_write = 1'b1;
                    alusrc = 1'b0;
                    alufn = 3'b011;
                    mem_write = 1'b0;
                    mem_read = 1'b0;
                    mem_to_reg = 1'b0;
                    nia = 1'b1;
                end
                default: begin
                    reg_dst = 1'b0;
                    reg_write = 1'b0;
                    alusrc = 1'b0;
                    alufn = 3'b000;
                    mem_write = 1'b0;
                    mem_read = 1'b0;
                    mem_to_reg = 1'b0;
                    nia = 1'b1;
                end
            endcase
        end
        4'b0100: begin // ADDI
            reg_dst = 1'b0;
            reg_write = 1'b1;
            alusrc = 1'b1;
            alufn = 3'b000;
            mem_write = 1'b0;
            mem_read = 1'b0;
            mem_to_reg = 1'b0;
            nia = 1'b1;
        end
        4'b1011: begin // Load
            reg_dst = 1'b0;
            reg_write = 1'b1;
            alusrc = 1'b1;
            alufn = 3'b000;
            mem_write = 1'b0;
            mem_read = 1'b1;
            mem_to_reg = 1'b1;
            nia = 1'b1;
        end
        4'b1111: begin // Store
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alusrc = 1'b1;
            alufn = 3'b000;
            mem_write = 1'b1;
            mem_read = 1'b0;
            mem_to_reg = 1'b0;
            nia = 1'b1;
        end
        4'b1000: begin // Branch
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alusrc = 1'b0;
            alufn = 3'b001;
            mem_write = 1'b0;
            mem_read = 1'b0;
            mem_to_reg = 1'b0;
            nia = 1'b1;
        end
        4'b0010: begin // Jump
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alusrc = 1'b0;
            alufn = 3'b000;
            mem_write = 1'b0;
            mem_read = 1'b0;
            mem_to_reg = 1'b0;
            nia = 1'b0;
        end
        default: begin
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alusrc = 1'b0;
            alufn = 3'b000;
            mem_write = 1'b0;
            mem_read = 1'b0;
            mem_to_reg = 1'b0;
            nia = 1'b1;
        end
    endcase
end

endmodule