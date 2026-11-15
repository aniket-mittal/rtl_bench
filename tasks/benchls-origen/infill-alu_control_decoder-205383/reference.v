module origen_205383(
    input [3:0] op,
    input zero,
    output reg JUMP,
    output reg BRANCH,
    output reg [2:0] ALUC,
    output reg ALUSRCB,
    output reg WRITEMEM,
    output reg WRITEREG,
    output reg MEMTOREG,
    output reg REGDES,
    output reg WRFLAG
);

parameter AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010, SUB = 4'b0011,
          SLT = 4'b0100, SUBC = 4'b0101, ADDC = 4'b0110, JMP = 4'b0111,
          ANDI = 4'b1000, ORI = 4'b1001, ADDI = 4'b1010, LW = 4'b1011,
          SW = 4'b1100, BEQ = 4'b1101, BNE = 4'b1110, JMPB = 4'b1111;

always @(*) begin
    JUMP = 0;
    BRANCH = 0;
    ALUC = 0;
    ALUSRCB = 0;
    WRITEMEM = 0;
    WRITEREG = 0;
    MEMTOREG = 0;
    REGDES = 0;
    WRFLAG = 0;

    case (op)
        AND: begin
            ALUC = 0;
            REGDES = 1;
            WRITEREG = 1;
            WRFLAG = 1;
        end
        OR: begin
            ALUC = 1;
            REGDES = 1;
            WRITEREG = 1;
            WRFLAG = 1;
        end
        ADD: begin
            ALUC = 2;
            REGDES = 1;
            WRITEREG = 1;
            WRFLAG = 1;
        end
        SUB: begin
            ALUC = 3;
            REGDES = 1;
            WRITEREG = 1;
            WRFLAG = 1;
        end
        SLT: begin
            ALUC = 4;
            REGDES = 1;
            WRITEREG = 1;
        end
        SUBC: begin
            ALUC = 5;
            REGDES = 1;
            WRITEREG = 1;
            WRFLAG = 1;
        end
        ADDC: begin
            ALUC = 6;
            REGDES = 1;
            WRITEREG = 1;
            WRFLAG = 1;
        end
        JMP: begin
            JUMP = 1;
        end
        ANDI: begin
            ALUC = 0;
            ALUSRCB = 1;
            WRITEREG = 1;
        end
        ORI: begin
            ALUC = 1;
            ALUSRCB = 1;
            WRITEREG = 1;
        end
        ADDI: begin
            ALUC = 2;
            ALUSRCB = 1;
            WRITEREG = 1;
            WRFLAG = 1;
        end
        LW: begin
            ALUC = 2;
            ALUSRCB = 1;
            WRITEREG = 1;
            MEMTOREG = 1;
        end
        SW: begin
            ALUC = 2;
            ALUSRCB = 1;
            WRITEMEM = 1;
        end
        BEQ: begin
            BRANCH = (zero == 1'b1);
        end
        BNE: begin
            BRANCH = (zero == 1'b0);
        end
        JMPB: begin
            BRANCH = 1;
            JUMP = 1;
        end
    endcase
end
endmodule