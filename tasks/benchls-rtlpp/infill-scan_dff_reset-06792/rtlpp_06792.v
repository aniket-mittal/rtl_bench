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

    [MASKED]
    
    assign Q = Q_internal;

endmodule