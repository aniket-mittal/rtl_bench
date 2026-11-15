module origen_137045(
    input [1:0] a, b, c, d,
    output [7:0] result
);

    wire [1:0] mux_out;

    // 4-to-1 multiplexer
    mux_4to1 mux (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel({a, c}),
        .y(mux_out)
    );

    // 2-bit comparator
    comparator_2bit comp (
        .a(mux_out),
        .b({b[1], d[1]}),
        .result(result)
    );

endmodule

module mux_4to1(
    input [1:0] a, b, c, d,
    input [1:0] sel,
    output reg [1:0] y
);

    always @(*) begin
        case(sel)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
        endcase
    end

endmodule

module comparator_2bit(
    input [1:0] a, b,
    output reg [7:0] result
);

    always @(*) begin
        if (a > b)
            result = 8'b10000010;
        else if (a < b)
            result = 8'b01000001;
        else
            result = 8'b00100100;
    end

endmodule