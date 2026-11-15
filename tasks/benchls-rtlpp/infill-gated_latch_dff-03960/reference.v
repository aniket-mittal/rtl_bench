module rtlpp_03960 (
    Q,
    Q_N,
    RESET_B,
    D,
    GATE_N,
    VPWR,
    VGND,
    VPB,
    VNB
);

    output Q;
    output Q_N;
    input  RESET_B;
    input  D;
    input  GATE_N;
    input  VPWR;
    input  VGND;
    input  VPB;
    input  VNB;

    // Inverting the GATE_N signal
    wire GATE;
    not (GATE, GATE_N);

    // Internal signals for the flip-flop
    reg Q_internal;
    reg Q_N_internal;

    // Latching logic
    always @ (posedge GATE or negedge RESET_B) begin
        if (!RESET_B) begin
            Q_internal <= 1'b0;
            Q_N_internal <= 1'b1;
        end else begin
            Q_internal <= D;
            Q_N_internal <= ~D;
        end
    end

    assign Q = Q_internal;
    assign Q_N = Q_N_internal;

endmodule