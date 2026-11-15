module origen_146828(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result,
    output cout
);

    wire [31:0] b_xor;
    wire [31:0] sum_stage1, sum_stage2;
    wire [31:0] carry_stage1, carry_stage2;
    wire [7:0] cout_stage1;

    // XOR gate to invert b when sub is 1
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : xor_gen
            assign b_xor[i] = b[i] ^ sub;
        end
    endgenerate

    // First stage: 8 4-bit ripple carry adders
    genvar j;
    generate
        for (j = 0; j < 8; j = j + 1) begin : rca_gen
            ripple_carry_adder_4bit rca (
                .a(a[j*4+3:j*4]),
                .b(b_xor[j*4+3:j*4]),
                .cin(j == 0 ? sub : cout_stage1[j-1]),
                .sum(sum_stage1[j*4+3:j*4]),
                .cout(cout_stage1[j])
            );
        end
    endgenerate

    // Second stage: Carry save adder
    carry_save_adder_32bit csa (
        .a(sum_stage1),
        .b({cout_stage1, 24'b0}),
        .cin(32'b0),
        .sum(sum_stage2),
        .carry(carry_stage2)
    );

    // Final stage: 32-bit ripple carry adder
    ripple_carry_adder_32bit final_rca (
        .a(sum_stage2),
        .b(carry_stage2),
        .cin(1'b0),
        .sum(result),
        .cout(cout)
    );

endmodule

module ripple_carry_adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [4:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : fa_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[4];

endmodule

module carry_save_adder_32bit(
    input [31:0] a,
    input [31:0] b,
    input [31:0] cin,
    output [31:0] sum,
    output [31:0] carry
);

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : fa_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(cin[i]),
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate

endmodule

module ripple_carry_adder_32bit(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

    wire [32:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : fa_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[32];

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule