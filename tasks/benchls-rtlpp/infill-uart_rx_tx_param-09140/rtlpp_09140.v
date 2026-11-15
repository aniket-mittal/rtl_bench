module rtlpp_09140(
	input  wire clk,		
	input  wire rst,		
	input  wire rx,			
	output wire tx,			
	input  wire transmit,		
	input  wire [7:0] tx_byte,	
	output wire received,		
	output wire [7:0] rx_byte,	
	output wire is_receiving,	
	output wire is_transmitting,	
	output wire recv_error		
);

	parameter CLOCKFRQ = 48000000;
	parameter BAUDRATE = 12000000;
	localparam CLOCK_DIVIDE = (CLOCKFRQ/(BAUDRATE*2));

	localparam RX_IDLE = 3'd0;
	localparam RX_CHECK_START = 3'd1;
	localparam RX_READ_BITS = 3'd2;
	localparam RX_CHECK_STOP = 3'd3;
	localparam RX_DELAY_RESTART = 3'd4;
	localparam RX_ERROR = 3'd5;
	localparam RX_RECEIVED = 3'd6;

	localparam TX_IDLE = 2'd0;
	localparam TX_SENDING = 2'd1;
	localparam TX_DELAY_RESTART = 2'd2;

	reg [10:0] rx_clk_divider;
	reg [10:0] tx_clk_divider;
	reg [2:0] recv_state;
	reg [5:0] rx_countdown;
	reg [3:0] rx_bits_remaining;
	reg [7:0] rx_data;
	reg tx_out;
	reg [1:0] tx_state;
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