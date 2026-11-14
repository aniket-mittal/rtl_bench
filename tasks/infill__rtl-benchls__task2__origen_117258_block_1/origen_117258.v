module origen_117258 #(
    parameter WIDTH = 16
) (
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] sample_data,
    input wire sample_valid,
    input wire fifo_ready,
    output reg [WIDTH-1:0] fifo_data,
    output reg fifo_overflow,
    output reg fifo_valid
);

    reg [15:0] ov_counter;

    [MASKED]

endmodule