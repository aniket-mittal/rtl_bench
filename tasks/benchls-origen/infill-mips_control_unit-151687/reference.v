module origen_151687(
    input [5:0] op,
    input [5:0] func,
    input z,
    output reg wreg,
    output reg regrt,
    output reg jal,
    output reg m2reg,
    output reg shift,
    output reg aluimm,
    output reg sext,
    output reg wmem,
    output reg [3:0] aluc,
    output reg [1:0] pcsource
);

    // R-type instruction decoding
    wire i_add, i_sub, i_and, i_or, i_slt;
    assign i_add = ~op[0] & ~op[1] & ~op[2] & ~op[3] & ~op[4] & ~op[5] & ~func[0] & ~func[1] & ~func[2] & func[3] & ~func[4] & ~func[5];
    assign i_sub = ~op[0] & ~op[1] & ~op[2] & ~op[3] & ~op[4] & ~op[5] & ~func[0] & ~func[1] & func[2] & func[3] & ~func[4] & ~func[5];
    assign i_and = ~op[0] & ~op[1] & ~op[2] & ~op[3] & ~op[4] & ~op[5] & func[0] & ~func[1] & ~func[2] & ~func[3] & ~func[4] & ~func[5];
    assign i_or  = ~op[0] & ~op[1] & ~op[2] & ~op[3] & ~op[4] & ~op[5] & func[0] & ~func[1] & func[2] & ~func[3] & ~func[4] & ~func[5];
    assign i_slt = ~op[0] & ~op[1] & ~op[2] & ~op[3] & ~op[4] & ~op[5] & ~func[0] & func[1] & ~func[2] & func[3] & ~func[4] & func[5];

    // I-type and J-type instruction decoding
    wire i_addi, i_lw, i_sw, i_beq, i_j, i_jal;
    assign i_addi = op[0] & ~op[1] & ~op[2] & ~op[3] & ~op[4] & ~op[5];
    assign i_lw   = op[0] & op[1] & ~op[2] & ~op[3] & op[4] & ~op[5];
    assign i_sw   = op[0] & op[1] & op[2] & ~op[3] & op[4] & ~op[5];
    assign i_beq  = op[0] & ~op[1] & op[2] & ~op[3] & ~op[4] & ~op[5];
    assign i_j    = op[0] & ~op[1] & ~op[2] & op[3] & ~op[4] & ~op[5];
    assign i_jal  = op[0] & ~op[1] & ~op[2] & op[3] & op[4] & ~op[5];

    // Control signal assignments
    always @(*) begin
        // Default values
        wreg = 1'b0;
        regrt = 1'b0;
        jal = 1'b0;
        m2reg = 1'b0;
        shift = 1'b0;
        aluimm = 1'b0;
        sext = 1'b0;
        wmem = 1'b0;
        aluc = 4'b0000;
        pcsource = 2'b00;

        // R-type instructions
        if (i_add) begin
            wreg = 1'b1;
            regrt = 1'b0;
            aluc = 4'b0010;
        end else if (i_sub) begin
            wreg = 1'b1;
            regrt = 1'b0;
            aluc = 4'b0110;
        end else if (i_and) begin
            wreg = 1'b1;
            regrt = 1'b0;
            aluc = 4'b0000;
        end else if (i_or) begin
            wreg = 1'b1;
            regrt = 1'b0;
            aluc = 4'b0001;
        end else if (i_slt) begin
            wreg = 1'b1;
            regrt = 1'b0;
            aluc = 4'b0111;
        end

        // I-type instructions
        if (i_addi) begin
            wreg = 1'b1;
            regrt = 1'b1;
            aluimm = 1'b1;
            sext = 1'b1;
            aluc = 4'b0010;
        end else if (i_lw) begin
            wreg = 1'b1;
            regrt = 1'b1;
            m2reg = 1'b1;
            aluimm = 1'b1;
            sext = 1'b1;
            aluc = 4'b0010;
        end else if (i_sw) begin
            wmem = 1'b1;
            aluimm = 1'b1;
            sext = 1'b1;
            aluc = 4'b0010;
        end else if (i_beq) begin
            pcsource = 2'b01;
        end

        // J-type instructions
        if (i_j) begin
            pcsource = 2'b10;
        end else if (i_jal) begin
            wreg = 1'b1;
            regrt = 1'b0;
            jal = 1'b1;
            pcsource = 2'b10;
        end
    end

endmodule