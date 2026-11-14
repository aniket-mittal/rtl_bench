module origen_187920(
    input  wire [9:0] address,
    output wire [7:0] data_out
);

    reg [7:0] rom [0:40];

    initial begin
        rom[0] = 8'h01;
        rom[1] = 8'h02;
        rom[2] = 8'h03;
        rom[3] = 8'h04;
        rom[4] = 8'h05;
        rom[5] = 8'h06;
        rom[6] = 8'h07;
        rom[7] = 8'h08;
        rom[8] = 8'h09;
        rom[9] = 8'h0A;
        rom[10] = 8'h0B;
        rom[11] = 8'h0C;
        rom[12] = 8'h0D;
        rom[13] = 8'h0E;
        rom[14] = 8'h0F;
        rom[15] = 8'h10;
        rom[16] = 8'h11;
        rom[17] = 8'h12;
        rom[18] = 8'h13;
        rom[19] = 8'h14;
        rom[20] = 8'h15;
        rom[21] = 8'h16;
        rom[22] = 8'h17;
        rom[23] = 8'h18;
        rom[24] = 8'h19;
        rom[25] = 8'h1A;
        rom[26] = 8'h1B;
        rom[27] = 8'h1C;
        rom[28] = 8'h1D;
        rom[29] = 8'h1E;
        rom[30] = 8'h1F;
        rom[31] = 8'h20;
        rom[32] = 8'h21;
        rom[33] = 8'h22;
        rom[34] = 8'h23;
        rom[35] = 8'h24;
        rom[36] = 8'h25;
        rom[37] = 8'h26;
        rom[38] = 8'h27;
        rom[39] = 8'h28;
        rom[40] = 8'h29;
    end

    assign data_out = rom[address];

endmodule