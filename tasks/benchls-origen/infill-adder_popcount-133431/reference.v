module origen_133431 (
    input [31:0] a,
    input [31:0] b,
    output [7:0] final_output
);

    wire [31:0] sum;
    wire [5:0] ones_count;

    binary_adder adder (
        .a(a),
        .b(b),
        .sum(sum)
    );

    count_ones counter (
        .input_num(sum),
        .count(ones_count)
    );

    final_processor processor (
        .sum(sum),
        .ones_count(ones_count),
        .final_output(final_output)
    );

endmodule

module binary_adder (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    assign sum = a + b;

endmodule

module count_ones (
    input [31:0] input_num,
    output reg [5:0] count
);

    integer i;

    always @(*) begin
        count = 0;
        for (i = 0; i < 32; i = i + 1) begin
            count = count + input_num[i];
        end
    end

endmodule

module final_processor (
    input [31:0] sum,
    input [5:0] ones_count,
    output reg [7:0] final_output
);

    always @(*) begin
        final_output = sum[7:0] ^ {2'b00, ones_count};
    end

endmodule