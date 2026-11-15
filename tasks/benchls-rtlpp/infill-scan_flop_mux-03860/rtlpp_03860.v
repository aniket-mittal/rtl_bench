module rtlpp_03860 (
    Q   ,
    CLK ,
    D   ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output Q   ;
    input  CLK ;
    input  D   ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Internal logic equivalent to sky130_fd_sc_hdll__sdfxtp
    reg Q_reg;
    wire mux_out;

    assign mux_out = SCE ? SCD : D;

    [MASKED]

    assign Q = Q_reg;

endmodule