module origen_127437 #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
) (
    input wire clk,
    input wire reset,
    input wire [WIDTH-1:0] data_in,
    input wire data_in_start,
    input wire data_in_end,
    output reg [WIDTH-1:0] data_out,
    output reg data_out_start,
    output reg data_out_end
);

    reg [WIDTH-1:0] memory [0:DEPTH-1];
    reg [$clog2(DEPTH):0] write_ptr, read_ptr;
    reg [$clog2(DEPTH):0] count;

    wire full = (count == DEPTH);
    wire empty = (count == 0);

    [MASKED]

endmodule