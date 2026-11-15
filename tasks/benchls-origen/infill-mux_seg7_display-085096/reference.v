module origen_085096(SW, LEDR, HEX0, HEX1, HEX2);
    input [9:0] SW;
    output [9:0] LEDR;
    output [6:0] HEX0, HEX1, HEX2;

    assign LEDR = SW;

    wire [1:0] M0, M1, M2;

    mux_2bit_3to1 mux0(
        .U(SW[1:0]),
        .V(SW[3:2]),
        .W(SW[5:4]),
        .S(SW[9:8]),
        .M(M0)
    );

    mux_2bit_3to1 mux1(
        .U(SW[1:0]),
        .V(SW[3:2]),
        .W(SW[5:4]),
        .S(SW[9:8]),
        .M(M1)
    );

    mux_2bit_3to1 mux2(
        .U(SW[1:0]),
        .V(SW[3:2]),
        .W(SW[5:4]),
        .S(SW[9:8]),
        .M(M2)
    );

    char_7seg c0(M0, HEX0);
    char_7seg c1(M1, HEX1);
    char_7seg c2(M2, HEX2);
endmodule

module mux_2bit_3to1(U, V, W, S, M);
    input [1:0] U, V, W;
    input [1:0] S;
    output [1:0] M;

    wire [1:0] m0, m1;

    assign m0 = S[0] ? V : U;
    assign m1 = S[0] ? W : U;
    assign M = S[1] ? m1 : m0;
endmodule

module char_7seg(C, Display);
    input [1:0] C;
    output [6:0] Display;

    assign Display = (C == 2'b00) ? 7'b1000001 :  // A
                     (C == 2'b01) ? 7'b0001000 :  // t
                     (C == 2'b10) ? 7'b1000110 :  // C
                     7'b0001110;                  // F
endmodule