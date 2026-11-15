module origen_134492(
    input [3:0] a, b,
    output [3:0] final_output
);

    wire [3:0] sum;
    wire carry_out;
    wire [1:0] priority_out;
    wire [4:0] mux_out;

    // Carry-lookahead adder
    carry_lookahead_adder cla(
        .a(a),
        .b(b),
        .sum(sum),
        .carry_out(carry_out)
    );

    // Priority encoder
    priority_encoder pe(
        .in({carry_out, sum}),
        .out(priority_out)
    );

    // Multiplexer
    mux_3to1 mux(
        .in0(a),
        .in1(b),
        .in2({carry_out, sum}),
        .sel(priority_out),
        .out(mux_out)
    );

    // Additional functional module
    functional_module fm(
        .a(a),
        .b(b),
        .sum_carry({carry_out, sum}),
        .mux_out(mux_out),
        .final_output(final_output)
    );

endmodule

module carry_lookahead_adder(
    input [3:0] a, b,
    output [3:0] sum,
    output carry_out
);
    wire [3:0] g, p;
    wire [4:0] c;

    assign g = a & b;
    assign p = a ^ b;
    assign c[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : cla_logic
            assign c[i+1] = g[i] | (p[i] & c[i]);
            assign sum[i] = p[i] ^ c[i];
        end
    endgenerate

    assign carry_out = c[4];
endmodule

module priority_encoder(
    input [4:0] in,
    output reg [1:0] out
);
    always @(*) begin
        casez (in)
            5'b1????: out = 2'b11;
            5'b01???: out = 2'b10;
            5'b001??: out = 2'b01;
            5'b0001?: out = 2'b00;
            default: out = 2'b00;
        endcase
    end
endmodule

module mux_3to1(
    input [3:0] in0, in1,
    input [4:0] in2,
    input [1:0] sel,
    output reg [4:0] out
);
    always @(*) begin
        case (sel)
            2'b00: out = {1'b0, in0};
            2'b01: out = {1'b0, in1};
            2'b10, 2'b11: out = in2;
        endcase
    end
endmodule

module functional_module(
    input [3:0] a, b,
    input [4:0] sum_carry,
    input [4:0] mux_out,
    output reg [3:0] final_output
);
    always @(*) begin
        case (mux_out[4])
            1'b0: final_output = mux_out[3:0] ^ a ^ b;
            1'b1: final_output = sum_carry[3:0] & a & b;
        endcase
    end
endmodule