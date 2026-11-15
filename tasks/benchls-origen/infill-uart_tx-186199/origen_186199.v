module origen_186199 #(
    parameter BAUD_END = 5207,   // Baud rate generator end count (non-simulation mode)
    parameter BIT_END   = 8      // Number of bits in the data frame
) (
    input  wire        s_clk,
    input  wire        s_rst_n,
    input  wire [7:0]  tx_data,
    input  wire        tx_trig,
    output reg         rs232_tx
);

    reg [7:0]  tx_data_r;
    reg        tx_flag;
    reg [13:0] baud_cnt;
    reg        bit_flag;
    reg [2:0]  bit_cnt;

    [MASKED]

endmodule