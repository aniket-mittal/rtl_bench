module rtlpp_00100(
    input       clk, 
    input       rstn, 
    input       rx, 
    output      tx, 
    input       transmit, 
    input [7:0] tx_byte, 
    output      received, 
    output [7:0] rx_byte, 
    output      is_receiving, 
    output      is_transmitting, 
    output      recv_error 
);

    parameter CLOCK_DIVIDE = 217;

    // States for receiving
    parameter RX_IDLE          = 7'b000_0001;
    parameter RX_CHECK_START   = 7'b000_0010;
    parameter RX_READ_BITS     = 7'b000_0100;
    parameter RX_CHECK_STOP    = 7'b000_1000;
    parameter RX_DELAY_RESTART = 7'b001_0000;
    parameter RX_ERROR         = 7'b010_0000;
    parameter RX_RECEIVED      = 7'b100_0000;

    // States for transmitting
    parameter TX_IDLE          = 3'b001;
    parameter TX_SENDING       = 3'b010;
    parameter TX_DELAY_RESTART = 3'b100;

    reg [10:0] rx_clk_divider;
    reg [10:0] tx_clk_divider;
    reg [6:0] recv_state;
    reg [5:0] rx_countdown;
    reg [3:0] rx_bits_remaining;
    reg [7:0] rx_data;
    reg       tx_out;
    reg [2:0] tx_state;
    reg [5:0] tx_countdown;
    reg [3:0] tx_bits_remaining;
    reg [7:0] tx_data;

    assign received = (recv_state == RX_RECEIVED);
    assign recv_error = (recv_state == RX_ERROR);
    assign is_receiving = (recv_state != RX_IDLE);
    assign rx_byte = rx_data;

    assign tx = tx_out;
    assign is_transmitting = (tx_state != TX_IDLE);

    [MASKED]

endmodule