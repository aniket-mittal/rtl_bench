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

    always @(*) begin
        if (op == 6'b000000 && func == 6'b100001) begin
            addu = 1;
        end else begin
            addu = 0;
        end

        if (op == 6'b000000 && func == 6'b100011) begin
            subu = 1;
        end else begin
            subu = 0;
        end

        if (op == 6'b101011) begin
            sw = 1;
        end else begin
            sw = 0;
        end

        if (op == 6'b100011) begin
            lw = 1;
        end else begin
            lw = 0;
        end

        if (op == 6'b001101) begin
            ori = 1;
        end else begin
            ori = 0;
        end

        if (op == 6'b000100) begin
            beq = 1;
        end else begin
            beq = 0;
        end

        if (op == 6'b001111) begin
            lui = 1;
        end else begin
            lui = 0;
        end

        if (op == 6'b000010) begin
            j = 1;
        end else begin
            j = 0;
        end

        if (op == 6'b000011) begin
            jal = 1;
        end else begin
            jal = 0;
        end

        if (op == 6'b000000 && func == 6'b001000) begin
            jr = 1;
        end else begin
            jr = 0;
        end

        if (op == 6'b011000) begin
            blezals = 1;
        end else begin
            blezals = 0;
        end

        if (op == 6'b000000 && func == 6'b010100) begin
            rev = 1;
        end else begin
            rev = 0;
        end
    end
endmodule