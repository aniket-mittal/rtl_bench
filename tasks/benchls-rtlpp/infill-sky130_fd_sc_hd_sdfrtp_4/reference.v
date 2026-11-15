module sky130_fd_sc_hd__sdfrtp_4 (
    output reg Q,
    input CLK,
    input D,
    input SCD,
    input SCE,
    input RESET_B
);

    supply1 VPWR;
    supply0 VGND;
    supply1 VPB;
    supply0 VNB;

    always @(posedge CLK or negedge RESET_B) begin
        if (!RESET_B)
            Q <= 1'b0;
        else if (SCE)
            Q <= SCD;
        else
            Q <= D;
    end

endmodule