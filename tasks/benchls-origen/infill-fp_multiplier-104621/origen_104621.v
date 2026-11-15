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

    [MASKED]

endmodule