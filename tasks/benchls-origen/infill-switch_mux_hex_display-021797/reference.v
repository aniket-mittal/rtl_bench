module origen_021797(
    input [9:0] sw,
    output [9:0] led,
    output [6:0] hex,
    output [7:0] hex_on
);

    assign led = sw;
    assign hex_on = 8'b11111110;

    wire [3:0] dc1, dc2;
    wire [1:0] dc_switcher;
    wire [3:0] dc1_output, dc2_output, function_output, dc_dec;

    assign dc1 = sw[3:0];
    assign dc2 = sw[7:4];
    assign dc_switcher = sw[9:8];

    // Count adjacent '10' pairs in dc1
    assign dc1_output = (dc1[3:2] == 2'b10) + (dc1[2:1] == 2'b10) + (dc1[1:0] == 2'b10);

    // Bitwise AND between dc2 and 4'b1101
    assign dc2_output = dc2 & 4'b1101;

    // Boolean function (sw[0] & sw[1]) ^ (sw[2] | sw[3])
    assign function_output = (sw[0] & sw[1]) ^ (sw[2] | sw[3]);

    // Multiplexer
    assign dc_dec = (dc_switcher == 2'b00) ? dc1_output :
                    (dc_switcher == 2'b01) ? dc2_output :
                    (dc_switcher == 2'b10) ? function_output :
                    dc1;

    // 7-segment display decoder
    reg [6:0] hex_reg;
    always @(*) begin
        case(dc_dec)
            4'h0: hex_reg = 7'b1000000;
            4'h1: hex_reg = 7'b1111001;
            4'h2: hex_reg = 7'b0100100;
            4'h3: hex_reg = 7'b0110000;
            4'h4: hex_reg = 7'b0011001;
            4'h5: hex_reg = 7'b0010010;
            4'h6: hex_reg = 7'b0000010;
            4'h7: hex_reg = 7'b1111000;
            4'h8: hex_reg = 7'b0000000;
            4'h9: hex_reg = 7'b0010000;
            4'ha: hex_reg = 7'b0001000;
            4'hb: hex_reg = 7'b0000011;
            4'hc: hex_reg = 7'b1000110;
            4'hd: hex_reg = 7'b0100001;
            4'he: hex_reg = 7'b0000110;
            4'hf: hex_reg = 7'b0001110;
        endcase
    end

    assign hex = hex_reg;

endmodule