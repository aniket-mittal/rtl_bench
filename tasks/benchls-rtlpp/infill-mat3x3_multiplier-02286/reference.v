module rtlpp_02286 (
    A11, A12, A13,
    A21, A22, A23,
    A31, A32, A33,

    B11, B12, B13,
    B21, B22, B23,
    B31, B32, B33,

    Y11, Y12, Y13,
    Y21, Y22, Y23,
    Y31, Y32, Y33
);

    input wire signed [15:0] A11;
    input wire signed [15:0] A12;
    input wire signed [15:0] A13;
    input wire signed [15:0] A21;
    input wire signed [15:0] A22;
    input wire signed [15:0] A23;
    input wire signed [15:0] A31;
    input wire signed [15:0] A32;
    input wire signed [15:0] A33;

    input wire signed [15:0] B11;
    input wire signed [15:0] B12;
    input wire signed [15:0] B13;
    input wire signed [15:0] B21;
    input wire signed [15:0] B22;
    input wire signed [15:0] B23;
    input wire signed [15:0] B31;
    input wire signed [15:0] B32;
    input wire signed [15:0] B33;

    output wire signed [15:0] Y11;
    output wire signed [15:0] Y12;
    output wire signed [15:0] Y13;
    output wire signed [15:0] Y21;
    output wire signed [15:0] Y22;
    output wire signed [15:0] Y23;
    output wire signed [15:0] Y31;
    output wire signed [15:0] Y32;
    output wire signed [15:0] Y33;

    assign Y11 = (A11 * B11) + (A12 * B21) + (A13 * B31);
    assign Y12 = (A11 * B12) + (A12 * B22) + (A13 * B32);
    assign Y13 = (A11 * B13) + (A12 * B23) + (A13 * B33);
    assign Y21 = (A21 * B11) + (A22 * B21) + (A23 * B31);
    assign Y22 = (A21 * B12) + (A22 * B22) + (A23 * B32);
    assign Y23 = (A21 * B13) + (A22 * B23) + (A23 * B33);
    assign Y31 = (A31 * B11) + (A32 * B21) + (A33 * B31);
    assign Y32 = (A31 * B12) + (A32 * B22) + (A33 * B32);
    assign Y33 = (A31 * B13) + (A32 * B23) + (A33 * B33);

endmodule