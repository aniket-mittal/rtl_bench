module sky130_fd_sc_hd__dfstp_1 (
    Q,
    CLK,
    D,
    SET_B
);

    output Q;
    input CLK;
    input D;
    input SET_B;

    supply1 VPWR;
    supply0 VGND;
    supply1 VPB;
    supply0 VNB;

    reg Q;
    always @(posedge CLK or negedge SET_B) begin
        if (!SET_B)
            Q <= 1'b0;
        else
            Q <= D;
    end

endmodule