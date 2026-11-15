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

always @(*) begin
    case (fmap_idx_delay5)
        7'd0:  sram_bytemask = {CH_NUM{2'b11}};
        7'd1:  sram_bytemask = {CH_NUM{2'b11}};
        7'd2:  sram_bytemask = {CH_NUM{2'b11}};
        7'd3:  sram_bytemask = {CH_NUM{2'b11}};
        7'd4:  sram_bytemask = {CH_NUM{2'b11}};
        7'd5:  sram_bytemask = {CH_NUM{2'b11}};
        7'd6:  sram_bytemask = {CH_NUM{2'b11}};
        7'd7:  sram_bytemask = {CH_NUM{2'b11}};
        7'd8:  sram_bytemask = {CH_NUM{2'b11}};
        7'd9:  sram_bytemask = {CH_NUM{2'b11}};
        7'd10: sram_bytemask = {CH_NUM{2'b11}};
        7'd11: sram_bytemask = {CH_NUM{2'b11}};
        7'd12: sram_bytemask = {CH_NUM{2'b11}};
        7'd13: sram_bytemask = {CH_NUM{2'b11}};
        7'd14: sram_bytemask = {CH_NUM{2'b11}};
        7'd15: sram_bytemask = {CH_NUM{2'b11}};
        7'd16: sram_bytemask = {CH_NUM{2'b11}};
        7'd17: sram_bytemask = {CH_NUM{2'b11}};
        7'd18: sram_bytemask = {CH_NUM{2'b11}};
        7'd19: sram_bytemask = {CH_NUM{2'b11}};
        7'd20: sram_bytemask = {CH_NUM{2'b11}};
        7'd21: sram_bytemask = {CH_NUM{2'b11}};
        7'd22: sram_bytemask = {CH_NUM{2'b11}};
        7'd23: sram_bytemask = {CH_NUM{2'b11}};
        7'd24: sram_bytemask = {CH_NUM{2'b11}};
        7'd25: sram_bytemask = {CH_NUM{2'b11}};
        7'd26: sram_bytemask = {CH_NUM{2'b11}};
        7'd27: sram_bytemask = {CH_NUM{2'b11}};
        7'd28: sram_bytemask = {CH_NUM{2'b11}};
        7'd29: sram_bytemask = {CH_NUM{2'b11}};
        7'd30: sram_bytemask = {CH_NUM{2'b11}};
        7'd31: sram_bytemask = {CH_NUM{2'b11}};
        default: sram_bytemask = {CH_NUM{2'b11}};
    endcase
end

endmodule