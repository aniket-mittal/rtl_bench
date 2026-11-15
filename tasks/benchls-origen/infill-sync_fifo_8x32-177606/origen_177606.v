module origen_177606 #(
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 8
)
(
    output [DATA_WIDTH-1:0] fifo_rd_data,
    output fifo_full,
    output fifo_empty,
    output reg fifo_rd_err,
    output reg fifo_wr_err,
    input [DATA_WIDTH-1:0] fifo_wr_data,
    input fifo_wr_en,
    input fifo_rd_en,
    input clk,
    input rst_n
);

    reg [DATA_WIDTH-1:0] fifo_mem [FIFO_DEPTH-1:0];
    reg [3:0] fifo_wr_addr;
    reg [3:0] fifo_rd_addr;

    [MASKED]

    assign fifo_rd_data = fifo_mem[fifo_rd_addr[2:0]];
    assign fifo_full = (fifo_wr_addr[2:0] == fifo_rd_addr[2:0]) && (fifo_wr_addr[3] ^ fifo_rd_addr[3]);
    assign fifo_empty = (fifo_wr_addr == fifo_rd_addr);

endmodule