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

    always @(*) begin
        if (f1_exp > f2_exp) begin
            shf_sum = {f1_sign, f1_exp, f1_frac} + {~f2_sign, f2_exp, f2_frac};
        end else if (f1_exp < f2_exp) begin
            shf_sum = {f2_sign, f2_exp, f2_frac} + {~f1_sign, f1_exp, f1_frac};
        end else begin
            shf_sum = {f1_sign, f1_exp, f1_frac} + {f2_sign, f2_exp, f2_frac};
        end

        sign = shf_sum[7];
        shf_exp = shf_sum[7:5];
        shf_frac = shf_sum[4:0];

        if (shf_exp == 0 && shf_frac == 0) begin
            fout = 0;
            overflow = 0;
            underflow = 0;
        end else if (shf_exp > 7) begin
            fout = {sign, 7'b1111111};
            overflow = 1;
            underflow = 0;
        end else if (shf_exp < 0) begin
            fout = {sign, shf_frac[4:0]};
            overflow = 0;
            underflow = 1;
        end else begin
            fout = {sign, shf_exp, shf_frac[4:0]};
            overflow = 0;
            underflow = 0;
        end
    end

endmodule