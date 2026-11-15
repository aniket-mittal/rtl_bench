module origen_141450 (
    // Transmitter inputs
    input [15:0] tx_data,
    input tx_enable,
    input tx_clk,
    
    // Transmitter outputs
    output reg tx_out,
    output reg tx_busy,
    
    // Receiver inputs
    input rx_data,
    input rx_enable,
    input rx_clk,
    
    // Receiver outputs
    output reg [15:0] rx_out,
    output reg rx_busy
);

// Constants
localparam PREAMBLE = 8'b10101010;
localparam START_DELIMITER = 8'b11100101;
localparam CRC_POLY = 16'b1000000000000101;

// Transmitter states
localparam TX_IDLE = 2'b00;
localparam TX_PREAMBLE = 2'b01;
localparam TX_START_DELIMITER = 2'b10;
localparam TX_DATA = 2'b11;

// Receiver states
localparam RX_IDLE = 2'b00;
localparam RX_PREAMBLE = 2'b01;
localparam RX_START_DELIMITER = 2'b10;
localparam RX_DATA = 2'b11;

// Transmitter registers
reg [1:0] tx_state;
reg [7:0] tx_preamble_cnt;
reg [7:0] tx_start_delimiter_cnt;
reg [15:0] tx_data_reg;
reg [15:0] tx_crc;
reg [3:0] tx_bit_cnt;

// Receiver registers
reg [1:0] rx_state;
reg [7:0] rx_preamble_cnt;
reg [7:0] rx_start_delimiter_cnt;
reg [15:0] rx_data_reg;
reg [15:0] rx_crc;
reg [3:0] rx_bit_cnt;

// Transmitter logic
always @(posedge tx_clk) begin
    if (!tx_enable) begin
        tx_state <= TX_IDLE;
        tx_busy <= 0;
        tx_out <= 0;
    end else begin
        case (tx_state)
            TX_IDLE: begin
                if (tx_enable) begin
                    tx_state <= TX_PREAMBLE;
                    tx_preamble_cnt <= 0;
                    tx_busy <= 1;
                end
            end
            TX_PREAMBLE: begin
                tx_out <= PREAMBLE[tx_preamble_cnt];
                if (tx_preamble_cnt == 7) begin
                    tx_state <= TX_START_DELIMITER;
                    tx_start_delimiter_cnt <= 0;
                end else begin
                    tx_preamble_cnt <= tx_preamble_cnt + 1;
                end
            end
            TX_START_DELIMITER: begin
                tx_out <= START_DELIMITER[tx_start_delimiter_cnt];
                if (tx_start_delimiter_cnt == 7) begin
                    tx_state <= TX_DATA;
                    tx_data_reg <= tx_data;
                    tx_crc <= 16'hFFFF;
                    tx_bit_cnt <= 0;
                end else begin
                    tx_start_delimiter_cnt <= tx_start_delimiter_cnt + 1;
                end
            end
            TX_DATA: begin
                tx_out <= tx_data_reg[15];
                tx_crc <= {tx_crc[14:0], tx_crc[15] ^ tx_data_reg[15]};
                tx_data_reg <= {tx_data_reg[14:0], 1'b0};
                if (tx_bit_cnt == 15) begin
                    tx_state <= TX_IDLE;
                    tx_busy <= 0;
                end else begin
                    tx_bit_cnt <= tx_bit_cnt + 1;
                end
            end
        endcase
    end
end

// Receiver logic
always @(posedge rx_clk) begin
    if (!rx_enable) begin
        rx_state <= RX_IDLE;
        rx_busy <= 0;
        rx_out <= 16'h0000;
    end else begin
        case (rx_state)
            RX_IDLE: begin
                if (rx_enable) begin
                    rx_state <= RX_PREAMBLE;
                    rx_preamble_cnt <= 0;
                    rx_busy <= 1;
                end
            end
            RX_PREAMBLE: begin
                if (rx_data == PREAMBLE[rx_preamble_cnt]) begin
                    if (rx_preamble_cnt == 7) begin
                        rx_state <= RX_START_DELIMITER;
                        rx_start_delimiter_cnt <= 0;
                    end else begin
                        rx_preamble_cnt <= rx_preamble_cnt + 1;
                    end
                end else begin
                    rx_state <= RX_IDLE;
                    rx_busy <= 0;
                end
            end
            RX_START_DELIMITER: begin
                if (rx_data == START_DELIMITER[rx_start_delimiter_cnt]) begin
                    if (rx_start_delimiter_cnt == 7) begin
                        rx_state <= RX_DATA;
                        rx_data_reg <= 16'h0000;
                        rx_crc <= 16'hFFFF;
                        rx_bit_cnt <= 0;
                    end else begin
                        rx_start_delimiter_cnt <= rx_start_delimiter_cnt + 1;
                    end
                end else begin
                    rx_state <= RX_IDLE;
                    rx_busy <= 0;
                end
            end
            RX_DATA: begin
                rx_data_reg <= {rx_data_reg[14:0], rx_data};
                rx_crc <= {rx_crc[14:0], rx_crc[15] ^ rx_data};
                if (rx_bit_cnt == 15) begin
                    rx_state <= RX_IDLE;
                    rx_busy <= 0;
                    if (rx_crc == 16'h0000) begin
                        rx_out <= rx_data_reg;
                    end else begin
                        rx_out <= 16'h0000; // CRC error
                    end
                end else begin
                    rx_bit_cnt <= rx_bit_cnt + 1;
                end
            end
        endcase
    end
end

endmodule