module origen_030486 #(
    parameter WIDTH = 32,
    parameter CUT_WIDTH = 4
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [WIDTH-1:0] o,
    output c
);

    localparam LEVEL = ceil(WIDTH, CUT_WIDTH);
    localparam LAST_WIDTH = WIDTH - (LEVEL-1)*CUT_WIDTH;

    wire [LEVEL:0] carry;
    wire [WIDTH-1:0] sum;

    assign carry[0] = 1'b0;
    assign c = carry[LEVEL];
    assign o = sum;

    // First stage (Ripple Carry Adder)
    ripple_carry_adder #(.WIDTH(CUT_WIDTH)) rca (
        .a(a[CUT_WIDTH-1:0]),
        .b(b[CUT_WIDTH-1:0]),
        .cin(carry[0]),
        .sum(sum[CUT_WIDTH-1:0]),
        .cout(carry[1])
    );

    // Middle stages
    genvar i;
    generate
        for (i = 1; i < LEVEL-1; i = i + 1) begin : csa_stage
            carry_select_adder_node #(.WIDTH(CUT_WIDTH)) csa_node (
                .a(a[CUT_WIDTH*(i+1)-1:CUT_WIDTH*i]),
                .b(b[CUT_WIDTH*(i+1)-1:CUT_WIDTH*i]),
                .s(carry[i]),
                .o(sum[CUT_WIDTH*(i+1)-1:CUT_WIDTH*i]),
                .c(carry[i+1])
            );
        end
    endgenerate

    // Last stage
    carry_select_adder_node #(.WIDTH(LAST_WIDTH)) csa_last (
        .a(a[WIDTH-1:WIDTH-LAST_WIDTH]),
        .b(b[WIDTH-1:WIDTH-LAST_WIDTH]),
        .s(carry[LEVEL-1]),
        .o(sum[WIDTH-1:WIDTH-LAST_WIDTH]),
        .c(carry[LEVEL])
    );

    function integer ceil;
        input integer x, y;
        begin
            ceil = (x + y - 1) / y;
        end
    endfunction

endmodule

module carry_select_adder_node #(
    parameter WIDTH = 4
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input s,
    output [WIDTH-1:0] o,
    output c
);

    wire [WIDTH-1:0] sum0, sum1;
    wire c0, c1;

    ripple_carry_adder #(.WIDTH(WIDTH)) rca0 (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum0),
        .cout(c0)
    );

    ripple_carry_adder #(.WIDTH(WIDTH)) rca1 (
        .a(a),
        .b(b),
        .cin(1'b1),
        .sum(sum1),
        .cout(c1)
    );

    assign o = s ? sum1 : sum0;
    assign c = s ? c1 : c0;

endmodule

module ripple_carry_adder #(
    parameter WIDTH = 4
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input cin,
    output [WIDTH-1:0] sum,
    output cout
);

    wire [WIDTH:0] carry;
    assign carry[0] = cin;
    assign cout = carry[WIDTH];

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : full_adder_inst
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

endmodule

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule