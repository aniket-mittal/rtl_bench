module origen_034547 (
    input [31:0] In_A,
    input [31:0] In_B,
    input valid_in,
    output reg [31:0] Out,
    output reg valid_out
);

    reg sign;
    reg [7:0] exponent;
    reg [22:0] fraction;
    reg [47:0] dividend, divisor;
    reg [47:0] quotient;

    always @(*) begin
        if (valid_in) begin
            // Special cases
            if (In_A[30:0] == 0 && In_B[30:0] == 0) begin
                Out = 32'bz;
            end else if (In_A[30:0] == 0) begin
                Out = 32'b0;
            end else if (In_B[30:0] == 0) begin
                Out = 32'bz;
            end else begin
                // Normal case
                // Calculate sign
                sign = In_A[31] ^ In_B[31];

                // Calculate exponent
                exponent = In_A[30:23] - In_B[30:23] + 8'd127;

                // Prepare fraction parts for division
                dividend = {1'b1, In_A[22:0], 24'b0};
                divisor = {24'b0, 1'b1, In_B[22:0]};

                // Perform division
                quotient = dividend / divisor;

                // Normalize result
                if (quotient[23]) begin
                    fraction = quotient[22:0];
                    exponent = exponent - 1;
                end else begin
                    fraction = quotient[23:1];
                end

                // Assemble final result
                Out = {sign, exponent, fraction};
            end
            valid_out = 1'b1;
        end else begin
            Out = 32'b0;
            valid_out = 1'b0;
        end
    end

endmodule