module origen_123403(
    input [31:0] a,
    input [31:0] b,
    input [31:0] mux_in1,
    input [31:0] mux_in2,
    input [31:0] mux_in3,
    input select,
    output [31:0] final_output
);

    wire [31:0] adder_out;
    wire [31:0] mux_out;
    wire [31:0] func_out;

    // 32-bit ripple carry adder
    ripple_carry_adder rca(
        .a(a),
        .b(b),
        .sum(adder_out)
    );

    // 3-input, 4-output multiplexer
    multiplexer mux(
        .in1(mux_in1),
        .in2(mux_in2),
        .in3(mux_in3),
        .select(select),
        .out(mux_out)
    );

    // Additional functional module
    functional_module func(
        .adder_out(adder_out),
        .mux_in1(mux_in1),
        .mux_in2(mux_in2),
        .mux_in3(mux_in3),
        .mux_out(mux_out),
        .select(select),
        .out(func_out)
    );

    // Final output selection
    assign final_output = select ? mux_out : adder_out;

endmodule

module ripple_carry_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [32:0] carry;
    assign carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : fa
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module multiplexer(
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input select,
    output reg [31:0] out
);
    always @(*) begin
        case(select)
            1'b0: out = in1;
            1'b1: out = in2;
            default: out = in3;
        endcase
    end
endmodule

module functional_module(
    input [31:0] adder_out,
    input [31:0] mux_in1,
    input [31:0] mux_in2,
    input [31:0] mux_in3,
    input [31:0] mux_out,
    input select,
    output [31:0] out
);
    wire [31:0] sum_mux_inputs;
    assign sum_mux_inputs = mux_in1 + mux_in2 + mux_in3;

    assign out = select ? (adder_out + sum_mux_inputs) : (mux_out + sum_mux_inputs);
endmodule