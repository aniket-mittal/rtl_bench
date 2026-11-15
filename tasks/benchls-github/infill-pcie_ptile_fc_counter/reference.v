module pcie_ptile_fc_counter #
(
    parameter WIDTH = 16,
    parameter INDEX = 0
)
(
    input  wire              clk,
    input  wire              rst,

    input  wire [WIDTH-1:0]  tx_cdts_limit,
    input  wire [2:0]        tx_cdts_limit_tdm_idx,
    input  wire [WIDTH-1:0]  fc_dec,
    output wire [WIDTH-1:0]  fc_av
);

reg [WIDTH-1:0] fc_cap_reg = 0;
reg [WIDTH-1:0] fc_limit_reg = 0;
reg [WIDTH-1:0] fc_inc_reg = 0;
reg [WIDTH-1:0] fc_av_reg = 0;

assign fc_av = fc_av_reg;

always @(posedge clk) begin
    if (tx_cdts_limit_tdm_idx == INDEX) begin
        if (!fc_cap_reg) begin
            fc_cap_reg <= tx_cdts_limit;
        end
        fc_inc_reg <= tx_cdts_limit - fc_limit_reg;
        fc_limit_reg <= tx_cdts_limit;
    end

    if ($signed({1'b0, fc_av_reg}) - $signed({1'b0, fc_dec}) + $signed({1'b0, fc_inc_reg}) < 0) begin
        fc_av_reg <= 0;
    end else if ($signed({1'b0, fc_av_reg}) - $signed({1'b0, fc_dec}) + $signed({1'b0, fc_inc_reg}) > fc_cap_reg) begin
        fc_av_reg <= fc_cap_reg;
    end else begin
        fc_av_reg <= $signed({1'b0, fc_av_reg}) - $signed({1'b0, fc_dec}) + $signed({1'b0, fc_inc_reg});
    end

    if (rst) begin
        fc_cap_reg <= 0;
        fc_limit_reg <= 0;
        fc_inc_reg <= 0;
        fc_av_reg <= 0;
    end
end

endmodule