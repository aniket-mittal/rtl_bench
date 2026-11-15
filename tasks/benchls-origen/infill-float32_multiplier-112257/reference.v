module origen_112257 (
    input wire [31:0] X,
    input wire [31:0] Y,
    output reg [31:0] result
);

    wire sign_x, sign_y, sign_out;
    wire [7:0] exp_x, exp_y;
    wire [22:0] frac_x, frac_y;
    wire [23:0] mant_x, mant_y;
    wire [47:0] product;
    wire [24:0] truncated_product;
    reg [7:0] ex_prev, ex_out;
    reg [22:0] frac_out;

    // Extract components
    assign sign_x = X[31];
    assign sign_y = Y[31];
    assign exp_x = X[30:23];
    assign exp_y = Y[30:23];
    assign frac_x = X[22:0];
    assign frac_y = Y[22:0];

    // Sign calculation
    assign sign_out = sign_x ^ sign_y;

    // Mantissa preparation (adding implied '1')
    assign mant_x = {1'b1, frac_x};
    assign mant_y = {1'b1, frac_y};

    // Mantissa multiplication
    assign product = mant_x * mant_y;

    // Extract 25 MSBs of product for normalization
    assign truncated_product = product[47:23];

    // Initial exponent calculation
    always @(*) begin
        ex_prev = exp_x + exp_y - 8'd127;
    end

    // Normalization and exponent adjustment
    always @(*) begin
        if (truncated_product[24]) begin
            ex_out = ex_prev + 8'd1;
            frac_out = truncated_product[23:1];
        end else begin
            ex_out = ex_prev;
            frac_out = truncated_product[22:0];
        end
    end

    // Result composition
    always @(*) begin
        result = {sign_out, ex_out, frac_out};
    end

endmodule