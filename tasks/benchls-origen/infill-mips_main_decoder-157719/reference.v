module origen_157719(
    input [5:0] opcode,
    output reg [1:0] aluop,
    output reg alusrc_a,
    output reg alusrc_b,
    output reg branch_eq,
    output reg branch_ne,
    output reg branch_ltz,
    output reg memread,
    output reg memtoreg,
    output reg memwrite,
    output reg regdst,
    output reg regwrite,
    output reg jump,
    output reg halt,
    output reg extsel
);

    always @(*) begin
        // Default initialization
        aluop = 2'b00;
        alusrc_a = 1'b0;
        alusrc_b = 1'b0;
        branch_eq = 1'b0;
        branch_ne = 1'b0;
        branch_ltz = 1'b0;
        memread = 1'b0;
        memtoreg = 1'b0;
        memwrite = 1'b0;
        regdst = 1'b0;
        regwrite = 1'b0;
        jump = 1'b0;
        halt = 1'b0;
        extsel = 1'b0;

        case (opcode)
            6'b010000, 6'b010010: begin
                extsel = 1'b0;
                regdst = 1'b0;
                alusrc_b = 1'b1;
            end
            6'b100111: begin
                memread = 1'b1;
                regdst = 1'b0;
                memtoreg = 1'b1;
                aluop[1] = 1'b0;
            end
            6'b000010: begin
                regdst = 1'b0;
                aluop[1] = 1'b0;
                alusrc_b = 1'b1;
            end
            6'b011000: begin
                alusrc_a = 1'b1;
            end
            6'b110000: begin
                aluop[0] = 1'b1;
                aluop[1] = 1'b0;
                branch_eq = 1'b1;
                regwrite = 1'b0;
            end
            6'b100110: begin
                memwrite = 1'b1;
                aluop[1] = 1'b0;
                alusrc_b = 1'b1;
                regwrite = 1'b0;
            end
            6'b110001: begin
                aluop[0] = 1'b1;
                aluop[1] = 1'b0;
                branch_ne = 1'b1;
                regwrite = 1'b0;
            end
            6'b110010: begin
                branch_ltz = 1'b1;
                regwrite = 1'b0;
            end
            6'b011100: begin
                alusrc_b = 1'b1;
                regdst = 1'b0;
            end
            6'b111000: begin
                jump = 1'b1;
            end
            6'b111111: begin
                halt = 1'b1;
            end
        endcase
    end

endmodule