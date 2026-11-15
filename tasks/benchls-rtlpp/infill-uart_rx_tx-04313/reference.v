module rtlpp_04313(
    input clk, 
    input rstn, 
    input rx, 
    output reg tx, 
    input transmit, 
    input [7:0] tx_byte, 
    output reg received, 
    output reg [7:0] rx_byte, 
    output reg is_receiving, 
    output reg is_transmitting, 
    output reg recv_error
);

    parameter CLOCK_DIVIDE = 217;

    localparam [6:0]
        RX_IDLE          = 7'b000_0001,
        RX_CHECK_START   = 7'b000_0010,
        RX_READ_BITS     = 7'b000_0100,
        RX_CHECK_STOP    = 7'b000_1000,
        RX_DELAY_RESTART = 7'b001_0000,
        RX_ERROR         = 7'b010_0000,
        RX_RECEIVED      = 7'b100_0000;

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

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            recv_state <= RX_IDLE;
            tx_state <= TX_IDLE;
            rx_clk_divider <= CLOCK_DIVIDE;
            tx_clk_divider <= CLOCK_DIVIDE;
            tx_out <= 1'b1;
            received <= 1'b0;
            recv_error <= 1'b0;
            is_receiving <= 1'b0;
            is_transmitting <= 1'b0;
        end else begin
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

            case (recv_state)
                RX_IDLE: begin
                    received <= 1'b0;
                    recv_error <= 1'b0;
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
                        recv_state <= rx_bits_remaining ? RX_READ_BITS : RX_CHECK_STOP;
                    end
                end
                RX_CHECK_STOP: begin
                    if (rx_countdown == 0) begin
                        if (rx) begin
                            recv_state <= RX_RECEIVED;
                            received <= 1'b1;
                            rx_byte <= rx_data;
                        end else begin
                            recv_state <= RX_ERROR;
                        end
                    end
                end
                RX_DELAY_RESTART: begin
                    if (rx_countdown == 0) begin
                        recv_state <= RX_IDLE;
                    end
                end
                RX_ERROR: begin
                    recv_error <= 1'b1;
                    rx_countdown <= 8;
                    recv_state <= RX_DELAY_RESTART;
                end
                RX_RECEIVED: begin
                    recv_state <= RX_IDLE;
                end
            endcase

            case (tx_state)
                TX_IDLE: begin
                    is_transmitting <= 1'b0;
                    if (transmit) begin
                        tx_data <= tx_byte;
                        tx_clk_divider <= CLOCK_DIVIDE;
                        tx_countdown <= 4;
                        tx_out <= 0;
                        tx_bits_remaining <= 8;
                        tx_state <= TX_SENDING;
                        is_transmitting <= 1'b1;
                    end
                end
                TX_SENDING: begin
                    if (tx_countdown == 0) begin
                        if (tx_bits_remaining) begin
                            tx_bits_remaining <= tx_bits_remaining - 1;
                            tx_out <= tx_data[0];
                            tx_data <= {1'b0, tx_data[7:1]};
                            tx_countdown <= 4;
                            tx_state <= TX_SENDING;
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

    always @(posedge clk) begin
        tx <= tx_out;
        is_receiving <= (recv_state != RX_IDLE);
    end

endmodule