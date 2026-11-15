module origen_180420(
    input CLK,
    input RST,
    input [27:0] DATA_IN_RE,
    input [27:0] DATA_IN_IM,
    input [15:0] DATA_IN_INDEX,
    input DATA_IN_VALID,
    output reg [27:0] DATA_OUT_RE,
    output reg [27:0] DATA_OUT_IM,
    output reg [15:0] DATA_OUT_INDEX,
    output reg DATA_OUT_VALID,
    output reg [27:0] DATA_OUT_RE_HER,
    output reg [27:0] DATA_OUT_IM_HER,
    output reg [15:0] DATA_OUT_INDEX_HER,
    output reg DATA_OUT_VALID_HER
);

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            DATA_OUT_RE <= 0;
            DATA_OUT_IM <= 0;
            DATA_OUT_INDEX <= 0;
            DATA_OUT_VALID <= 0;
            DATA_OUT_RE_HER <= 0;
            DATA_OUT_IM_HER <= 0;
            DATA_OUT_INDEX_HER <= 0;
            DATA_OUT_VALID_HER <= 0;
        end else begin
            if (DATA_IN_VALID) begin
                DATA_OUT_RE <= DATA_IN_RE;
                DATA_OUT_IM <= DATA_IN_IM;
                DATA_OUT_INDEX <= DATA_IN_INDEX;
                DATA_OUT_VALID <= 1'b1;
                DATA_OUT_RE_HER <= DATA_IN_RE;
                DATA_OUT_IM_HER <= -DATA_IN_IM;
                DATA_OUT_INDEX_HER <= DATA_IN_INDEX;
                DATA_OUT_VALID_HER <= 1'b1;
            end else begin
                DATA_OUT_RE <= 0;
                DATA_OUT_IM <= 0;
                DATA_OUT_INDEX <= 0;
                DATA_OUT_VALID <= 0;
                DATA_OUT_RE_HER <= 0;
                DATA_OUT_IM_HER <= 0;
                DATA_OUT_INDEX_HER <= 0;
                DATA_OUT_VALID_HER <= 0;
            end
        end
    end

endmodule