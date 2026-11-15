module rtlpp_08507 (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    reg Q_reg;

    always @(posedge CLK or negedge RESET_B) begin
        if (!RESET_B)
            Q_reg <= 1'b0;
        else if (SCE)
            Q_reg <= SCD;
        else
            Q_reg <= D;
    end

    assign Q = Q_reg;

endmodule