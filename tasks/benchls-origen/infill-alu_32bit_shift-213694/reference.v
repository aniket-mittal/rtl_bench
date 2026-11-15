module origen_213694(
    input [31:0] in_A,
    input [31:0] in_B,
    input [2:0] mode,
    input enable,
    input carry_in,
    output reg carry_out,
    output reg [31:0] out,
    output reg zero_flag
);

always @(*) begin
    if (enable) begin
        case (mode)
            3'b000: begin // Bitwise AND
                out = in_A & in_B;
                carry_out = carry_in;
            end
            3'b001: begin // Bitwise OR
                out = in_A | in_B;
                carry_out = carry_in;
            end
            3'b010: begin // Bitwise XOR
                out = in_A ^ in_B;
                carry_out = carry_in;
            end
            3'b011: begin // Left shift
                out = {in_A[30:0], carry_in};
                carry_out = in_A[31];
            end
            3'b100: begin // Right shift
                out = {carry_in, in_A[31:1]};
                carry_out = in_A[0];
            end
            3'b101: begin // Bitwise NOT
                out = ~in_A;
                carry_out = carry_in;
            end
            3'b110: begin // Subtraction
                out = in_A - in_B;
                carry_out = ~(in_A[31] ^ in_B[31]) & (in_A[31] ^ out[31]);
            end
            3'b111: begin // Addition
                out = in_A + in_B;
                carry_out = (in_A[31] & in_B[31]) | (in_A[31] & ~out[31]) | (in_B[31] & ~out[31]);
            end
        endcase

        zero_flag = (out == 32'b0);
    end
end

endmodule