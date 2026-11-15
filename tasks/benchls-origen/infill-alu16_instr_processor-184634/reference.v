module origen_184634(
    input [15:0] instr,
    input [15:0] inreg1,
    input [15:0] inreg2,
    input carrystatus,
    input exec1,
    output reg [15:0] aluout,
    output reg [1:0] regM,
    output reg sel_mux_mem_alu,
    output reg sel_mux_inp,
    output reg output_en,
    output reg carryout,
    output reg carryen,
    output reg wenout,
    output reg [1:0] RegN,
    output reg [1:0] RegD,
    output reg sel_mux_regD
);

    reg [15:0] mul0, mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8, mul9, mul10, mul11, mul12, mul13, mul14, mul15;
    reg [15:0] mul;

    always @(*) begin
        if (exec1) begin
            case (instr[15:8])
                8'b00000000: begin // ADD
                    {carryout, aluout} = inreg1 + inreg2;
                    carryen = 1'b1;
                    sel_mux_mem_alu = 1'b1;
                    sel_mux_inp = 1'b0;
                    output_en = 1'b1;
                    wenout = 1'b1;
                    RegN = 2'b00;
                    RegD = 2'b01;
                    sel_mux_regD = 1'b0;
                    regM = 2'b01;
                end
                8'b00000001: begin // SUB
                    {carryout, aluout} = inreg1 - inreg2;
                    carryen = 1'b1;
                    sel_mux_mem_alu = 1'b1;
                    sel_mux_inp = 1'b0;
                    output_en = 1'b1;
                    wenout = 1'b1;
                    RegN = 2'b00;
                    RegD = 2'b01;
                    sel_mux_regD = 1'b0;
                    regM = 2'b01;
                end
                8'b00000010: begin // INC
                    {carryout, aluout} = inreg1 + 16'b1;
                    carryen = 1'b1;
                    sel_mux_mem_alu = 1'b1;
                    sel_mux_inp = 1'b0;
                    output_en = 1'b1;
                    wenout = 1'b1;
                    RegN = 2'b00;
                    RegD = 2'b01;
                    sel_mux_regD = 1'b0;
                    regM = 2'b00;
                end
                8'b00000011: begin // DEC
                    {carryout, aluout} = inreg1 - 16'b1;
                    carryen = 1'b1;
                    sel_mux_mem_alu = 1'b1;
                    sel_mux_inp = 1'b0;
                    output_en = 1'b1;
                    wenout = 1'b1;
                    RegN = 2'b00;
                    RegD = 2'b01;
                    sel_mux_regD = 1'b0;
                    regM = 2'b00;
                end
                8'b00000100: begin // MUL
                    mul0 = inreg1 & {16{inreg2[0]}};
                    mul1 = inreg1 & {16{inreg2[1]}};
                    mul2 = inreg1 & {16{inreg2[2]}};
                    mul3 = inreg1 & {16{inreg2[3]}};
                    mul4 = inreg1 & {16{inreg2[4]}};
                    mul5 = inreg1 & {16{inreg2[5]}};
                    mul6 = inreg1 & {16{inreg2[6]}};
                    mul7 = inreg1 & {16{inreg2[7]}};
                    mul8 = inreg1 & {16{inreg2[8]}};
                    mul9 = inreg1 & {16{inreg2[9]}};
                    mul10 = inreg1 & {16{inreg2[10]}};
                    mul11 = inreg1 & {16{inreg2[11]}};
                    mul12 = inreg1 & {16{inreg2[12]}};
                    mul13 = inreg1 & {16{inreg2[13]}};
                    mul14 = inreg1 & {16{inreg2[14]}};
                    mul15 = inreg1 & {16{inreg2[15]}};

                    mul = mul0 + (mul1 << 1) + (mul2 << 2) + (mul3 << 3)
                        + (mul4 << 4) + (mul5 << 5) + (mul6 << 6) + (mul7 << 7)
                        + (mul8 << 8) + (mul9 << 9) + (mul10 << 10) + (mul11 << 11)
                        + (mul12 << 12) + (mul13 << 13) + (mul14 << 14) + (mul15 << 15);

                    aluout = mul;
                    carryout = 1'b0;
                    carryen = 1'b0;
                    sel_mux_mem_alu = 1'b1;
                    sel_mux_inp = 1'b0;
                    output_en = 1'b1;
                    wenout = 1'b1;
                    RegN = 2'b00;
                    RegD = 2'b01;
                    sel_mux_regD = 1'b0;
                    regM = 2'b01;
                end
                default: begin
                    aluout = 16'b0;
                    carryout = 1'b0;
                    carryen = 1'b0;
                    sel_mux_mem_alu = 1'b0;
                    sel_mux_inp = 1'b0;
                    output_en = 1'b0;
                    wenout = 1'b0;
                    RegN = 2'b00;
                    RegD = 2'b00;
                    sel_mux_regD = 1'b0;
                    regM = 2'b00;
                end
            endcase
        end
        else begin
            aluout = 16'b0;
            carryout = 1'b0;
            carryen = 1'b0;
            sel_mux_mem_alu = 1'b0;
            sel_mux_inp = 1'b0;
            output_en = 1'b0;
            wenout = 1'b0;
            RegN = 2'b00;
            RegD = 2'b00;
            sel_mux_regD = 1'b0;
            regM = 2'b00;
        end
    end

endmodule