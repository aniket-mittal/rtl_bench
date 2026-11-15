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

always @ (posedge clk) begin
    if (rst) begin
        recv_state <= RX_IDLE;
        tx_state <= TX_IDLE;
        clk_divider <= CLOCK_DIVIDE;
    end else begin
        clk_divider <= clk_divider - 1;
        if (clk_divider == 0) begin
            clk_divider <= CLOCK_DIVIDE;
            if (rx_countdown != 0) 
                rx_countdown <= rx_countdown - 1;
            if (tx_countdown != 0) 
                tx_countdown <= tx_countdown - 1;
        end

        case (recv_state)
            RX_IDLE: begin
                if (!rx) begin
                    rx_countdown <= 8;
                    recv_state <= RX_CHECK_START;
                end
            end
            RX_CHECK_START: begin
                if (rx_countdown == 0) begin
                    if (!rx) begin
                        rx_countdown <= 16;
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
                    rx_countdown <= 16;
                    rx_bits_remaining <= rx_bits_remaining - 1;
                    recv_state <= (rx_bits_remaining != 0) ? RX_READ_BITS : RX_CHECK_STOP;
                end
            end
            RX_CHECK_STOP: begin
                if (rx_countdown == 0) begin
                    recv_state <= (rx) ? RX_RECEIVED : RX_ERROR;
                end
            end
            RX_DELAY_RESTART: begin
                recv_state <= (rx_countdown != 0) ? RX_DELAY_RESTART : RX_IDLE;
            end
            RX_ERROR: begin
                rx_countdown <= 32;
                recv_state <= RX_DELAY_RESTART;
            end
            RX_RECEIVED: begin
                rx_countdown <= 4;
                recv_state <= RX_DELAY_RESTART;
            end
        endcase

        case (tx_state)
            TX_IDLE: begin
                if (transmit) begin
                    tx_data <= tx_byte;
                    tx_countdown <= 16;
                    tx_out <= 1'b0;
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
                        tx_countdown <= 16;
                        tx_state <= TX_SENDING;
                    end else begin
                        tx_out <= 1'b1;
                        tx_countdown <= 32;
                        tx_state <= TX_DELAY_RESTART;
                    end
                end
            end
            TX_DELAY_RESTART: begin
                tx_state <= (tx_countdown != 0) ? TX_DELAY_RESTART : TX_IDLE;
            end
        endcase
    end
end

endmodule