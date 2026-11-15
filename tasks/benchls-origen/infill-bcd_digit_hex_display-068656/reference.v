module origen_068656(
    input [4:0] digits,
    output [6:0] HEX1, HEX0
);

    wire [3:0] V, S, A, M0, B, M1;
    wire cout;

    assign cout = digits[4];
    assign V = digits[3:0];

    comparator comp(.V(V), .S(S));

    assign A[3] = V[3];
    assign A[2] = V[2] & ~V[3];
    assign A[1] = V[1] & ~V[3];
    assign A[0] = V[0];

    assign M0 = S[0] ? A : V;

    assign B[3] = M0[3];
    assign B[2] = M0[2];
    assign B[1] = M0[1] & ~M0[3];
    assign B[0] = M0[0];

    assign M1 = cout ? B : M0;

    seven_segment_decoder hex1(.in({3'b000, (S[0] | cout)}), .out(HEX1));
    seven_segment_decoder hex0(.in(M1), .out(HEX0));

endmodule

module comparator(
    input [3:0] V,
    output [3:0] S
);
    assign S[0] = (V[3] & V[2]) | (V[3] & V[1]);
    assign S[3:1] = 3'b000;
endmodule

module seven_segment_decoder(
    input [3:0] in,
    output reg [6:0] out
);
    always @(*) begin
        case(in)
            4'b0000: out = 7'b1000000; // 0
            4'b0001: out = 7'b1111001; // 1
            4'b0010: out = 7'b0100100; // 2
            4'b0011: out = 7'b0110000; // 3
            4'b0100: out = 7'b0011001; // 4
            4'b0101: out = 7'b0010010; // 5
            4'b0110: out = 7'b0000010; // 6
            4'b0111: out = 7'b1111000; // 7
            4'b1000: out = 7'b0000000; // 8
            4'b1001: out = 7'b0010000; // 9
            default: out = 7'b1111111; // off
        endcase
    end
endmodule