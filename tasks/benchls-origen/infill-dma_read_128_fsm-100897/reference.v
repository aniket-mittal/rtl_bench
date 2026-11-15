module origen_100897 (
    input wire clk,
    input wire rst_n,
    input wire dma_rd_strt,
    input wire dma_rd_done,
    input wire dma_empty,
    input wire mem_wr_rdy,
    output reg dma_rd_end_128,
    output reg dma_rd_go_128,
    output reg dma_rd_en_128,
    output reg dma_rd_data_128_upd,
    output reg dma_rd_data_128_shft,
    output reg dma_rd_done_clr_128,
    output reg [1:0] mem_wr_en_128
);

    // State encoding
    localparam [2:0] DMA_RD_128_IDLE  = 3'b000,
                     DMA_RD_128_GO    = 3'b001,
                     DMA_RD_128_WAIT  = 3'b010,
                     DMA_RD_128_EMPTY = 3'b011,
                     DMA_RD_128_HOLD  = 3'b100,
                     DMA_RD_128_LOAD  = 3'b101;

    reg [2:0] state_dma_rd_128, nxt_state_dma_rd_128;
    reg [2:0] mem_wr_data_128_cnt;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state_dma_rd_128 <= DMA_RD_128_IDLE;
        else
            state_dma_rd_128 <= nxt_state_dma_rd_128;
    end

    // Next state logic
    always @(*) begin
        nxt_state_dma_rd_128 = state_dma_rd_128;
        case (state_dma_rd_128)
            DMA_RD_128_IDLE:  if (dma_rd_strt) nxt_state_dma_rd_128 = DMA_RD_128_GO;
            DMA_RD_128_GO:    nxt_state_dma_rd_128 = DMA_RD_128_WAIT;
            DMA_RD_128_WAIT:  if (dma_rd_done) nxt_state_dma_rd_128 = DMA_RD_128_IDLE;
                              else if (!dma_empty) nxt_state_dma_rd_128 = DMA_RD_128_EMPTY;
            DMA_RD_128_EMPTY: nxt_state_dma_rd_128 = DMA_RD_128_HOLD;
            DMA_RD_128_HOLD:  nxt_state_dma_rd_128 = DMA_RD_128_LOAD;
            DMA_RD_128_LOAD:  if (mem_wr_data_128_cnt == 3'b011 && mem_wr_rdy) nxt_state_dma_rd_128 = DMA_RD_128_WAIT;
            default:          nxt_state_dma_rd_128 = DMA_RD_128_IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dma_rd_end_128 <= 1'b0;
            dma_rd_go_128 <= 1'b0;
            dma_rd_en_128 <= 1'b0;
            dma_rd_data_128_upd <= 1'b0;
            dma_rd_data_128_shft <= 1'b0;
            dma_rd_done_clr_128 <= 1'b0;
            mem_wr_en_128 <= 2'b00;
            mem_wr_data_128_cnt <= 3'b000;
        end else begin
            dma_rd_end_128 <= 1'b0;
            dma_rd_go_128 <= 1'b0;
            dma_rd_en_128 <= 1'b0;
            dma_rd_data_128_upd <= 1'b0;
            dma_rd_data_128_shft <= 1'b0;
            dma_rd_done_clr_128 <= 1'b0;
            mem_wr_en_128 <= 2'b00;

            case (state_dma_rd_128)
                DMA_RD_128_GO: begin
                    dma_rd_go_128 <= 1'b1;
                    dma_rd_en_128 <= 1'b1;
                end
                DMA_RD_128_WAIT: begin
                    if (dma_rd_done) dma_rd_end_128 <= 1'b1;
                end
                DMA_RD_128_EMPTY: begin
                    dma_rd_data_128_upd <= 1'b1;
                end
                DMA_RD_128_HOLD: begin
                    dma_rd_done_clr_128 <= 1'b1;
                end
                DMA_RD_128_LOAD: begin
                    if (mem_wr_rdy) begin
                        mem_wr_en_128 <= 2'b11;
                        dma_rd_data_128_shft <= 1'b1;
                        mem_wr_data_128_cnt <= mem_wr_data_128_cnt + 1;
                        if (mem_wr_data_128_cnt == 3'b011) begin
                            mem_wr_data_128_cnt <= 3'b000;
                            dma_rd_en_128 <= 1'b1;
                        end
                    end
                end
            endcase
        end
    end

endmodule