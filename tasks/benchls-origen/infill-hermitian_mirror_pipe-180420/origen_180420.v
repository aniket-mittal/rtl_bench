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

    [MASKED]

endmodule