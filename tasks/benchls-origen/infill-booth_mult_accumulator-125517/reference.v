module origen_125517(
    input wire clk,
    input wire reset,
    input wire [15:0] A,
    input wire [15:0] B,
    input wire C,
    input wire load,
    input wire shift_left,
    output wire [31:0] result
);

    wire [3:0] shift_reg_out;
    wire [31:0] multiplier_out;
    reg [31:0] accumulator;

    // 4-bit shift register
    shift_register_4bit shift_reg (
        .clk(clk),
        .reset(reset),
        .load(load),
        .shift_left(shift_left),
        .data_in(A[3:0]),
        .data_out(shift_reg_out)
    );

    // 16-bit Booth's algorithm multiplier
    booth_multiplier_16bit booth_mult (
        .A({12'b0, shift_reg_out}),
        .B(B),
        .C(C),
        .result(multiplier_out)
    );

    // Accumulator
    always @(posedge clk or posedge reset) begin
        if (reset)
            accumulator <= 32'b0;
        else if (shift_left)
            accumulator <= accumulator + multiplier_out;
    end

    // Final output module
    final_output final_out (
        .shift_reg_out(shift_reg_out),
        .multiplier_out(multiplier_out),
        .accumulator(accumulator),
        .C(C),
        .result(result)
    );

endmodule

module shift_register_4bit(
    input wire clk,
    input wire reset,
    input wire load,
    input wire shift_left,
    input wire [3:0] data_in,
    output reg [3:0] data_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 4'b0;
        else if (load)
            data_out <= data_in;
        else if (shift_left)
            data_out <= {data_out[2:0], 1'b0};
    end

endmodule

module booth_multiplier_16bit(
    input wire [15:0] A,
    input wire [15:0] B,
    input wire C,
    output reg [31:0] result
);

    // Booth's algorithm implementation
    // (simplified for brevity)
    always @(*) begin
        if (C)
            result = $signed(A) * $signed(B);
        else
            result = A * B;
    end

endmodule

module final_output(
    input wire [3:0] shift_reg_out,
    input wire [31:0] multiplier_out,
    input wire [31:0] accumulator,
    input wire C,
    output reg [31:0] result
);

    always @(*) begin
        if (C)
            result = $signed(accumulator);
        else
            result = accumulator;
    end

endmodule