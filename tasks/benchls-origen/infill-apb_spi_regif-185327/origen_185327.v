module origen_185327 #(
    parameter CFG_FRAME_SIZE = 8
) (
    // System signals
    input  wire        aresetn,
    input  wire        sresetn,

    // AHB-Lite interface
    input  wire        psel,
    input  wire        penable,
    input  wire        pwrite,
    input  wire [7:0]  paddr,
    input  wire [CFG_FRAME_SIZE-1:0] wr_data_in,

    // SPI control signals
    input  wire        cfg_master,
    input  wire        rx_fifo_empty,
    input  wire        tx_fifo_empty,

    // SPI data signals
    output reg [CFG_FRAME_SIZE-1:0] tx_fifo_data,
    output reg         tx_fifo_write,
    output reg         tx_fifo_last,
    output reg         rx_fifo_read
);

    [MASKED]

endmodule