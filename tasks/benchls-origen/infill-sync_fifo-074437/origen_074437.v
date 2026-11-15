module origen_074437 #(
    parameter FIFO_WIDTH = 8,
    parameter FIFO_LENGTH = 16
) (
    input wire i_clk,
    input wire i_reset_n,
    input wire i_push,
    input wire i_pop,
    input wire i_enable,
    input wire [FIFO_WIDTH-1:0] i_data,
    output reg o_full,
    output reg o_empty,
    output reg [FIFO_WIDTH-1:0] o_data
);

    reg [FIFO_WIDTH-1:0] fifo_mem [0:FIFO_LENGTH-1];
    reg [$clog2(FIFO_LENGTH):0] r_counter;
    reg [$clog2(FIFO_LENGTH)-1:0] wr_pnt, rd_pnt;

    [MASKED]

endmodule