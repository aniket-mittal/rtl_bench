module rtlpp_01671(
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

// Clock divide parameter
parameter CLOCK_DIVIDE = 217;

// Receive state machine states
localparam [6:0] 
    RX_IDLE = 7'b000_0001,
    RX_CHECK_START = 7'b000_0010,
    RX_READ_BITS = 7'b000_0100,
    RX_CHECK_STOP = 7'b000_1000,
    RX_DELAY_RESTART = 7'b001_0000,
    RX_ERROR = 7'b010_0000,
    RX_RECEIVED = 7'b100_0000;

// Transmit state machine states
localparam [2:0] 
    TX_IDLE = 3'b001,
    TX_SENDING = 3'b010,
    TX_DELAY_RESTART = 3'b100;

// Registers
reg [10:0] rx_clk_divider = CLOCK_DIVIDE;
reg [10:0] tx_clk_divider = CLOCK_DIVIDE;

reg [6:0] recv_state = RX_IDLE;
reg [5:0] rx_countdown;
reg [3:0] rx_bits_remaining;
reg [7:0] rx_data;

reg tx_out = 1'b1;
reg [2:0] tx_state = TX_IDLE;
reg [5:0] tx_countdown;
reg [3:0] tx_bits_remaining;
reg [7:0] tx_data;

// Assign outputs
assign received = (recv_state == RX_RECEIVED);
assign recv_error = (recv_state == RX_ERROR);
assign is_receiving = (recv_state != RX_IDLE);
assign rx_byte = rx_data;

assign tx = tx_out;
assign is_transmitting = (tx_state != TX_IDLE);

[MASKED]

endmodule