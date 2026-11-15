module rtlpp_02017(
            input            clk, 
            input            rst, 
            input            rx, 
            output reg       tx, 
            input            transmit, 
            input [7:0]      tx_byte, 
            output reg       received, 
            output reg [7:0] rx_byte, 
            output reg       is_receiving, 
            output reg       is_transmitting, 
            output reg       recv_error, 
            input [15:0]     baud,
            input            recv_ack
            );

    parameter RX_IDLE = 0;
    parameter RX_CHECK_START = 1;
    parameter RX_READ_BITS = 2;
    parameter RX_CHECK_STOP = 3;
    parameter RX_DELAY_RESTART = 4;
    parameter RX_ERROR = 5;
    parameter RX_RECEIVED = 6;

    parameter TX_IDLE = 0;
    parameter TX_SENDING = 1;
    parameter TX_DELAY_RESTART = 2;

    reg [10:0] rx_clk_divider;
    reg [10:0] tx_clk_divider;

    reg [2:0] recv_state;
    reg [5:0] rx_countdown;
    reg [3:0] rx_bits_remaining;
    reg [7:0] rx_data;

    reg [8:0] tx_out;
    reg [1:0] tx_state;
    reg [5:0] tx_countdown;
    reg [3:0] tx_bits_remaining;
    reg [7:0] tx_data;

    [MASKED]

endmodule