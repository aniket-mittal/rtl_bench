module origen_167311(
    input [31:0] t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13,
    input [3:0] aluc,
    input [5:0] c,
    input [1:0] o,
    output reg [31:0] r,
    output reg carry,
    output reg overflow
);

    always @(*) begin
        casex (aluc)
            4'b0000: begin
                r = t0;
                carry = c[0];
                overflow = 1'b0;
            end
            4'b0001: begin
                r = t1;
                carry = c[0];
                overflow = o[0];
            end
            4'b0010: begin
                r = t2;
                carry = c[0];
                overflow = o[0];
            end
            4'b0011: begin
                r = t3;
                carry = c[0];
                overflow = c[1];
            end
            4'b0100: begin
                r = t4;
                carry = c[0];
                overflow = c[1];
            end
            4'b0101: begin
                r = t5;
                carry = c[0];
                overflow = c[1];
            end
            4'b0110: begin
                r = t6;
                carry = c[0];
                overflow = c[1];
            end
            4'b0111: begin
                r = t7;
                carry = c[0];
                overflow = c[1];
            end
            4'b1000: begin
                r = t8;
                carry = c[0];
                overflow = c[1];
            end
            4'b1001: begin
                r = t9;
                carry = c[0];
                overflow = c[1];
            end
            4'b1010: begin
                r = t10;
                carry = c[0];
                overflow = c[1];
            end
            4'b1011: begin
                r = t11;
                carry = c[0];
                overflow = c[1];
            end
            4'b1100: begin
                r = t12;
                carry = c[0];
                overflow = c[1];
            end
            4'b1101: begin
                r = t13;
                carry = c[0];
                overflow = c[1];
            end
            default: begin
                r = 32'b0;
                carry = 1'b0;
                overflow = 1'b0;
            end
        endcase
    end

endmodule