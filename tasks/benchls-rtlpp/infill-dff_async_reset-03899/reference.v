module rtlpp_03899 (
    Q      ,
    CLK    ,
    D      ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    reg Q_int;

    always @(posedge CLK or negedge RESET_B) begin
        if (!RESET_B)
            Q_int <= 1'b0;
        else
            Q_int <= D;
    end

    assign Q = Q_int;

endmodule