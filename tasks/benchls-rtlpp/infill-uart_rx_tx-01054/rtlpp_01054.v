module rtlpp_01054 (
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

parameter CLOCK_DIVIDE = 1;

parameter RX_IDLE = 3'b000;
parameter RX_CHECK_START = 3'b001;
parameter RX_READ_BITS = 3'b010;
parameter RX_CHECK_STOP = 3'b011;
parameter RX_DELAY_RESTART = 3'b100;
parameter RX_ERROR = 3'b101;
parameter RX_RECEIVED = 3'b110;

parameter TX_IDLE = 2'b00;
parameter TX_SENDING = 2'b01;
parameter TX_DELAY_RESTART = 2'b10;

reg [10:0] clk_divider;
reg [2:0] recv_state;
reg [5:0] rx_countdown;
reg [3:0] rx_bits_remaining;
reg [7:0] rx_data;
reg tx_out;
reg [1:0] tx_state;
reg [5:0] tx_countdown;
reg [3:0] tx_bits_remaining;
reg [7:0] tx_data;

assign received = (recv_state == RX_RECEIVED) ? 1'b1 : 1'b0;
assign recv_error = (recv_state == RX_ERROR) ? 1'b1 : 1'b0;
assign is_receiving = (recv_state != RX_IDLE) ? 1'b1 : 1'b0;
assign rx_byte = rx_data;
assign tx = tx_out;
assign is_transmitting = (tx_state != TX_IDLE) ? 1'b1 : 1'b0;

[MASKED]

endmodule