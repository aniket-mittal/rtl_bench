module origen_085107 (
    input wire clock,
    input wire reset,
    input wire ce_16,
    input wire [7:0] tx_data,
    input wire new_tx_data,
    output reg ser_out,
    output reg tx_busy
);

    reg ce_1;
    reg [3:0] count16;
    reg [3:0] bit_count;
    reg [8:0] data_buf;

    [MASKED]

endmodule