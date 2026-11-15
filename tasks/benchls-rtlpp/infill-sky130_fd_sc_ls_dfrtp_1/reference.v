module sky130_fd_sc_ls__dfrtp_1 (
    Q      ,
    CLK    ,
    D      ,
    RESET_B
);

    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;

    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    reg Q_int;

    always @(posedge CLK or negedge RESET_B) begin
        if (!RESET_B)
            Q_int <= 1'b0;
        else
            Q_int <= D;
    end

    assign Q = Q_int;

endmodule