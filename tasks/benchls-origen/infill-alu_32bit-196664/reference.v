module origen_196664(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output [31:0] r,
    output zero,
    output carry,
    output negative,
    output overflow
);

reg [31:0] result;
reg carry_out, is_zero, is_negative, is_overflow;

always @(*) begin
    case (aluc)
        4'b0000: begin // Addu
            {carry_out, result} = a + b;
            is_overflow = 1'b0;
        end
        4'b0001: begin // Add
            {carry_out, result} = a + b;
            is_overflow = (a[31] == b[31]) && (a[31] != result[31]);
        end
        4'b0010: begin // Subu
            {carry_out, result} = a - b;
            is_overflow = 1'b0;
        end
        4'b0011: begin // Sub
            {carry_out, result} = a - b;
            is_overflow = (a[31] != b[31]) && (a[31] != result[31]);
        end
        4'b0100: begin // And
            result = a & b;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b0101: begin // Or
            result = a | b;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b0110: begin // Xor
            result = a ^ b;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b0111: begin // Nor
            result = ~(a | b);
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1000: begin // Lui
            result = {b[15:0], 16'b0};
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1001: begin // Bgez
            result = a;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1010: begin // Slt
            result = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1011: begin // Sltu
            result = (a < b) ? 32'b1 : 32'b0;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1100: begin // Sra
            result = $signed(b) >>> (a - 1);
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1101: begin // Srl
            result = b >> (a - 1);
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1110: begin // Sll
            result = b << a;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        4'b1111: begin // Slr
            result = b << a;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
        default: begin
            result = 32'b0;
            carry_out = 1'b0;
            is_overflow = 1'b0;
        end
    endcase

    is_zero = (result == 32'b0);
    is_negative = result[31];
end

assign r = result;
assign zero = is_zero;
assign carry = carry_out;
assign negative = is_negative;
assign overflow = is_overflow;

endmodule