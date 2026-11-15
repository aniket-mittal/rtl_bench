module origen_016558 (
    input wire clk,
    input wire reset,
    input wire [15:0] shift_in,
    input wire [15:0] comp_a,
    input wire [15:0] comp_b,
    input wire [15:0] x,
    input wire [15:0] y,
    input wire [11:0] val,
    input wire [11:0] val2,
    input wire [3:0] to_negate,
    input wire invert,
    output wire [15:0] signed_shift_out,
    output wire [15:0] unsigned_shift_out,
    output wire signed_comp_out,
    output wire unsigned_comp_out,
    output wire [15:0] logical_left_shift,
    output wire [15:0] arithmetic_left_shift,
    output wire [15:0] logical_right_shift,
    output wire [15:0] arithmetic_right_shift,
    output wire [16:0] sum_signed,
    output wire [16:0] sum_unsigned,
    output wire [11:0] abs_val,
    output wire [11:0] abs_val2,
    output wire [3:0] negated_out
);

    // Shift operations
    signed_shift signed_shifter (
        .clk(clk),
        .reset(reset),
        .shift_in(shift_in),
        .shift_out(signed_shift_out)
    );

    unsigned_shift unsigned_shifter (
        .clk(clk),
        .reset(reset),
        .shift_in(shift_in),
        .shift_out(unsigned_shift_out)
    );

    // Comparison operations
    signed_compare signed_comparator (
        .comp_a(comp_a),
        .comp_b(comp_b),
        .comp_out(signed_comp_out)
    );

    unsigned_compare unsigned_comparator (
        .comp_a(comp_a),
        .comp_b(comp_b),
        .comp_out(unsigned_comp_out)
    );

    // Bit manipulation examples
    assign logical_left_shift = shift_in << 2;
    assign arithmetic_left_shift = $signed(shift_in) <<< 2;
    assign logical_right_shift = shift_in >> 2;
    assign arithmetic_right_shift = $signed(shift_in) >>> 2;

    // Addition
    assign sum_signed = $signed(x) + $signed(y);
    assign sum_unsigned = x + y;

    // Absolute value calculation
    assign abs_val = (val[11]) ? (~val + 1'b1) : val;
    assign abs_val2 = (val2[11]) ? (~val2 + 1'b1) : val2;

    // Arithmetic negation
    assign negated_out = invert ? -$signed(to_negate) : to_negate;

endmodule

module signed_shift (
    input wire clk,
    input wire reset,
    input wire [15:0] shift_in,
    output reg [15:0] shift_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_out <= 16'b0;
        else
            shift_out <= $signed(shift_in) >>> 1;
    end
endmodule

module unsigned_shift (
    input wire clk,
    input wire reset,
    input wire [15:0] shift_in,
    output reg [15:0] shift_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_out <= 16'b0;
        else
            shift_out <= shift_in >>> 1;
    end
endmodule

module signed_compare (
    input wire [15:0] comp_a,
    input wire [15:0] comp_b,
    output wire comp_out
);
    assign comp_out = $signed(comp_a) > $signed(comp_b);
endmodule

module unsigned_compare (
    input wire [15:0] comp_a,
    input wire [15:0] comp_b,
    output wire comp_out
);
    assign comp_out = comp_a > comp_b;
endmodule