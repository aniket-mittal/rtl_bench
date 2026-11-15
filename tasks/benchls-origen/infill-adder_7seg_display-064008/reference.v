module origen_064008(SW, LEDR, HEX5, HEX3, HEX1, HEX0);
    input [9:0] SW;
    output [9:0] LEDR;
    output [6:0] HEX5, HEX3, HEX1, HEX0;

    wire [3:0] X, Y;
    wire Cin;
    wire [4:0] V;
    wire [3:0] M, S;

    assign X = SW[7:4];
    assign Y = SW[3:0];
    assign Cin = SW[8];

    binary_to_7seg b2s_X(X, HEX5);
    binary_to_7seg b2s_Y(Y, HEX3);

    four_bit_full_adder adder(X, Y, Cin, LEDR[4:0]);
    assign V = LEDR[4:0];

    circuitA cA(V[2:0], M[3]);
    circuitB cB(V[3:0], S);

    mux_4bit_2to1 mux1(S, {1'b0, V[3:1]}, V[0], M[2:0]);
    mux_1bit_2to1 mux2(V[4], 1'b0, V[0], LEDR[5]);

    binary_to_7seg b2s_M(M, HEX1);
    binary_to_7seg b2s_S(S, HEX0);

    assign LEDR[9:6] = 4'b0;
endmodule

module mux_4bit_2to1(a, b, sel, out);
    input [3:0] a, b;
    input sel;
    output [3:0] out;

    assign out = sel ? a : b;
endmodule

module circuitB(in, out);
    input [3:0] in;
    output [3:0] out;

    assign out[0] = in[0];
    assign out[1] = in[1] ^ in[0];
    assign out[2] = in[2] ^ (in[1] & in[0]);
    assign out[3] = in[3] ^ (in[2] & in[1] & in[0]);
endmodule

module circuitA(in, out);
    input [2:0] in;
    output out;

    assign out = (in[2] & in[1]) | (in[2] & in[0]) | (in[1] & in[0]);
endmodule

module binary_to_7seg(bin, seg);
    input [3:0] bin;
    output reg [6:0] seg;

    always @(*)
    begin
        case(bin)
            4'b0000: seg = 7'b1000000;
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
            4'b1010: seg = 7'b0001000;
            4'b1011: seg = 7'b0000011;
            4'b1100: seg = 7'b1000110;
            4'b1101: seg = 7'b0100001;
            4'b1110: seg = 7'b0000110;
            4'b1111: seg = 7'b0001110;
        endcase
    end
endmodule

module four_bit_full_adder(a, b, cin, sum);
    input [3:0] a, b;
    input cin;
    output [4:0] sum;

    wire [3:0] c;

    full_adder fa0(a[0], b[0], cin, sum[0], c[0]);
    full_adder fa1(a[1], b[1], c[0], sum[1], c[1]);
    full_adder fa2(a[2], b[2], c[1], sum[2], c[2]);
    full_adder fa3(a[3], b[3], c[2], sum[3], c[3]);

    assign sum[4] = c[3];
endmodule

module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module mux_1bit_2to1(a, b, sel, out);
    input a, b, sel;
    output out;

    assign out = sel ? a : b;
endmodule