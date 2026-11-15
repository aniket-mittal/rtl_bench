module origen_046488 #(
    parameter WIDTH = 64,
    parameter DEPTH = 24
) (
    input wire [WIDTH-1:0] data_in1, data_in2, data_in3,
    input wire clk, rst,
    input wire write1, write2, write3,
    input wire read,
    output reg [WIDTH-1:0] data_out,
    output wire fifo_full,
    output wire fifo_empty
);

    // Error checking for illegal parameters
    initial begin
        if (WIDTH <= 0) $error("WIDTH must be greater than 0");
        if (DEPTH <= 0) $error("DEPTH must be greater than 0");
    end

    reg [WIDTH-1:0] memory [0:DEPTH-1];
    reg [$clog2(DEPTH):0] write_ptr, read_ptr;

    assign fifo_empty = (write_ptr == read_ptr);
    assign fifo_full = (write_ptr == DEPTH-1);

    [MASKED]

endmodule