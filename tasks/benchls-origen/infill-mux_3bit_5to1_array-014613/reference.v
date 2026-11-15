module origen_014613 (SW, LEDR, HEX4, HEX3, HEX2, HEX1, HEX0);
    input [17:0] SW;
    output [17:0] LEDR;
    output [6:0] HEX4, HEX3, HEX2, HEX1, HEX0;

    wire [2:0] M0, M1, M2, M3, M4;

    assign LEDR = SW;

    mux_3bit_5to1 m0 (
        .S(SW[17:15]),
        .U(SW[2:0]),
        .V(SW[5:3]),
        .W(SW[8:6]),
        .X(SW[11:9]),
        .Y(SW[14:12]),
        .M(M0)
    );

    mux_3bit_5to1 m1 (
        .S(SW[17:15]),
        .U(SW[5:3]),
        .V(SW[8:6]),
        .W(SW[11:9]),
        .X(SW[14:12]),
        .Y(SW[2:0]),
        .M(M1)
    );

    mux_3bit_5to1 m2 (
        .S(SW[17:15]),
        .U(SW[8:6]),
        .V(SW[11:9]),
        .W(SW[14:12]),
        .X(SW[2:0]),
        .Y(SW[5:3]),
        .M(M2)
    );

    mux_3bit_5to1 m3 (
        .S(SW[17:15]),
        .U(SW[11:9]),
        .V(SW[14:12]),
        .W(SW[2:0]),
        .X(SW[5:3]),
        .Y(SW[8:6]),
        .M(M3)
    );

    mux_3bit_5to1 m4 (
        .S(SW[17:15]),
        .U(SW[14:12]),
        .V(SW[2:0]),
        .W(SW[5:3]),
        .X(SW[8:6]),
        .Y(SW[11:9]),
        .M(M4)
    );

    char_7seg H0 (M0, HEX0);
    char_7seg H1 (M1, HEX1);
    char_7seg H2 (M2, HEX2);
    char_7seg H3 (M3, HEX3);
    char_7seg H4 (M4, HEX4);
endmodule

module mux_3bit_5to1 (S, U, V, W, X, Y, M);
    input [2:0] S, U, V, W, X, Y;
    output reg [2:0] M;

    always @(*)
    begin
        case (S)
            3'b000: M = U;
            3'b001: M = V;
            3'b010: M = W;
            3'b011: M = X;
            3'b100: M = Y;
            default: M = Y;
        endcase
    end
endmodule

module char_7seg (C, Display);
    input [2:0] C;
    output reg [6:0] Display;

    always @(*)
    begin
        case (C)
            3'b000: Display = 7'b1000000; // 0
            3'b001: Display = 7'b1111001; // 1
            3'b010: Display = 7'b0100100; // 2
            3'b011: Display = 7'b0110000; // 3
            3'b100: Display = 7'b0011001; // 4
            3'b101: Display = 7'b0010010; // 5
            3'b110: Display = 7'b0000010; // 6
            3'b111: Display = 7'b1111000; // 7
            default: Display = 7'b1111111; // All segments off
        endcase
    end
endmodule