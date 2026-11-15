module origen_003971 #(
    parameter W_ADDR = 12,
    parameter W_DATA = 128
)(
    // RAM interface
    output [W_ADDR-1:0] ram_rd_addr,
    output [W_ADDR-1:0] ram_wr_addr,
    output [W_DATA-1:0] ram_wr_data,
    output ram_rd_en,
    output ram_wr_en,
    input [W_DATA-1:0] ram_rd_data,

    // DMA interface
    output [W_DATA-1:0] dma_rd_data,
    input [W_ADDR-1:0] dma_rd_addr,
    input [W_ADDR-1:0] dma_wr_addr,
    input [W_DATA-1:0] dma_wr_data,
    input dma_rd_en,
    input dma_wr_en,

    // Custom interface
    output custom_en,
    output [W_DATA-1:0] custom_rd_data,
    input [W_ADDR-1:0] custom_rd_addr,
    input [W_ADDR-1:0] custom_wr_addr,
    input [W_DATA-1:0] custom_wr_data,
    input custom_rd_en,
    input custom_wr_en
);

    // DMA activity signal
    wire dma_active = dma_rd_en | dma_wr_en;

    // Custom interface enable
    assign custom_en = ~dma_active;

    // RAM read address multiplexer
    assign ram_rd_addr = dma_active ? dma_rd_addr :
                         custom_en ? custom_rd_addr : {W_ADDR{1'bx}};

    // RAM write address multiplexer
    assign ram_wr_addr = dma_active ? dma_wr_addr :
                         custom_en ? custom_wr_addr : {W_ADDR{1'bx}};

    // RAM write data multiplexer
    assign ram_wr_data = dma_active ? dma_wr_data :
                         custom_en ? custom_wr_data : {W_DATA{1'bx}};

    // RAM read enable
    assign ram_rd_en = dma_rd_en | (custom_en & custom_rd_en);

    // RAM write enable
    assign ram_wr_en = dma_wr_en | (custom_en & custom_wr_en);

    // Read data routing
    assign dma_rd_data = ram_rd_data;
    assign custom_rd_data = ram_rd_data;

endmodule