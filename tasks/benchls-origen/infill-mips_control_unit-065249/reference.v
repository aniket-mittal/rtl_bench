module origen_065249(
    input [5:0] OPCODE,
    input lw_hazard,
    output reg regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch,
    output reg [1:0] aluop
);

    // Instruction type parameters
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter R_TYPE = 6'b000000;
    parameter I_TYPE = 6'b001000;

    always @(*) begin
        if (lw_hazard) begin
            // Disable all control signals except aluop during load-word hazard
            regdst = 1'b0;
            alusrc = 1'b0;
            memtoreg = 1'b0;
            regwrite = 1'b0;
            memread = 1'b0;
            memwrite = 1'b0;
            branch = 1'b0;
            aluop = 2'b11;
        end else begin
            case(OPCODE)
                R_TYPE: begin
                    regdst = 1'b1;
                    alusrc = 1'b0;
                    memtoreg = 1'b0;
                    regwrite = 1'b1;
                    memread = 1'b0;
                    memwrite = 1'b0;
                    branch = 1'b0;
                    aluop = 2'b10;
                end
                I_TYPE: begin
                    regdst = 1'b0;
                    alusrc = 1'b1;
                    memtoreg = 1'b0;
                    regwrite = 1'b1;
                    memread = 1'b0;
                    memwrite = 1'b0;
                    branch = 1'b0;
                    aluop = 2'b00;
                end
                LW: begin
                    regdst = 1'b0;
                    alusrc = 1'b1;
                    memtoreg = 1'b1;
                    regwrite = 1'b1;
                    memread = 1'b1;
                    memwrite = 1'b0;
                    branch = 1'b0;
                    aluop = 2'b00;
                end
                SW: begin
                    regdst = 1'bx;
                    alusrc = 1'b1;
                    memtoreg = 1'bx;
                    regwrite = 1'b0;
                    memread = 1'b0;
                    memwrite = 1'b1;
                    branch = 1'b0;
                    aluop = 2'b00;
                end
                BEQ: begin
                    regdst = 1'bx;
                    alusrc = 1'b0;
                    memtoreg = 1'bx;
                    regwrite = 1'b0;
                    memread = 1'b0;
                    memwrite = 1'b0;
                    branch = 1'b1;
                    aluop = 2'b01;
                end
                default: begin
                    regdst = 1'b0;
                    alusrc = 1'b0;
                    memtoreg = 1'b0;
                    regwrite = 1'b0;
                    memread = 1'b0;
                    memwrite = 1'b0;
                    branch = 1'b0;
                    aluop = 2'b00;
                end
            endcase
        end
    end
endmodule