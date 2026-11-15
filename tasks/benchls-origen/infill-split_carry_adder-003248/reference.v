module origen_003248 #(
    parameter LS_WIDTH = 10,
    parameter MS_WIDTH = 10,
    parameter WIDTH = LS_WIDTH + MS_WIDTH
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [WIDTH-1:0] o
);

    wire [LS_WIDTH:0] ls_sum;
    wire [MS_WIDTH:0] ms_sum;
    wire cross_carry;

    assign ls_sum = a[LS_WIDTH-1:0] + b[LS_WIDTH-1:0];
    assign cross_carry = ls_sum[LS_WIDTH];
    assign ms_sum = a[WIDTH-1:LS_WIDTH] + b[WIDTH-1:LS_WIDTH] + cross_carry;

    assign o = {ms_sum[MS_WIDTH-1:0], ls_sum[LS_WIDTH-1:0]};

endmodule

