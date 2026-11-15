module origen_216083(
    input [5:0] op,
    input [5:0] func,
    output reg addu,
    output reg subu,
    output reg ori,
    output reg lui,
    output reg lw,
    output reg sw,
    output reg beq,
    output reg j,
    output reg jal,
    output reg jr,
    output reg blezals,
    output reg rev
);

    initial begin
        addu = 0;
        subu = 0;
        ori = 0;
        lui = 0;
        lw = 0;
        sw = 0;
        beq = 0;
        j = 0;
        jal = 0;
        jr = 0;
        blezals = 0;
        rev = 0;
    end

    [MASKED]
endmodule