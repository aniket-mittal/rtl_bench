module origen_151636(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
);

    always @(*) begin
        casex (aluc)
            4'b0000: begin // Addition of a and b (without carry flag update)
                r = a + b;
                zero = (r == 32'b0);
                negative = r[31];
                overflow = (~a[31] & ~b[31] & r[31]) | (a[31] & b[31] & ~r[31]);
            end
            4'b0010: begin // Addition of a and b (with overflow flag update)
                r = a + b;
                zero = (r == 32'b0);
                carry = (a[31] & b[31]) | (a[31] & ~r[31]) | (b[31] & ~r[31]);
                negative = r[31];
                overflow = (~a[31] & ~b[31] & r[31]) | (a[31] & b[31] & ~r[31]);
            end
            4'b0001: begin // Subtraction of b from a (with carry flag update)
                r = a - b;
                zero = (r == 32'b0);
                carry = (~a[31] & b[31]) | (a[31] & ~r[31]);
                negative = r[31];
                overflow = (a[31] & ~b[31] & ~r[31]) | (~a[31] & b[31] & r[31]);
            end
            4'b0011: begin // Subtraction of b from a (with overflow flag update)
                r = a - b;
                zero = (r == 32'b0);
                carry = (~a[31] & b[31]) | (a[31] & ~r[31]);
                negative = r[31];
                overflow = (a[31] & ~b[31] & ~r[31]) | (~a[31] & b[31] & r[31]);
            end
            4'b0100: begin // Bitwise AND of a and b
                r = a & b;
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b0101: begin // Bitwise OR of a and b
                r = a | b;
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b0110: begin // Bitwise XOR of a and b
                r = a ^ b;
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b0111: begin // Bitwise NOR of a and b
                r = ~(a | b);
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b1000: begin // Shift b left by 16 bits (with zero extension)
                r = {b[15:0], 16'b0};
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b1011: begin // Subtraction of b from a (with zero and negative flag update)
                r = a - b;
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b1010: begin // Subtraction of b from a (with carry flag update)
                r = a - b;
                zero = (r == 32'b0);
                carry = (~a[31] & b[31]) | (a[31] & ~r[31]);
                negative = r[31];
            end
            4'b1100: begin // Shift b left or right by a bits (with carry flag update)
                r = (a[4] ? b >> a[3:0] : b << a[3:0]);
                carry = (a[4] ? b[a[3:0]-1] : b[31-a[3:0]]);
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b1110: begin // Shift b left by a bits (with carry flag update)
                r = b << a[3:0];
                carry = b[31-a[3:0]];
                zero = (r == 32'b0);
                negative = r[31];
            end
            4'b1101: begin // Shift b right by a bits (with carry flag update)
                r = b >> a[3:0];
                carry = b[a[3:0]-1];
                zero = (r == 32'b0);
                negative = r[31];
            end
            default: begin
                r = 32'b0;
                zero = 1'b0;
                carry = 1'b0;
                negative = 1'b0;
                overflow = 1'b0;
            end
        endcase
    end

endmodule