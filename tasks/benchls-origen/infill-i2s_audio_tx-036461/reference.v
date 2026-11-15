module origen_036461 (
    input wire nRESET,
    input wire CLK_I2S,
    input wire [5:0] ANA,
    input wire SH1,
    input wire SH2,
    input wire OP0,
    input wire PHI_M,
    output wire I2S_MCLK,
    output wire I2S_BICK,
    output wire I2S_SDTI,
    output wire I2S_LRCK
);

reg [23:0] I2S_SAMPLE;
reg [23:0] I2S_SR;
reg [3:0] SR_CNT;
reg [7:0] CLKDIV;

assign I2S_MCLK = CLK_I2S;
assign I2S_BICK = CLKDIV[4];
assign I2S_LRCK = CLKDIV[7];
assign I2S_SDTI = I2S_SR[23];

always @(posedge CLK_I2S or negedge nRESET) begin
    if (!nRESET) begin
        CLKDIV <= 8'b0;
    end else begin
        CLKDIV <= CLKDIV + 1'b1;
    end
end

always @(negedge I2S_BICK or negedge nRESET) begin
    if (!nRESET) begin
        I2S_SR <= 24'b0;
        SR_CNT <= 4'b0;
    end else begin
        if (SR_CNT == 4'b0) begin
            I2S_SR <= I2S_SAMPLE;
        end else begin
            I2S_SR <= {I2S_SR[22:0], 1'b0};
        end
        SR_CNT <= SR_CNT + 1'b1;
    end
end

always @(posedge CLK_I2S or negedge nRESET) begin
    if (!nRESET) begin
        I2S_SAMPLE <= 24'b0;
    end else begin
        I2S_SAMPLE <= {18'b0, ANA};
    end
end

endmodule