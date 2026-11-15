module origen_037593 (
    input wire async_clk,
    input wire clk,
    output wire out_sync_clk
);

    wire auto_reset;
    wire q1, q2, q3, q4;

    FDC FDC1 (
        .D(1'b1),
        .C(async_clk),
        .CLR(auto_reset),
        .Q(q1)
    );

    FDC FDC2 (
        .D(q1),
        .C(clk),
        .CLR(1'b0),
        .Q(q2)
    );

    FDC FDC3 (
        .D(q2),
        .C(clk),
        .CLR(1'b0),
        .Q(q3)
    );

    FDC FDC4 (
        .D(q3),
        .C(clk),
        .CLR(1'b0),
        .Q(q4)
    );

    assign auto_reset = q3 & ~async_clk;
    assign out_sync_clk = ~q4 & q3;

endmodule

module FDC (
    input wire D,
    input wire C,
    input wire CLR,
    output reg Q
);

    always @(posedge C or posedge CLR) begin
        if (CLR)
            Q <= 1'b0;
        else
            Q <= D;
    end

endmodule