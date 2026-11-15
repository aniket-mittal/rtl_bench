module origen_045281 (
    input wire uart_rx,
    input wire smp_clk,
    input wire reset,
    output reg rx_status,
    output reg [7:0] rx_data
);

    reg section;
    reg [7:0] sect_cnt;
    reg [2:0] bit_cnt;
    parameter sect_lim = 8'h9F;

    [MASKED]

endmodule