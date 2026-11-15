module origen_139361(
    input [2047:0] mux_256_inputs,
    input [7:0] sel_256,
    input [1:0] enable,
    input [7:0] a,
    input [7:0] b,
    input sel_b1,
    input sel_b2,
    input control,
    output [7:0] final_output
);

    wire [7:0] mux_256_output;
    wire [7:0] mux_2_output;

    mux_256_to_1 mux256 (
        .inputs(mux_256_inputs),
        .sel(sel_256),
        .enable(enable),
        .out(mux_256_output)
    );

    mux_2_to_1 mux2 (
        .a(a),
        .b(b),
        .sel_b1(sel_b1),
        .sel_b2(sel_b2),
        .out(mux_2_output)
    );

    functional_module func_mod (
        .in1(mux_256_output),
        .in2(mux_2_output),
        .control(control),
        .out(final_output)
    );

endmodule

module mux_256_to_1 (
    input [2047:0] inputs,
    input [7:0] sel,
    input [1:0] enable,
    output reg [7:0] out
);

    wire [3:0] decoded_enable;

    decoder_2_to_4 dec (
        .in(enable),
        .out(decoded_enable)
    );

    always @(*) begin
        if (decoded_enable[sel[7:6]])
            out = inputs[sel[5:0] * 8 +: 8];
        else
            out = 8'b0;
    end

endmodule

module decoder_2_to_4 (
    input [1:0] in,
    output reg [3:0] out
);

    always @(*) begin
        case (in)
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
        endcase
    end

endmodule

module mux_2_to_1 (
    input [7:0] a,
    input [7:0] b,
    input sel_b1,
    input sel_b2,
    output reg [7:0] out
);

    always @(*) begin
        if (sel_b1 && sel_b2)
            out = b;
        else
            out = a;
    end

endmodule

module functional_module (
    input [7:0] in1,
    input [7:0] in2,
    input control,
    output reg [7:0] out
);

    always @(*) begin
        if (control)
            out = in2;
        else
            out = in1;
    end

endmodule