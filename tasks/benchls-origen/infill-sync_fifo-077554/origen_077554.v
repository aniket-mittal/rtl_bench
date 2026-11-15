module origen_077554 #(
    parameter FIFO_WIDTH = 14,
    parameter FIFO_DEPTH = 64
) (
    input wire clk,
    input wire rst_n,
    input wire wr_en,
    input wire [FIFO_WIDTH-1:0] wr_data,
    input wire rd_en,
    output reg fifo_full,
    output reg [$clog2(FIFO_DEPTH):0] fifo_count,
    output reg [FIFO_WIDTH-1:0] rd_data,
    output reg fifo_empty,
    output reg fifo_almst_empty
);

    // Local parameters
    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);

    // Internal signals
    reg [ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
    reg [FIFO_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];

    // FIFO control logic
    [MASKED]

endmodule