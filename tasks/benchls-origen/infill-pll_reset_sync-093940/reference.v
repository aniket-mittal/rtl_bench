module origen_093940 #(
    parameter CLOCKS = 2
) (
    input wire clock,
    input wire [CLOCKS-1:0] pll_clocks,
    input wire pll_locked,
    output reg pll_areset,
    output wire [CLOCKS-1:0] pll_sreset
);

    // PLL lock monitoring
    reg [2:0] pll_locked_meta;
    reg [11:0] counter;
    wire counter_max;

    always @(posedge clock or posedge pll_areset) begin
        if (pll_areset) begin
            pll_locked_meta <= 3'b000;
            counter <= 12'd0;
        end else begin
            pll_locked_meta <= {pll_locked_meta[1:0], pll_locked};
            counter <= counter + 1'b1;
        end
    end

    assign counter_max = &counter;

    // Asynchronous reset generation
    reg pll_areset_flop;

    always @(posedge clock or negedge pll_locked) begin
        if (!pll_locked) begin
            pll_areset <= 1'b1;
            pll_areset_flop <= 1'b1;
        end else if (counter_max) begin
            pll_areset <= ~pll_locked_meta[2];
            pll_areset_flop <= ~pll_locked_meta[2] | ~counter_max;
        end
    end

    // Synchronous reset generation
    genvar i;
    generate
        for (i = 0; i < CLOCKS; i = i + 1) begin : sync_reset_gen
            reg [2:0] sreset_meta;
            always @(posedge pll_clocks[i] or posedge pll_areset_flop) begin
                if (pll_areset_flop) begin
                    sreset_meta <= 3'b111;
                end else begin
                    sreset_meta <= {sreset_meta[1:0], 1'b0};
                end
            end
            assign pll_sreset[i] = sreset_meta[2];
        end
    endgenerate

endmodule