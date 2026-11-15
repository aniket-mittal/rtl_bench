module rtlpp_06792 (
    output Q      ,
    input  CLK    ,
    input  D      ,
    input  SCD    ,
    input  SCE    ,
    input  RESET_B,
    input  VPWR   ,
    input  VGND   ,
    input  VPB    ,
    input  VNB
);

    wire SCD_internal = SCD;
    wire SCE_internal = SCE;
    wire VPWR_internal = VPWR;
    wire VGND_internal = VGND;
    wire VPB_internal = VPB;
    wire VNB_internal = VNB;

    reg Q_internal;

    always @(posedge CLK or negedge RESET_B) begin
        if (!RESET_B)
            Q_internal <= 1'b0;
        else if (SCE)
            Q_internal <= SCD_internal;
        else
            Q_internal <= D;
    end
    
    assign Q = Q_internal;

endmodule