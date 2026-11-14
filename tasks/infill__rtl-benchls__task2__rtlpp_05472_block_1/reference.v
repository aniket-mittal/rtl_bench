module rtlpp_05472 (
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
    
    reg Q;
    
    always @(posedge CLK or negedge RESET_B) begin
        if (!RESET_B)
            Q <= 1'b0;
        else if (SCE)
            Q <= SCD;
        else
            Q <= D;
    end

endmodule