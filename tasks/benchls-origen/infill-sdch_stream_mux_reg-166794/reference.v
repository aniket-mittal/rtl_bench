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

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            p_enable <= 0;
            q_enable <= 0;
            p_tb_startup <= 0;
            q_tb_startup <= 0;
            p_emif_sdch_rd <= 0;
            q_emif_sdch_rd <= 0;
            p_source_valid <= 0;
            p_source_sop <= 0;
            p_source_eop <= 0;
            p_source_data_s <= 0;
            q_source_valid <= 0;
            q_source_sop <= 0;
            q_source_eop <= 0;
            q_source_data_s <= 0;
            sdch_dout <= 0;
            sdch_dout_vld <= 0;
        end else begin
            if (p_q_swi) begin
                p_enable <= p_q_swi;
                q_enable <= 0;
                p_tb_startup <= tb_startup;
                q_tb_startup <= 0;
                p_emif_sdch_rd <= emif_sdch_rd;
                q_emif_sdch_rd <= 0;
                p_source_valid <= source_valid;
                p_source_sop <= source_sop;
                p_source_eop <= source_eop;
                p_source_data_s <= source_data_s;
                q_source_valid <= 0;
                q_source_sop <= 0;
                q_source_eop <= 0;
                q_source_data_s <= 0;
                sdch_dout <= p_sdch_dout;
                sdch_dout_vld <= p_sdch_dout_vld;
            end else begin
                p_enable <= 0;
                q_enable <= ~p_q_swi;
                p_tb_startup <= 0;
                q_tb_startup <= tb_startup;
                p_emif_sdch_rd <= 0;
                q_emif_sdch_rd <= emif_sdch_rd;
                p_source_valid <= 0;
                p_source_sop <= 0;
                p_source_eop <= 0;
                p_source_data_s <= 0;
                q_source_valid <= source_valid;
                q_source_sop <= source_sop;
                q_source_eop <= source_eop;
                q_source_data_s <= source_data_s;
                sdch_dout <= q_sdch_dout;
                sdch_dout_vld <= q_sdch_dout_vld;
            end
        end
    end

endmodule