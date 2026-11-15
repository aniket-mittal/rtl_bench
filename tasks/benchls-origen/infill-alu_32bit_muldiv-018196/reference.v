module origen_018196 (
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_op,
    output reg [31:0] result,
    output reg [31:0] hi,
    output reg [31:0] lo
);

    parameter zero = 32'h00000000;
    parameter um = 32'h00000001;

    reg [63:0] temp;
    reg signed [31:0] signed_a, signed_b;

    always @(*) begin
        signed_a = a;
        signed_b = b;
        result = zero;
        hi = zero;
        lo = zero;

        case (alu_op)
            4'b0000: result = a | b;
            4'b0001: result = a ^ b;
            4'b0010: result = a & b;
            4'b0011: result = ~(a & b);
            4'b0100: result = a + b;
            4'b0101: result = a - b;
            4'b0110: result = ~a;
            4'b0111: result = a << b[4:0];
            4'b1000: result = a >> b[4:0];
            4'b1001: begin
                for (int i = 0; i < 32; i = i + 1)
                    result[i] = a[31-i];
            end
            4'b1010: result = (a == b) ? um : zero;
            4'b1011: result = (a[31] ? -a : a) == (b[31] ? -b : b) ? um : zero;
            4'b1100: result = (signed_a < signed_b) ? um : zero;
            4'b1101: begin
                temp = signed_a * signed_b;
                hi = temp[63:32];
                lo = temp[31:0];
            end
            4'b1110: begin
                lo = signed_a / signed_b;
                hi = signed_a % signed_b;
            end
            default: result = zero;
        endcase
    end

endmodule