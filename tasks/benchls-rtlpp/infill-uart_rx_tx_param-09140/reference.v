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

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			rx_clk_divider <= CLOCK_DIVIDE;
			tx_clk_divider <= CLOCK_DIVIDE;
			recv_state <= RX_IDLE;
			tx_state <= TX_IDLE;
			tx_out <= 1'b1;
		end else begin
			// Clock divider logic for RX and TX
			rx_clk_divider <= rx_clk_divider - 1;
			if (rx_clk_divider == 0) begin
				rx_clk_divider <= CLOCK_DIVIDE;
				rx_countdown <= rx_countdown - 1;
			end
			tx_clk_divider <= tx_clk_divider - 1;
			if (tx_clk_divider == 0) begin
				tx_clk_divider <= CLOCK_DIVIDE;
				tx_countdown <= tx_countdown - 1;
			end

			// RX State Machine
			case (recv_state)
				RX_IDLE: begin
					if (!rx) begin
						rx_clk_divider <= CLOCK_DIVIDE;
						rx_countdown <= 1;
						recv_state <= RX_CHECK_START;
					end
				end
				RX_CHECK_START: begin
					if (rx_countdown == 0) begin
						if (!rx) begin
							rx_countdown <= 2;
							rx_bits_remaining <= 8;
							recv_state <= RX_READ_BITS;
						end else begin
							recv_state <= RX_ERROR;
						end
					end
				end
				RX_READ_BITS: begin
					if (rx_countdown == 0) begin
						rx_data <= {rx, rx_data[7:1]};
						rx_countdown <= 2;
						rx_bits_remaining <= rx_bits_remaining - 1;
						recv_state <= (rx_bits_remaining == 0) ? RX_CHECK_STOP : RX_READ_BITS;
					end
				end
				RX_CHECK_STOP: begin
					if (rx_countdown == 0) begin
						recv_state <= rx ? RX_RECEIVED : RX_ERROR;
					end
				end
				RX_DELAY_RESTART: begin
					recv_state <= rx_countdown ? RX_DELAY_RESTART : RX_IDLE;
				end
				RX_ERROR: begin
					rx_countdown <= 4;
					recv_state <= RX_DELAY_RESTART;
				end
				RX_RECEIVED: begin
					recv_state <= RX_IDLE;
				end
			endcase

			// TX State Machine
			case (tx_state)
				TX_IDLE: begin
					if (transmit) begin
						tx_data <= tx_byte;
						tx_clk_divider <= CLOCK_DIVIDE;
						tx_countdown <= 2;
						tx_out <= 0;
						tx_bits_remaining <= 8;
						tx_state <= TX_SENDING;
					end
				end
				TX_SENDING: begin
					if (tx_countdown == 0) begin
						if (tx_bits_remaining > 0) begin
							tx_bits_remaining <= tx_bits_remaining - 1;
							tx_out <= tx_data[0];
							tx_data <= {1'b0, tx_data[7:1]};
							tx_countdown <= 2;
						end else begin
							tx_out <= 1;
							tx_countdown <= 4;
							tx_state <= TX_DELAY_RESTART;
						end
					end
				end
				TX_DELAY_RESTART: begin
					tx_state <= tx_countdown ? TX_DELAY_RESTART : TX_IDLE;
				end
			endcase
		end
	end
endmodule