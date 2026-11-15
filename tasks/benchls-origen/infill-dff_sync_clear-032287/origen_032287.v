module origen_032287(
    input d,
    input clearb,
    input clock,
    output reg q
);

[MASKED]

endmodule

module dff_async_clear(
    input d,
    input clearb,
    input clock,
    output reg q
);

always @(negedge clearb or posedge clock) begin
    if (!clearb)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

module Testing;
    reg d, clk, rst;
    wire q;

    dff_sync_clear dut(
        .d(d),
        .clearb(rst),
        .clock(clk),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        d = 0; rst = 1;
        #6 d = 1; rst = 0;
        #50 d = 1; rst = 1;
        #20 d = 0; rst = 0;
        #224 ;
    end

    always @(posedge clk) begin
        ;
    end

endmodule