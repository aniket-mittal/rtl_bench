module origen_033256(
    input wire clk,
    input wire reset,
    output wire [3:0] q
);

    wire [3:0] t_clk;
    assign t_clk[0] = clk;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : tff_gen
            t_flip_flop tff (
                .clk(t_clk[i]),
                .reset(reset),
                .q(q[i])
            );
            if (i < 3) begin
                assign t_clk[i+1] = q[i];
            end
        end
    endgenerate

endmodule

module t_flip_flop(
    input wire clk,
    input wire reset,
    output wire q
);

    wire d;
    assign d = ~q;

    d_flip_flop dff (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

endmodule

module d_flip_flop(
    input wire d,
    input wire clk,
    input wire reset,
    output reg q
);

    always @(negedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule