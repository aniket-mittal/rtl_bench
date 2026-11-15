`timescale 1ns / 1ps

module origen_210271 #(
    parameter PTR_WIDTH = 3
)(
    input clk,
    input clear,
    input wr,
    input [7:0] data_in,
    input rd,
    output reg [7:0] data_out,
    output reg data_out_valid,
    output reg empty,
    output reg full
);

localparam FIFO_DEPTH = 2 ** PTR_WIDTH;

reg [7:0] data_mem [0:FIFO_DEPTH-1];
reg [PTR_WIDTH-1:0] nxt_wr;
reg [PTR_WIDTH-1:0] nxt_rd;
reg [PTR_WIDTH:0] data_counter;

[MASKED]

always @* begin
    empty = (data_counter == 0);
    full = (data_counter == FIFO_DEPTH);
end

endmodule