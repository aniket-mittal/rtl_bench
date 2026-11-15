module origen_084647 #(parameter fbw = 63) (
    input [fbw:0] a,
    input [fbw:0] b,
    output reg [fbw:0] delta_1,
    output reg [fbw:0] delta_2
);

    reg [51:0] mantissa_a, mantissa_b;
    reg [10:0] exponent_a, exponent_b;
    reg sign_a, sign_b;
    reg [5:0] leading_zeros_a, leading_zeros_b;

    always @(*) begin
        // Extract components
        {sign_a, exponent_a, mantissa_a} = a;
        {sign_b, exponent_b, mantissa_b} = b;

        // Normalize a
        if (a == 0) begin
            delta_1 = 0;
        end else begin
            // Leading zero detection for a
            if (mantissa_a[51:20] == 0) begin
                leading_zeros_a = 32;
                mantissa_a = mantissa_a << 32;
            end else begin
                leading_zeros_a = 0;
            end
            if (mantissa_a[51:36] == 0) begin
                leading_zeros_a = leading_zeros_a + 16;
                mantissa_a = mantissa_a << 16;
            end
            if (mantissa_a[51:44] == 0) begin
                leading_zeros_a = leading_zeros_a + 8;
                mantissa_a = mantissa_a << 8;
            end
            if (mantissa_a[51:48] == 0) begin
                leading_zeros_a = leading_zeros_a + 4;
                mantissa_a = mantissa_a << 4;
            end
            if (mantissa_a[51:50] == 0) begin
                leading_zeros_a = leading_zeros_a + 2;
                mantissa_a = mantissa_a << 2;
            end
            if (mantissa_a[51] == 0) begin
                leading_zeros_a = leading_zeros_a + 1;
                mantissa_a = mantissa_a << 1;
            end

            // Adjust exponent for a
            exponent_a = exponent_a - leading_zeros_a + 1023;

            // Construct normalized a
            delta_1 = {sign_a, exponent_a, mantissa_a[51:0]};
        end

        // Normalize b
        if (b == 0) begin
            delta_2 = 0;
        end else begin
            // Leading zero detection for b
            if (mantissa_b[51:20] == 0) begin
                leading_zeros_b = 32;
                mantissa_b = mantissa_b << 32;
            end else begin
                leading_zeros_b = 0;
            end
            if (mantissa_b[51:36] == 0) begin
                leading_zeros_b = leading_zeros_b + 16;
                mantissa_b = mantissa_b << 16;
            end
            if (mantissa_b[51:44] == 0) begin
                leading_zeros_b = leading_zeros_b + 8;
                mantissa_b = mantissa_b << 8;
            end
            if (mantissa_b[51:48] == 0) begin
                leading_zeros_b = leading_zeros_b + 4;
                mantissa_b = mantissa_b << 4;
            end
            if (mantissa_b[51:50] == 0) begin
                leading_zeros_b = leading_zeros_b + 2;
                mantissa_b = mantissa_b << 2;
            end
            if (mantissa_b[51] == 0) begin
                leading_zeros_b = leading_zeros_b + 1;
                mantissa_b = mantissa_b << 1;
            end

            // Adjust exponent for b
            exponent_b = exponent_b - leading_zeros_b + 1023;

            // Construct normalized b
            delta_2 = {sign_b, exponent_b, mantissa_b[51:0]};
        end
    end

endmodule