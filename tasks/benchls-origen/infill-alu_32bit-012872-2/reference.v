module origen_012872(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
);

    reg [32:0] temp;
    wire [31:0] sum, diff;
    wire cout, bout;

    assign {cout, sum} = a + b;
    assign {bout, diff} = a - b;

    always @(*) begin
        case(aluc)
            4'b0000, 4'b0010: r = sum;
            4'b0001, 4'b0011: r = diff;
            4'b0100: r = a & b;
            4'b0101: r = a | b;
            4'b0110: r = a ^ b;
            4'b0111: r = ~(a | b);
            4'b1000, 4'b1001: r = {b[15:0], 16'b0};
            4'b1010: r = {31'b0, (a < b)};
            4'b1011: r = {31'b0, ($signed(a) < $signed(b))};
            4'b1100: r = $signed(a) >>> b[4:0];
            4'b1101: r = a >> b[4:0];
            4'b1110, 4'b1111: r = a << b[4:0];
            default: r = 32'b0;
        endcase

        zero = (r == 32'b0);
        
        case(aluc)
            4'b0000, 4'b0010: carry = cout;
            4'b0001, 4'b0011: carry = ~bout;
            4'b1100, 4'b1101: carry = (b[4:0] != 0) ? a[b[4:0] - 1] : 1'b0;
            4'b1110, 4'b1111: carry = (b[4:0] != 0) ? a[32 - b[4:0]] : 1'b0;
            default: carry = 1'b0;
        endcase

        case(aluc)
            4'b0000, 4'b0010: overflow = (a[31] == b[31]) && (a[31] != r[31]);
            4'b0001, 4'b0011: overflow = (a[31] != b[31]) && (a[31] != r[31]);
            default: overflow = 1'b0;
        endcase

        case(aluc)
            4'b1011: negative = r[0];
            default: negative = r[31];
        endcase
    end

endmodule