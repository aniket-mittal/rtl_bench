module origen_112223(
    input [7:0] A,
    input [7:0] B,
    input op,
    output [7:0] S,
    output sinal
);

    wire [7:0] mux_out;
    wire [8:0] carry;

    assign carry[0] = op;
    assign sinal = S[7];

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : alu_stage
            mux2 mux_inst (
                .d0(B[i]),
                .d1(~B[i]),
                .sel(op),
                .y(mux_out[i])
            );

            fadder fa_inst (
                .a(A[i]),
                .b(mux_out[i]),
                .cin(carry[i]),
                .s(S[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

endmodule

module mux2(
    input d0,
    input d1,
    input sel,
    output y
);

    wire [1:0] d = {d1, d0};
    assign y = d[sel];

endmodule

module fadder(
    input a,
    input b,
    input cin,
    output s,
    output cout
);

    wire [1:0] sum = a + b + cin;
    assign s = sum[0];
    assign cout = sum[1];

endmodule