module origen_059078 (
    input [2:0] opcode,
    input NOP,
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
    if (NOP) begin
        reg2loc = 1'b0;
        branch = 1'b0;
        memread = 1'b0;
        memtoreg = 1'b0;
        alu_select = 3'b000;
        memwrite = 1'b0;
        alusrc = 1'b0;
        regwrite = 1'b0;
    end else begin
        case (opcode)
            3'b000: begin // Register-type arithmetic operation
                reg2loc = 1'b0;
                branch = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                alu_select = 3'b010;
                memwrite = 1'b0;
                alusrc = 1'b0;
                regwrite = 1'b1;
            end
            3'b001: begin // Register-type logical operation
                reg2loc = 1'b0;
                branch = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                alu_select = 3'b011;
                memwrite = 1'b0;
                alusrc = 1'b0;
                regwrite = 1'b1;
            end
            3'b011: begin // Load operation
                reg2loc = 1'b0;
                branch = 1'b0;
                memread = 1'b1;
                memtoreg = 1'b1;
                alu_select = 3'b010;
                memwrite = 1'b0;
                alusrc = 1'b1;
                regwrite = 1'b1;
            end
            3'b100: begin // Store operation
                reg2loc = 1'b1;
                branch = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                alu_select = 3'b010;
                memwrite = 1'b1;
                alusrc = 1'b1;
                regwrite = 1'b0;
            end
            3'b101: begin // Branch operation
                reg2loc = 1'b1;
                branch = 1'b1;
                memread = 1'b0;
                memtoreg = 1'b0;
                alu_select = 3'b111;
                memwrite = 1'b0;
                alusrc = 1'b0;
                regwrite = 1'b0;
            end
            3'b110: begin // Immediate arithmetic operation
                reg2loc = 1'b0;
                branch = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                alu_select = 3'b010;
                memwrite = 1'b0;
                alusrc = 1'b1;
                regwrite = 1'b1;
            end
            3'b111: begin // Immediate logical operation
                reg2loc = 1'b0;
                branch = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                alu_select = 3'b011;
                memwrite = 1'b0;
                alusrc = 1'b1;
                regwrite = 1'b1;
            end
            default: begin // Default case (undefined opcode)
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
end

endmodule