module origen_016004(
    input [2:0] opcode,
    output reg reg2loc,
    output reg branch,
    output reg memread,
    output reg memtoreg,
    output reg [2:0] alu_select,
    output reg memwrite,
    output reg alusrc,
    output reg regwrite
);

always @(*) begin
    case(opcode)
        3'b000: begin // Register-type instruction (e.g., ADD)
            reg2loc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memtoreg = 1'b0;
            alu_select = 3'b010;
            memwrite = 1'b0;
            alusrc = 1'b0;
            regwrite = 1'b1;
        end
        3'b011: begin // Load instruction
            reg2loc = 1'b0;
            branch = 1'b0;
            memread = 1'b1;
            memtoreg = 1'b1;
            alu_select = 3'b010;
            memwrite = 1'b0;
            alusrc = 1'b1;
            regwrite = 1'b1;
        end
        3'b100: begin // Store instruction
            reg2loc = 1'b1;
            branch = 1'b0;
            memread = 1'b0;
            memtoreg = 1'b0;
            alu_select = 3'b010;
            memwrite = 1'b1;
            alusrc = 1'b1;
            regwrite = 1'b0;
        end
        3'b101: begin // Branch instruction
            reg2loc = 1'b1;
            branch = 1'b1;
            memread = 1'b0;
            memtoreg = 1'b0;
            alu_select = 3'b110;
            memwrite = 1'b0;
            alusrc = 1'b0;
            regwrite = 1'b0;
        end
        3'b110: begin // Immediate arithmetic instruction (e.g., ADDI)
            reg2loc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memtoreg = 1'b0;
            alu_select = 3'b010;
            memwrite = 1'b0;
            alusrc = 1'b1;
            regwrite = 1'b1;
        end
        3'b111: begin // Shift immediate instruction
            reg2loc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memtoreg = 1'b0;
            alu_select = 3'b011;
            memwrite = 1'b0;
            alusrc = 1'b1;
            regwrite = 1'b1;
        end
        default: begin // NOP (No Operation)
            reg2loc = 1'b0;
            branch = 1'b0;
            memread = 1'b0;
            memtoreg = 1'b0;
            alu_select = 3'b000;
            memwrite = 1'b0;
            alusrc = 1'b0;
            regwrite = 1'b0;
        end
    endcase
end

endmodule