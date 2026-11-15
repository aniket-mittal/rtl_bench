module origen_109571 (
    input  logic [11:0] i_coord,
    output logic [6:0]  o_seven_3,
    output logic [6:0]  o_seven_2,
    output logic [6:0]  o_seven_1
);

    // 7-segment display patterns (active low)
    localparam logic [6:0] D0 = 7'b1000000;
    localparam logic [6:0] D1 = 7'b1111001;
    localparam logic [6:0] D2 = 7'b0100100;
    localparam logic [6:0] D3 = 7'b0110000;
    localparam logic [6:0] D4 = 7'b0011001;
    localparam logic [6:0] D5 = 7'b0010010;
    localparam logic [6:0] D6 = 7'b0000010;
    localparam logic [6:0] D7 = 7'b1111000;
    localparam logic [6:0] D8 = 7'b0000000;
    localparam logic [6:0] D9 = 7'b0010000;
    localparam logic [6:0] DA = 7'b0001000;
    localparam logic [6:0] DB = 7'b0000011;
    localparam logic [6:0] DC = 7'b1000110;
    localparam logic [6:0] DD = 7'b0100001;
    localparam logic [6:0] DE = 7'b0000110;
    localparam logic [6:0] DF = 7'b0001110;

    always_comb begin
        case (i_coord[11:8])
            4'h0: o_seven_3 = D0;
            4'h1: o_seven_3 = D1;
            4'h2: o_seven_3 = D2;
            4'h3: o_seven_3 = D3;
            4'h4: o_seven_3 = D4;
            4'h5: o_seven_3 = D5;
            4'h6: o_seven_3 = D6;
            4'h7: o_seven_3 = D7;
            4'h8: o_seven_3 = D8;
            4'h9: o_seven_3 = D9;
            4'ha: o_seven_3 = DA;
            4'hb: o_seven_3 = DB;
            4'hc: o_seven_3 = DC;
            4'hd: o_seven_3 = DD;
            4'he: o_seven_3 = DE;
            4'hf: o_seven_3 = DF;
            default: o_seven_3 = 7'b1111111;
        endcase
    end

    always_comb begin
        case (i_coord[7:4])
            4'h0: o_seven_2 = D0;
            4'h1: o_seven_2 = D1;
            4'h2: o_seven_2 = D2;
            4'h3: o_seven_2 = D3;
            4'h4: o_seven_2 = D4;
            4'h5: o_seven_2 = D5;
            4'h6: o_seven_2 = D6;
            4'h7: o_seven_2 = D7;
            4'h8: o_seven_2 = D8;
            4'h9: o_seven_2 = D9;
            4'ha: o_seven_2 = DA;
            4'hb: o_seven_2 = DB;
            4'hc: o_seven_2 = DC;
            4'hd: o_seven_2 = DD;
            4'he: o_seven_2 = DE;
            4'hf: o_seven_2 = DF;
            default: o_seven_2 = 7'b1111111;
        endcase
    end

    always_comb begin
        case (i_coord[3:0])
            4'h0: o_seven_1 = D0;
            4'h1: o_seven_1 = D1;
            4'h2: o_seven_1 = D2;
            4'h3: o_seven_1 = D3;
            4'h4: o_seven_1 = D4;
            4'h5: o_seven_1 = D5;
            4'h6: o_seven_1 = D6;
            4'h7: o_seven_1 = D7;
            4'h8: o_seven_1 = D8;
            4'h9: o_seven_1 = D9;
            4'ha: o_seven_1 = DA;
            4'hb: o_seven_1 = DB;
            4'hc: o_seven_1 = DC;
            4'hd: o_seven_1 = DD;
            4'he: o_seven_1 = DE;
            4'hf: o_seven_1 = DF;
            default: o_seven_1 = 7'b1111111;
        endcase
    end

endmodule