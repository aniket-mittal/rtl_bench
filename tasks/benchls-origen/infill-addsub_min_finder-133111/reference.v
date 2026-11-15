module origen_133111(
    input [31:0] a,
    input [31:0] b,
    input sub,
    input [7:0] num1,
    input [7:0] num2,
    input [7:0] num3,
    input [7:0] num4,
    output [31:0] addsub_result,
    output [7:0] min_value,
    output [31:0] final_sum
);

wire [31:0] xor_out;
wire carry_in;
wire [15:0] sum_low, sum_high;

// 32-bit wide XOR gate
assign xor_out = b ^ {32{sub}};

// 2's complement module
twos_complement twos_comp (
    .in(sub),
    .out(carry_in)
);

// 16-bit adder for lower bits
adder_16bit adder_low (
    .a(a[15:0]),
    .b(xor_out[15:0]),
    .cin(carry_in),
    .sum(sum_low),
    .cout()
);

// 16-bit adder for higher bits
adder_16bit adder_high (
    .a(a[31:16]),
    .b(xor_out[31:16]),
    .cin(sum_low[15]),
    .sum(sum_high),
    .cout()
);

// Combine results of both 16-bit adders
assign addsub_result = {sum_high, sum_low};

// Priority encoder to find minimum value
priority_encoder pri_enc (
    .num1(num1),
    .num2(num2),
    .num3(num3),
    .num4(num4),
    .min_value(min_value)
);

// Additional functional module to sum the outputs
adder_32bit final_adder (
    .a({24'b0, min_value}),
    .b(addsub_result),
    .cin(1'b0),
    .sum(final_sum),
    .cout()
);

endmodule

module twos_complement(
    input in,
    output out
);
    assign out = in;
endmodule

module adder_16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module adder_32bit(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

module priority_encoder(
    input [7:0] num1,
    input [7:0] num2,
    input [7:0] num3,
    input [7:0] num4,
    output reg [7:0] min_value
);
    always @(*) begin
        if (num1 <= num2 && num1 <= num3 && num1 <= num4)
            min_value = num1;
        else if (num2 <= num1 && num2 <= num3 && num2 <= num4)
            min_value = num2;
        else if (num3 <= num1 && num3 <= num2 && num3 <= num4)
            min_value = num3;
        else
            min_value = num4;
    end
endmodule