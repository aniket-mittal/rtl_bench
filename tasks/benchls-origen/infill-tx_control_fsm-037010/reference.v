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

    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn) begin
            sta_BDR <= IDLE;
            rEnBuadcnt <= 1'b0;
            rCSN <= 1'b1;
        end else begin
            case (sta_BDR)
                IDLE: begin
                    if (En) begin
                        sta_BDR <= TRANSITION;
                        rEnBuadcnt <= 1'b1;
                        rCSN <= 1'b0;
                    end
                end
                TRANSITION: begin
                    sta_BDR <= ACTIVE;
                end
                ACTIVE: begin
                    if (!Tx_Busy_Sig) begin
                        sta_BDR <= IDLE;
                        rEnBuadcnt <= 1'b0;
                        rCSN <= 1'b1;
                    end
                end
                default: sta_BDR <= IDLE;
            endcase
        end
    end

    assign CSN = rCSN;
    assign EnTx_Sig = En;
    assign EnRx_Sig = En;
    assign EnBuadcnt = rEnBuadcnt;

endmodule