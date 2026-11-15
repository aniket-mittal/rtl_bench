module origen_202403 #(
    parameter CH_NUM = 16,
    parameter ACT_PER_ADDR = 2,
    parameter BW_PER_ACT = 8,
    parameter WEIGHT_PER_ADDR = 2,
    parameter BIAS_PER_ADDR = 2,
    parameter BW_PER_WEIGHT = 8,
    parameter BW_PER_BIAS = 8
) (
    input [6:0] fmap_idx_delay5,
    output reg [(CH_NUM * ACT_PER_ADDR) - 1:0] sram_bytemask
);

[MASKED]

endmodule