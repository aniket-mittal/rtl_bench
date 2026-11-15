module origen_128749(
    input [7:0] mux_in0, mux_in1, mux_in2, mux_in3,
    input [1:0] mux_sel,
    input mux_en,
    input [3:0] addsub_a, addsub_b,
    input addsub_mode,
    input [1:0] func_sel,
    input control_sel,
    output [7:0] system_out
);

    wire [7:0] mux_out;
    wire [3:0] addsub_out;
    wire addsub_overflow;
    wire [7:0] func_out;

    // 4-to-1 multiplexer with enable
    mux4to1_en mux (
        .in0(mux_in0),
        .in1(mux_in1),
        .in2(mux_in2),
        .in3(mux_in3),
        .sel(mux_sel),
        .en(mux_en),
        .out(mux_out)
    );

    // 4-bit adder/subtractor with overflow detection
    adder_subtractor addsub (
        .a(addsub_a),
        .b(addsub_b),
        .mode(addsub_mode),
        .sum(addsub_out),
        .overflow(addsub_overflow)
    );

    // Functional module
    functional_module func (
        .in1(mux_out),
        .in2({4'b0000, addsub_out}),
        .sel(func_sel),
        .out(func_out)
    );

    // Control logic
    assign system_out = control_sel ? func_out : mux_out;

endmodule

module mux4to1_en(
    input [7:0] in0, in1, in2, in3,
    input [1:0] sel,
    input en,
    output reg [7:0] out
);
    always @(*) begin
        if (en)
            case (sel)
                2'b00: out = in0;
                2'b01: out = in1;
                2'b10: out = in2;
                2'b11: out = in3;
            endcase
        else
            out = 8'b0;
    end
endmodule

module adder_subtractor(
    input [3:0] a, b,
    input mode,
    output reg [3:0] sum,
    output reg overflow
);
    always @(*) begin
        if (mode == 0) begin
            {overflow, sum} = a + b;
        end else begin
            {overflow, sum} = a - b;
        end
    end
endmodule

module functional_module(
    input [7:0] in1, in2,
    input [1:0] sel,
    output reg [7:0] out
);
    always @(*) begin
        case (sel)
            2'b00: out = in1 + in2;
            2'b01: out = in1 - in2;
            default: out = 8'b0;
        endcase
    end
endmodule