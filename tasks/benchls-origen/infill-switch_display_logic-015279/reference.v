module origen_015279(
    input [3:0] SW,
    output [3:0] LEDR,
    output [1:0] LEDG,
    output [6:0] HEX0,
    output [6:0] HEX1
);

    wire k;
    wire [2:0] l;
    wire [3:0] m;

    // Direct switch display
    assign LEDR = SW;

    // Comparator
    comp comparator(
        .a(SW),
        .k(k)
    );
    assign LEDG[0] = k;
    assign LEDG[1] = 1'b0;

    // Circuit A
    circuita circuit_a(
        .a(SW[2:0]),
        .l(l)
    );

    // Multiplexing
    mux mux0(.a(SW[0]), .b(l[0]), .s(k), .m(m[0]));
    mux mux1(.a(SW[1]), .b(l[1]), .s(k), .m(m[1]));
    mux mux2(.a(SW[2]), .b(l[2]), .s(k), .m(m[2]));
    mux mux3(.a(SW[3]), .b(1'b0), .s(k), .m(m[3]));

    // 7-segment display for HEX0
    yediseg seg_display(
        .a(m),
        .b(HEX0)
    );

    // Circuit B for HEX1
    circuitb circuit_b(
        .a(k),
        .b(HEX1)
    );

endmodule

module comp(
    input [3:0] a,
    output k
);
    assign k = a[3] & (a[2] | a[1]);
endmodule

module circuita(
    input [2:0] a,
    output [2:0] l
);
    assign l[0] = a[0];
    assign l[1] = a[1] ^ a[0];
    assign l[2] = a[2] & (a[1] | a[0]);
endmodule

module mux(
    input a,
    input b,
    input s,
    output m
);
    assign m = s ? b : a;
endmodule

module yediseg(
    input [3:0] a,
    output reg [6:0] b
);
    always @(*) begin
        case(a)
            4'b0000: b = 7'b1000000; // 0
            4'b0001: b = 7'b1111001; // 1
            4'b0010: b = 7'b0100100; // 2
            4'b0011: b = 7'b0110000; // 3
            4'b0100: b = 7'b0011001; // 4
            4'b0101: b = 7'b0010010; // 5
            4'b0110: b = 7'b0000010; // 6
            4'b0111: b = 7'b1111000; // 7
            4'b1000: b = 7'b0000000; // 8
            4'b1001: b = 7'b0010000; // 9
            4'b1010: b = 7'b0001000; // A
            4'b1011: b = 7'b0000011; // b
            4'b1100: b = 7'b1000110; // C
            4'b1101: b = 7'b0100001; // d
            4'b1110: b = 7'b0000110; // E
            4'b1111: b = 7'b0001110; // F
            default: b = 7'b1111111; // All segments off
        endcase
    end
endmodule

module circuitb(
    input a,
    output [6:0] b
);
    assign b = a ? 7'b1111001 : 7'b1000000; // 1 if a is high, 0 otherwise
endmodule