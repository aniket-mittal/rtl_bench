module origen_104621 #(
    parameter EXP_L = 8,
    parameter MNT_L = 23
)(
    input [(EXP_L+MNT_L):0] in1, in2,
    output reg [(EXP_L+MNT_L):0] out
);

    localparam BIAS = (1 << (EXP_L - 1)) - 1;

    reg [EXP_L-1:0] expX, expY, expSum, expPostNorm, expPostNorm_fin;
    reg [MNT_L:0] sigX, sigY;
    reg [(2*MNT_L)+1:0] sigProd;
    reg [(2*MNT_L)+1:0] sigProdExt;
    reg norm;
    reg sticky;
    reg [(EXP_L+MNT_L):0] expSigPostRound;

    always @(*) begin
        // Extract exponents and mantissas
        expX = in1[EXP_L+MNT_L-1:MNT_L];
        expY = in2[EXP_L+MNT_L-1:MNT_L];
        sigX = {1'b1, in1[MNT_L-1:0]};
        sigY = {1'b1, in2[MNT_L-1:0]};

        // Mantissa multiplication
        sigProd = sigX * sigY;

        // Exponent addition and bias adjustment
        expSum = expX + expY - BIAS;
        norm = sigProd[(2*MNT_L)+1];
        expPostNorm = expSum + norm;

        // Normalization
        sigProdExt = norm ? sigProd : (sigProd << 1);

        // Special case handling
        if ((expX == 0) || (expY == 0)) begin
            expPostNorm_fin = 0;
            sigProdExt = 0;
        end else if (expPostNorm >= ((1 << EXP_L) - 1)) begin
            expPostNorm_fin = ((1 << EXP_L) - 1);
            sigProdExt = 0;
        end else begin
            expPostNorm_fin = expPostNorm;
        end

        // Rounding
        sticky = |sigProdExt[MNT_L-1:0];
        if (sigProdExt[MNT_L+1] && (sigProdExt[MNT_L] | sticky)) begin
            expSigPostRound = {expPostNorm_fin, sigProdExt[(2*MNT_L)+1:MNT_L+2]} + 1;
        end else begin
            expSigPostRound = {expPostNorm_fin, sigProdExt[(2*MNT_L)+1:MNT_L+2]};
        end

        // Final output formation
        out = {in1[EXP_L+MNT_L] ^ in2[EXP_L+MNT_L], expSigPostRound[EXP_L+MNT_L-1:0]};
    end

endmodule