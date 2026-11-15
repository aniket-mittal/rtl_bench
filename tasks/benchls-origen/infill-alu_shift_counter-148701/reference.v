module origen_148701(
    input [2:0] a, b,
    input clk, reset_n, load, enable, shift_left,
    input [3:0] data_in,
    input select_calculator,
    input select_and,
    output [3:0] outv
);

    wire [2:0] and_out, xor_out, calculator_out;
    wire [3:0] shift_reg_out;
    wire [2:0] active_out;
    wire [2:0] count_ones_out;

    // Bitwise AND module
    bitwise_and and_module(
        .a(a),
        .b(b),
        .out(and_out)
    );

    // Bitwise XOR module
    bitwise_xor xor_module(
        .a(a),
        .b(b),
        .out(xor_out)
    );

    // Operation selector module
    operation_selector op_selector(
        .and_in(and_out),
        .xor_in(xor_out),
        .select_and(select_and),
        .out(calculator_out)
    );

    // 4-bit shift register
    shift_register shift_reg(
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .enable(enable),
        .shift_left(shift_left),
        .data_in(data_in),
        .out(shift_reg_out)
    );

    // Control logic to select between calculator and shift register
    assign active_out = select_calculator ? calculator_out : shift_reg_out[2:0];

    // Count ones module
    count_ones counter(
        .in(active_out),
        .out(count_ones_out)
    );

    // Assign final output
    assign outv = {1'b0, count_ones_out};

endmodule

module bitwise_and(
    input [2:0] a, b,
    output [2:0] out
);
    assign out = a & b;
endmodule

module bitwise_xor(
    input [2:0] a, b,
    output [2:0] out
);
    assign out = a ^ b;
endmodule

module operation_selector(
    input [2:0] and_in, xor_in,
    input select_and,
    output [2:0] out
);
    assign out = select_and ? and_in : xor_in;
endmodule

module shift_register(
    input clk, reset_n, load, enable, shift_left,
    input [3:0] data_in,
    output reg [3:0] out
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            out <= 4'b0000;
        else if (load)
            out <= data_in;
        else if (enable) begin
            if (shift_left)
                out <= {out[2:0], 1'b0};
            else
                out <= {1'b0, out[3:1]};
        end
    end
endmodule

module count_ones(
    input [2:0] in,
    output reg [2:0] out
);
    always @(*) begin
        case (in)
            3'b000: out = 3'b000;
            3'b001, 3'b010, 3'b100: out = 3'b001;
            3'b011, 3'b101, 3'b110: out = 3'b010;
            3'b111: out = 3'b011;
        endcase
    end
endmodule