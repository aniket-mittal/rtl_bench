module origen_066710 #(
    parameter CLK_FREQ = 50_000_000
) (
    input wire i_clk,
    input wire i_reset_n,
    input wire i_pop,
    input wire i_parity,
    input wire i_serial,
    input wire i_enable,
    input wire [15:0] i_baud,
    output wire o_tx_enable,
    output wire o_rx_enable
);

    localparam TX_CYCLES = 10;
    localparam RX_CYCLES = 9;

    reg r_tx_enable, r_rx_enable;
    reg [3:0] r_tx_cycle, r_rx_cycle;
    reg [15:0] r_tx_baud_counter, r_rx_baud_counter;
    reg [1:0] r_rx_state;

    localparam START = 2'b00, HALF_PERIOD = 2'b01, COUNT = 2'b10;

    [MASKED]

    assign o_tx_enable = r_tx_enable;
    assign o_rx_enable = r_rx_enable;

endmodule