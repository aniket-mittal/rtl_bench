module origen_173543 (
    input clk,
    input Unsigned,
    input mult_begin,
    input [31:0] mult_op1,
    input [31:0] mult_op2,
    output [63:0] product,
    output mult_end
);

reg mult_valid;
reg [31:0] op1_absolute, op2_absolute;
reg [31:0] multiplicand, multiplier;
reg [5:0] next_zt, next_zf, next_ze, next_zfi;
reg product_sign;
reg [63:0] product_temp;
wire [63:0] partial_product;

[MASKED]

assign partial_product = ({32'b0, op1_absolute} * {32'b0, op2_absolute});
assign product = (product_sign) ? -product_temp : product_temp;
assign mult_end = ~mult_valid;

endmodule