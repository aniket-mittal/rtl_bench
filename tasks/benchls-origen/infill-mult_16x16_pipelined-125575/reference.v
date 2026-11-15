module origen_125575 (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [15:0] a,
    input wire [15:0] b,
    output reg [31:0] product
);

wire [15:0] partial_product_low, partial_product_high;
wire [15:0] sum_low, sum_high;
wire carry;

// Partial products
assign partial_product_low = a[7:0] * b[7:0];
assign partial_product_high = a[15:8] * b[15:8];

// Instantiate adder modules
add16 adder_low (
    .a(partial_product_low),
    .b({8'b0, (a[15:8] * b[7:0])}),
    .cin(1'b0),
    .sum(sum_low),
    .cout(carry)
);

add16 adder_high (
    .a(partial_product_high),
    .b({(a[7:0] * b[15:8]), 8'b0}),
    .cin(carry),
    .sum(sum_high),
    .cout()
);

// Control logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        product <= 32'b0;
    end else if (enable) begin
        product <= {sum_high, sum_low};
    end
end

endmodule

// Adder module (given)
module add16 (
    input wire [15:0] a,
    input wire [15:0] b,
    input wire cin,
    output wire [15:0] sum,
    output wire cout
);

assign {cout, sum} = a + b + cin;

endmodule