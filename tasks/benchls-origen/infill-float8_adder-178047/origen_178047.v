module origen_178047(
    input [7:0] f1,
    input [7:0] f2,
    output reg [7:0] fout,
    output reg overflow,
    output reg underflow
);

    wire [2:0] f1_exp, f2_exp;
    wire [4:0] f1_frac, f2_frac;
    wire f1_sign, f2_sign;
    reg [7:0] shf_sum;
    reg sign;
    reg [2:0] shf_exp;
    reg [4:0] shf_frac;

    assign f1_exp = f1[7:5];
    assign f1_frac = {1'b1, f1[4:0]};
    assign f1_sign = f1[7];

    assign f2_exp = f2[7:5];
    assign f2_frac = {1'b1, f2[4:0]};
    assign f2_sign = f2[7];

    [MASKED]

endmodule