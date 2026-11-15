module origen_055073 #(
    parameter POSEDGE = 1
)(
    input wire CLK,
    input wire RESET,
    input wire SIGNAL,
    output wire EDGE
);

    reg state, prev_state;

    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            state <= #1 ~POSEDGE;
            prev_state <= #1 ~POSEDGE;
        end else begin
            state <= #1 SIGNAL;
            prev_state <= #1 state;
        end
    end

    assign EDGE = POSEDGE ? (state & ~prev_state) : (~state & prev_state);

endmodule

module DETECT_POSEDGE (
    input wire CLK,
    input wire RESET,
    input wire SIGNAL,
    output wire EDGE
);

    DETECT_EDGE #(
        .POSEDGE(1)
    ) posedge_detector (
        .CLK(CLK),
        .RESET(RESET),
        .SIGNAL(SIGNAL),
        .EDGE(EDGE)
    );

endmodule

module DETECT_NEGEDGE (
    input wire CLK,
    input wire RESET,
    input wire SIGNAL,
    output wire EDGE
);

    DETECT_EDGE #(
        .POSEDGE(0)
    ) negedge_detector (
        .CLK(CLK),
        .RESET(RESET),
        .SIGNAL(SIGNAL),
        .EDGE(EDGE)
    );

endmodule