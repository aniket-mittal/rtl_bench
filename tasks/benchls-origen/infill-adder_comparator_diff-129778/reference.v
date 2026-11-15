module origen_129778(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout,
    output [1:0] comp_result,
    output [3:0] difference,
    output borrow
);

    wire [3:0] adder_out;
    wire adder_cout;
    wire [1:0] comp_out;

    // Instantiate 4-bit magnitude comparator
    magnitude_comparator comp (
        .a(a),
        .b(b),
        .result(comp_out)
    );

    // Instantiate 4-bit adder
    adder_4bit add (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(adder_out),
        .cout(adder_cout)
    );

    // Instantiate difference calculator
    difference_calculator diff_calc (
        .a(a),
        .b(b),
        .comp_result(comp_out),
        .adder_out(adder_out),
        .adder_cout(adder_cout),
        .difference(difference),
        .borrow(borrow)
    );

    // Connect outputs
    assign sum = adder_out;
    assign cout = adder_cout;
    assign comp_result = comp_out;

endmodule

module magnitude_comparator(
    input [3:0] a,
    input [3:0] b,
    output reg [1:0] result
);

    always @(*) begin
        if (a > b)
            result = 2'b10;
        else if (a < b)
            result = 2'b01;
        else
            result = 2'b00;
    end

endmodule

module adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    assign {cout, sum} = a + b + cin;

endmodule

module difference_calculator(
    input [3:0] a,
    input [3:0] b,
    input [1:0] comp_result,
    input [3:0] adder_out,
    input adder_cout,
    output reg [3:0] difference,
    output reg borrow
);

    always @(*) begin
        case (comp_result)
            2'b10: begin // a > b
                difference = a - b;
                borrow = 1'b0;
            end
            2'b01: begin // a < b
                difference = b - a;
                borrow = 1'b1;
            end
            2'b00: begin // a == b
                difference = 4'b0000;
                borrow = 1'b0;
            end
            default: begin
                difference = 4'bxxxx;
                borrow = 1'bx;
            end
        endcase
    end

endmodule