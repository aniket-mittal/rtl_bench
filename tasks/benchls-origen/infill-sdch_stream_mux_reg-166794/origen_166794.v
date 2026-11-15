module origen_166794(
    input clk,
    input rst,
    input tb_startup,
    input emif_sdch_rd,
    input p_q_swi,
    input [15:0] p_sdch_dout,
    input p_sdch_dout_vld,
    input [15:0] q_sdch_dout,
    input q_sdch_dout_vld,
    input source_valid,
    input source_sop,
    input source_eop,
    input [15:0] source_data_s,
    output reg p_enable,
    output reg q_enable,
    output reg p_tb_startup,
    output reg q_tb_startup,
    output reg p_emif_sdch_rd,
    output reg q_emif_sdch_rd,
    output reg p_source_valid,
    output reg p_source_sop,
    output reg p_source_eop,
    output reg [15:0] p_source_data_s,
    output reg q_source_valid,
    output reg q_source_sop,
    output reg q_source_eop,
    output reg [15:0] q_source_data_s,
    output reg [15:0] sdch_dout,
    output reg sdch_dout_vld
);

    [MASKED]

endmodule