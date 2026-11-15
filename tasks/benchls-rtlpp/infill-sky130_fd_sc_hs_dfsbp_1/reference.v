module sky130_fd_sc_hs__dfsbp_1 (
    CLK  ,
    D    ,
    Q    ,
    Q_N  ,
    SET_B
);

    input  CLK  ;
    input  D    ;
    output Q    ;
    output Q_N  ;
    input  SET_B;

    supply1 VPWR;
    supply0 VGND;

    // Internal logic
    reg Q_int, Q_N_int;
    always @ (posedge CLK or negedge SET_B)
    begin
        if (!SET_B)
        begin
            Q_int <= 1'b1;
            Q_N_int <= 1'b0;
        end
        else
        begin
            Q_int <= D;
            Q_N_int <= ~D;
        end
    end

    assign Q = Q_int;
    assign Q_N = Q_N_int;

endmodule