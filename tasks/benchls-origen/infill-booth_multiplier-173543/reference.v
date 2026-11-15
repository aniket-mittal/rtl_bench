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

always @(posedge clk) begin
    if (mult_begin) begin
        mult_valid <= 1'b1;
        if (Unsigned) begin
            op1_absolute <= mult_op1;
            op2_absolute <= mult_op2;
        end else begin
            op1_absolute <= (mult_op1[31]) ? -mult_op1 : mult_op1;
            op2_absolute <= (mult_op2[31]) ? -mult_op2 : mult_op2;
        end
        multiplicand <= op1_absolute;
        multiplier <= op2_absolute;
        product_sign <= (Unsigned) ? 1'b0 : (mult_op1[31] ^ mult_op2[31]);
        product_temp <= 64'b0;
    end else if (mult_valid) begin
        if (|multiplier) begin
            next_zt <= (multiplicand[31]) ? 6'd0 : (31 - |{1'b0, multiplicand[30:0]}); // leading zeros in multiplicand
            next_zf <= (multiplier[31]) ? 6'd0 : (31 - |{1'b0, multiplier[30:0]}); // leading zeros in multiplier
            next_ze <= (next_zt > next_zf) ? next_zf : next_zt; // minimum of leading zeros
            next_zfi <= (next_ze == 6'd0) ? 6'd0 : (next_ze - 1); // index of non-zero bit
            multiplicand <= {multiplicand[31:0], 1'b0}; // shift left
            multiplier <= {1'b0, multiplier[31:1]}; // shift right
            product_temp <= product_temp + ({32'b0, multiplicand} >> next_zfi); // add partial product
        end else begin
            mult_valid <= 1'b0;
        end
    end
end

assign partial_product = ({32'b0, op1_absolute} * {32'b0, op2_absolute});
assign product = (product_sign) ? -product_temp : product_temp;
assign mult_end = ~mult_valid;

endmodule