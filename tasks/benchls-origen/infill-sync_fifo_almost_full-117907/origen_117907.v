module origen_117907 #(
    parameter DEPTH = 4,
    parameter WIDTH = 8,
    parameter ALMOST_FULL = 2
) (
    input wire clk,
    input wire reset,
    input wire valid_i,
    input wire ready_o,
    input wire [WIDTH-1:0] data_i,
    output wire ready_i,
    output reg valid_o,
    output reg [WIDTH-1:0] data_o
);

    localparam FIFO_SIZE = 1 << DEPTH;

    reg [WIDTH-1:0] data [0:FIFO_SIZE-1];
    reg [DEPTH-1:0] ptr_i, ptr_o;
    reg [DEPTH:0] fill;

    assign ready_i = (fill < FIFO_SIZE);

    [MASKED]

endmodule