module origen_009464(
    input [31:0] in,
    output [5:0] sum
);

    wire [15:0] w;
    wire [7:0] x;
    wire [3:0] y;
    wire [1:0] z;

    // Level 1: 16 half-adders
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_half_adders
            half_adder ha (
                .a(in[2*i]),
                .b(in[2*i+1]),
                .sum(w[i]),
                .carry()
            );
        end
    endgenerate

    // Level 2: 8 2-bit adders
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_2bit_adders
            adder_2bit add2 (
                .a({1'b0, w[2*i]}),
                .b({1'b0, w[2*i+1]}),
                .sum(x[i]),
                .carry()
            );
        end
    endgenerate

    // Level 3: 4 3-bit adders
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_3bit_adders
            adder_3bit add3 (
                .a({1'b0, x[2*i]}),
                .b({1'b0, x[2*i+1]}),
                .sum(y[i]),
                .carry()
            );
        end
    endgenerate

    // Level 4: 2 4-bit adders
    generate
        for (i = 0; i < 2; i = i + 1) begin : gen_4bit_adders
            adder_4bit add4 (
                .a({1'b0, y[2*i]}),
                .b({1'b0, y[2*i+1]}),
                .sum(z[i]),
                .carry()
            );
        end
    endgenerate

    // Level 5: Final 5-bit adder
    adder_5bit add5 (
        .a({1'b0, z[0]}),
        .b({1'b0, z[1]}),
        .sum(sum),
        .carry()
    );

endmodule

module half_adder(
    input a, b,
    output sum, carry
);
    assign {carry, sum} = a + b;
endmodule

module adder_2bit(
    input [1:0] a, b,
    output [1:0] sum,
    output carry
);
    assign {carry, sum} = a + b;
endmodule

module adder_3bit(
    input [2:0] a, b,
    output [2:0] sum,
    output carry
);
    assign {carry, sum} = a + b;
endmodule

module adder_4bit(
    input [3:0] a, b,
    output [3:0] sum,
    output carry
);
    assign {carry, sum} = a + b;
endmodule

module adder_5bit(
    input [4:0] a, b,
    output [5:0] sum,
    output carry
);
    assign {carry, sum} = a + b;
endmodule