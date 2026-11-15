module origen_124812 (
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] result
);

    // Extract sign, exponent, and mantissa
    wire sign_a = a[31];
    wire sign_b = b[31];
    wire [7:0] exp_a = a[30:23];
    wire [7:0] exp_b = b[30:23];
    wire [22:0] mant_a = a[22:0];
    wire [22:0] mant_b = b[22:0];

    // Intermediate signals
    reg sign_result;
    reg [8:0] exp_result;
    reg [47:0] mant_result;
    reg [22:0] mant_final;
    reg [7:0] exp_final;

    always @(*) begin
        // Calculate sign
        sign_result = sign_a ^ sign_b;

        // Calculate exponent
        exp_result = exp_a + exp_b - 8'd127;

        // Calculate mantissa
        mant_result = {1'b1, mant_a} * {1'b1, mant_b};

        // Normalize result
        if (mant_result[47] == 1'b1) begin
            mant_final = mant_result[46:24];
            exp_final = exp_result[7:0] + 8'd1;
        end else begin
            mant_final = mant_result[45:23];
            exp_final = exp_result[7:0];
        end

        // Check for special cases (infinity, NaN, zero)
        if ((exp_a == 8'hFF && mant_a != 0) || (exp_b == 8'hFF && mant_b != 0)) begin
            // NaN
            result = {1'b1, {8{1'b1}}, 1'b1, {22{1'b0}}};
        end else if (exp_a == 8'hFF || exp_b == 8'hFF) begin
            // Infinity
            result = {sign_result, {8{1'b1}}, {23{1'b0}}};
        end else if (exp_a == 0 || exp_b == 0) begin
            // Zero
            result = {sign_result, {31{1'b0}}};
        end else begin
            // Normal case
            result = {sign_result, exp_final, mant_final};
        end
    end

endmodule