module origen_148741(
    output Q,
    input CLK,
    input D,
    input SCD,
    input SCE,
    input VPWR,
    input VGND,
    input VPB,
    input VNB
);

    wire notifier, D_delayed, SCD_delayed, SCE_delayed, CLK_delayed;
    wire awake, cond1, cond2, cond3;
    wire mux_out, buf_Q;

    // Power-related assignments
    assign awake = (VPWR === 1'b1);
    assign cond1 = (SCE_delayed === 1'b0 && awake === 1'b1);
    assign cond2 = (SCE_delayed === 1'b1 && awake === 1'b1);
    assign cond3 = (D_delayed !== SCD_delayed && awake === 1'b1);

    // Delay assignments
    assign #1 D_delayed = D;
    assign #1 SCD_delayed = SCD;
    assign #1 SCE_delayed = SCE;
    assign #1 CLK_delayed = CLK;

    // 2-to-1 multiplexer
    assign mux_out = SCE_delayed ? SCD_delayed : D_delayed;

    // D flip-flop
    reg ff_Q;
    always @(posedge CLK_delayed or posedge notifier) begin
        if (notifier)
            ff_Q <= 1'b0;
        else
            ff_Q <= mux_out;
    end

    // Buffer
    assign buf_Q = ff_Q;
    assign Q = buf_Q;

    // Specify block for timing checks
    specify
        (CLK *> Q) = (0:0:0, 0:0:0);
        $setup(D, posedge CLK, 0:0:0);
        $setup(SCD, posedge CLK, 0:0:0);
        $setup(SCE, posedge CLK, 0:0:0);
        $hold(posedge CLK, D, 0:0:0);
        $hold(posedge CLK, SCD, 0:0:0);
        $hold(posedge CLK, SCE, 0:0:0);
        $width(posedge CLK, 0:0:0);
        $width(negedge CLK, 0:0:0);
    endspecify

endmodule