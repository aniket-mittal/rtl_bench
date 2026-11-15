module origen_011620 #(
    parameter input_width = 48,
    parameter cycles_per_bit = 391
) (
    input wire clk,
    input wire start,
    input wire [input_width-1:0] bus_in,
    output reg done,
    output reg serial_out
);

    localparam BYTES = input_width / 8;
    localparam BITS_PER_BYTE = 10; // Start bit + 8 data bits + Stop bit

    reg [input_width-1:0] bus_reg;
    reg [$clog2(BYTES)-1:0] byte_counter;
    reg [3:0] bit_counter;
    reg [$clog2(cycles_per_bit)-1:0] clk_counter;

    [MASKED]

endmodule