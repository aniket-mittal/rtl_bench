module origen_037010(
    input wire CLK,
    input wire RSTn,
    input wire En,
    input wire Tx_Busy_Sig,
    output wire EnTx_Sig,
    output wire EnRx_Sig,
    output wire EnBuadcnt,
    output wire CSN
);

    reg rEnBuadcnt;
    reg rCSN;
    reg [3:0] sta_BDR;

    localparam IDLE = 2'd0;
    localparam TRANSITION = 2'd1;
    localparam ACTIVE = 2'd2;

    [MASKED]

    assign CSN = rCSN;
    assign EnTx_Sig = En;
    assign EnRx_Sig = En;
    assign EnBuadcnt = rEnBuadcnt;

endmodule