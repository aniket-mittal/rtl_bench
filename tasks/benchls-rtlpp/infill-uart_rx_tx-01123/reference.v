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

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        recv_state <= RX_IDLE;
        tx_state <= TX_IDLE;
        rx_clk_divider <= CLOCK_DIVIDE;
        tx_clk_divider <= CLOCK_DIVIDE;
        rx_countdown <= 0;
        rx_bits_remaining <= 0;
        rx_data <= 0;
        tx_out <= 1'b1;
        tx_countdown <= 0;
        tx_bits_remaining <= 0;
        tx_data <= 0;
    end else begin
        // RX clock divider handling
        if (rx_clk_divider == 0) begin
            rx_clk_divider <= CLOCK_DIVIDE;
            if (rx_countdown != 0) rx_countdown <= rx_countdown - 1;
        end else begin
            rx_clk_divider <= rx_clk_divider - 1;
        end
        
        // TX clock divider handling
        if (tx_clk_divider == 0) begin
            tx_clk_divider <= CLOCK_DIVIDE;
            if (tx_countdown != 0) tx_countdown <= tx_countdown - 1;
        end else begin
            tx_clk_divider <= tx_clk_divider - 1;
        end

        // RX state machine
        case (recv_state)
            RX_IDLE: begin
                if (!rx) begin
                    rx_clk_divider <= CLOCK_DIVIDE;
                    rx_countdown <= 2;
                    recv_state <= RX_CHECK_START;
                end
            end
            RX_CHECK_START: begin
                if (rx_countdown == 0) begin
                    if (!rx) begin
                        rx_countdown <= 4;
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
                    rx_countdown <= 4;
                    rx_bits_remaining <= rx_bits_remaining - 1;
                    recv_state <= (rx_bits_remaining != 0) ? RX_READ_BITS : RX_CHECK_STOP;
                end
            end
            RX_CHECK_STOP: begin
                if (rx_countdown == 0) begin
                    recv_state <= rx ? RX_RECEIVED : RX_ERROR;
                end
            end
            RX_DELAY_RESTART: begin
                if (rx_countdown == 0) begin
                    recv_state <= RX_IDLE;
                end
            end
            RX_ERROR: begin
                rx_countdown <= 8;
                recv_state <= RX_DELAY_RESTART;
            end
            RX_RECEIVED: begin
                recv_state <= RX_IDLE;
            end
        endcase

        // TX state machine
        case (tx_state)
            TX_IDLE: begin
                if (transmit) begin
                    tx_data <= tx_byte;
                    tx_clk_divider <= CLOCK_DIVIDE;
                    tx_countdown <= 4;
                    tx_out <= 0;
                    tx_bits_remaining <= 8;
                    tx_state <= TX_SENDING;
                end
            end
            TX_SENDING: begin
                if (tx_countdown == 0) begin
                    if (tx_bits_remaining != 0) begin
                        tx_bits_remaining <= tx_bits_remaining - 1;
                        tx_out <= tx_data[0];
                        tx_data <= {1'b0, tx_data[7:1]};
                        tx_countdown <= 4;
                    end else begin
                        tx_out <= 1;
                        tx_countdown <= 8;
                        tx_state <= TX_DELAY_RESTART;
                    end
                end
            end
            TX_DELAY_RESTART: begin
                if (tx_countdown == 0) begin
                    tx_state <= TX_IDLE;
                end
            end
        endcase
    end
end

endmodule