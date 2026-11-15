module rtlpp_01123(
    input clk, 
    input rstn, 
    input rx, 
    output tx, 
    input transmit, 
    input [7:0] tx_byte, 
    output received, 
    output [7:0] rx_byte, 
    output is_receiving, 
    output is_transmitting, 
    output recv_error
);

parameter CLOCK_DIVIDE = 217;

localparam [6:0]
    RX_IDLE          = 7'b0000001,
    RX_CHECK_START   = 7'b0000010,
    RX_READ_BITS     = 7'b0000100,
    RX_CHECK_STOP    = 7'b0001000,
    RX_DELAY_RESTART = 7'b0010000,
    RX_ERROR         = 7'b0100000,
    RX_RECEIVED      = 7'b1000000;

localparam [2:0]
    TX_IDLE          = 3'b001,
    TX_SENDING       = 3'b010,
    TX_DELAY_RESTART = 3'b100;

reg [10:0] rx_clk_divider;
reg [10:0] tx_clk_divider;

reg [6:0] recv_state;
reg [5:0] rx_countdown;
reg [3:0] rx_bits_remaining;
reg [7:0] rx_data;

reg tx_out;
reg [2:0] tx_state;
reg [5:0] tx_countdown;
reg [3:0] tx_bits_remaining;
reg [7:0] tx_data;

assign received = recv_state == RX_RECEIVED;
assign recv_error = recv_state == RX_ERROR;
assign is_receiving = recv_state != RX_IDLE;
assign rx_byte = rx_data;

assign tx = tx_out;
assign is_transmitting = tx_state != TX_IDLE;

[MASKED]

endmodule