module origen_141635(
    input wire [31:0] a,
    input wire [31:0] b,
    input wire clk,
    input wire reset,
    output wire [3:0] result
);

    wire [31:0] abs_a, abs_b;
    wire [31:0] diff;
    wire [3:0] shift_out;

    // Absolute value modules
    absolute_value abs_mod_a (
        .in(a),
        .out(abs_a)
    );

    absolute_value abs_mod_b (
        .in(b),
        .out(abs_b)
    );

    // Compute absolute difference
    assign diff = (abs_a > abs_b) ? (abs_a - abs_b) : (abs_b - abs_a);

    // 4-bit shift register
    shift_register_4bit shift_reg (
        .clk(clk),
        .reset(reset),
        .in(diff[3:0]),
        .out(shift_out)
    );

    // Output the result
    assign result = shift_out;

endmodule

module absolute_value(
    input wire [31:0] in,
    output wire [31:0] out
);

    assign out = in[31] ? -in : in;

endmodule

module shift_register_4bit(
    input wire clk,
    input wire reset,
    input wire [3:0] in,
    output reg [3:0] out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 4'b0000;
        else
            out <= in;
    end

endmodule