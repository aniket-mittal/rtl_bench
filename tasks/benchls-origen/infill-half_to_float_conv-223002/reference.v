module origen_223002(
    input [14:0] control,
    input [15:0] in,
    input [2:0] roundingMode,
    input reset,
    output reg [31:0] out,
    output reg [2:0] exceptionFlags
);

wire [4:0] exp;
wire [9:0] frac;
wire sign;

// Extract the sign, exponent, and fraction from the input
assign sign = in[15];
assign exp = in[14:10];
assign frac = in[9:0];

reg [31:0] result;
reg [4:0] e;
reg [22:0] f;
reg [31:0] int_val;

always @(*) begin
    if (reset) begin
        out = 0;
        exceptionFlags = 0;
    end else begin
        // Handle special cases
        if (exp == 0 && frac == 0) begin
            // Zero
            out = 0;
            exceptionFlags = 0;
        end else if (exp == 31 && frac != 0) begin
            // NaN
            out = 0;
            exceptionFlags = 3'b001;
        end else if (exp == 31 && frac == 0) begin
            // Infinity
            out = sign ? 32'h80000000 : 32'h7FFFFFFF;
            exceptionFlags = 3'b010;
        end else begin
            // Normalize the input
            if (exp == 0) begin
                // Denormalized number
                e = 1 - 15;
                f = {1'b0, frac};
            end else begin
                e = exp - 15;
                f = {1'b1, frac};
            end

            // Perform rounding
            int_val = sign ? -{e[4:0], f} : {e[4:0], f};
            case (roundingMode)
                3'b000: // Round to nearest even
                    if (int_val[0] == 1'b1 && (int_val[1] == 1'b0 || (int_val[22:1] == 0 && int_val[0] == 1'b1))) begin
                        int_val = int_val + 1;
                        exceptionFlags[2] = 1'b1;
                    end
                3'b001: // Round towards zero
                    ; // No action needed
                3'b010: // Round towards positive infinity
                    if (sign == 1'b0 && int_val[31:0] != 0) begin
                        int_val = int_val + 1;
                        exceptionFlags[2] = 1'b1;
                    end
                3'b011: // Round towards negative infinity
                    if (sign == 1'b1 && int_val[31:0] != 0) begin
                        int_val = int_val - 1;
                        exceptionFlags[2] = 1'b1;
                    end
                3'b100: // Round towards positive infinity if sign is 0, negative infinity otherwise
                    if ((sign == 1'b0 && int_val[31:0] != 0) || (sign == 1'b1 && int_val[31:0] != 0)) begin
                        int_val = int_val + 1;
                        exceptionFlags[2] = 1'b1;
                    end
                3'b101: // Round towards negative infinity if sign is 0, positive infinity otherwise
                    if ((sign == 1'b1 && int_val[31:0] != 0) || (sign == 1'b0 && int_val[31:0] != 0)) begin
                        int_val = int_val - 1;
                        exceptionFlags[2] = 1'b1;
                    end
                3'b110: // Round towards positive infinity if the number is positive, negative infinity otherwise
                    if (sign == 1'b0 && int_val[31:0] != 0) begin
                        int_val = int_val + 1;
                        exceptionFlags[2] = 1'b1;
                    end
                3'b111: // Round towards negative infinity if the number is positive, positive infinity otherwise
                    if (sign == 1'b1 && int_val[31:0] != 0) begin
                        int_val = int_val - 1;
                        exceptionFlags[2] = 1'b1;
                    end
            endcase

            // Check for overflow and underflow
            if (int_val > 32'h7FFFFFFF) begin
                out = sign ? 32'h80000000 : 32'h7FFFFFFF;
                exceptionFlags[1] = 1'b1;
            end else if (int_val < 32'h80000000) begin
                out = sign ? 32'h80000000 : 32'h7FFFFFFF;
                exceptionFlags[1] = 1'b1;
            end else begin
                out = int_val;
            end
        end
    end
end

endmodule