module rtlpp_00750(
    input clk, 
    input rst, 
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

parameter CLOCK_DIVIDE = 3; 

parameter RX_IDLE = 3'd0;
parameter RX_CHECK_START = 3'd1;
parameter RX_READ_BITS = 3'd2;
parameter RX_CHECK_STOP = 3'd3;
parameter RX_DELAY_RESTART = 3'd4;
parameter RX_ERROR = 3'd5;
parameter RX_RECEIVED = 3'd6;

parameter TX_IDLE = 2'd0;
parameter TX_SENDING = 2'd1;
parameter TX_DELAY_RESTART = 2'd2;

reg [10:0] rx_clk_divider = CLOCK_DIVIDE;
reg [10:0] tx_clk_divider = CLOCK_DIVIDE;

reg [2:0] recv_state = RX_IDLE;
reg [5:0] rx_countdown;
reg [3:0] rx_bits_remaining;
reg [7:0] rx_data;

reg tx_out = 1'b1;
reg [1:0] tx_state = TX_IDLE;
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