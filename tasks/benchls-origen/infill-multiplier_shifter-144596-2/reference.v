module origen_144596(
    input [3:0] A,
    input [3:0] B,
    input [1:0] shift,
    output [7:0] OUT
);

    wire [7:0] product;

    // 4-bit binary multiplier
    multiplier mult (
        .A(A),
        .B(B),
        .product(product)
    );

    // 4-bit barrel shifter
    barrel_shifter shifter (
        .in(product),
        .shift(shift),
        .out(OUT)
    );

endmodule

module multiplier(
    input [3:0] A,
    input [3:0] B,
    output reg [7:0] product
);
    integer i;
    reg [7:0] temp_product;

    always @(*) begin
        temp_product = 8'b0;
        for (i = 0; i < 4; i = i + 1) begin
            if (B[i])
                temp_product = temp_product + (A << i);
        end
        product = temp_product;
    end
endmodule

module barrel_shifter(
    input [7:0] in,
    input [1:0] shift,
    output reg [7:0] out
);
    always @(*) begin
        case(shift)
            2'b00: out = in;                 // No shift
            2'b01: out = {in[6:0], in[7]};   // Rotate left by 1
            2'b10: out = {in[5:0], in[7:6]}; // Rotate left by 2
            2'b11: out = {in[0], in[7:1]};   // Rotate right by 1
        endcase
    end
endmodule