module origen_000728(
    input d,
    input clearb,
    input clock,
    output reg q
);
    always @(posedge clock) begin
        if (!clearb)
            q <= 1'b0;
        else
            q <= d;
    end
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

