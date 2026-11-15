module origen_059079(
    input [15:0] x,
    input clk,
    input rst,
    output reg [6:0] a_to_g,
    output reg [3:0] an
);

reg [19:0] clkdiv;
wire [1:0] s;
reg [3:0] digit;

always @(posedge clk or posedge rst)
    if (rst)
        clkdiv <= 20'b0;
    else
        clkdiv <= clkdiv + 1;

assign s = clkdiv[19:18];

always @*
    case(s)
        2'b00: digit = x[3:0];
        2'b01: digit = x[7:4];
        2'b10: digit = x[11:8];
        2'b11: digit = x[15:12];
    endcase

always @*
    case(digit)
        4'h0: a_to_g = 7'b1000000;
        4'h1: a_to_g = 7'b1111001;
        4'h2: a_to_g = 7'b0100100;
        4'h3: a_to_g = 7'b0110000;
        4'h4: a_to_g = 7'b0011001;
        4'h5: a_to_g = 7'b0010010;
        4'h6: a_to_g = 7'b0000010;
        4'h7: a_to_g = 7'b1111000;
        4'h8: a_to_g = 7'b0000000;
        4'h9: a_to_g = 7'b0010000;
        4'ha: a_to_g = 7'b0001000;
        4'hb: a_to_g = 7'b0000011;
        4'hc: a_to_g = 7'b1000110;
        4'hd: a_to_g = 7'b0100001;
        4'he: a_to_g = 7'b0000110;
        4'hf: a_to_g = 7'b0001110;
    endcase

always @*
    case(s)
        2'b00: an = 4'b1110;
        2'b01: an = 4'b1101;
        2'b10: an = 4'b1011;
        2'b11: an = 4'b0111;
    endcase

endmodule