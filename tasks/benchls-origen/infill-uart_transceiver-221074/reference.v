module origen_221074 #(
    parameter FREQ_HZ = 50000000,
    parameter BAUD = 115200
) (
    input  wire        reset,
    input  wire        clk,
    input  wire        uart_rxd,
    output reg         uart_txd,
    output reg [7:0]   rx_data,
    output reg         rx_avail,
    output reg         rx_error,
    input  wire        rx_ack,
    output reg         rx_busy,
    input  wire [7:0]  tx_data,
    input  wire        tx_wr,
    output reg         tx_busy
);

localparam BAUD_RATE = FREQ_HZ / BAUD;
localparam SAMPLE_RATE = 16;

reg [15:0] rx_clk_cnt;
reg [3:0] rx_bit_cnt;
reg [7:0] rxd_reg;
reg rx_start;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        rx_clk_cnt <= 0;
        rx_bit_cnt <= 0;
        rxd_reg <= 0;
        rx_start <= 0;
        rx_busy <= 0;
        rx_avail <= 0;
        rx_error <= 0;
    end else begin
        if (rx_clk_cnt == BAUD_RATE / SAMPLE_RATE - 1) begin
            rx_clk_cnt <= 0;
            if (rx_bit_cnt == 0 && !uart_rxd) begin
                rx_start <= 1;
            end else if (rx_start) begin
                rxd_reg <= {uart_rxd, rxd_reg[7:1]};
                rx_bit_cnt <= rx_bit_cnt + 1;
                if (rx_bit_cnt == 8) begin
                    if (uart_rxd) begin
                        rx_data <= rxd_reg;
                        rx_avail <= 1;
                    end else begin
                        rx_error <= 1;
                    end
                    rx_start <= 0;
                    rx_busy <= 0;
                end else begin
                    rx_busy <= 1;
                end
            end
        end else begin
            rx_clk_cnt <= rx_clk_cnt + 1;
        end
        if (rx_ack) begin
            rx_avail <= 0;
            rx_error <= 0;
        end
    end
end

reg [15:0] tx_clk_cnt;
reg [3:0] tx_bit_cnt;
reg [8:0] txd_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx_clk_cnt <= 0;
        tx_bit_cnt <= 0;
        txd_reg <= 0;
        tx_busy <= 0;
    end else begin
        if (tx_wr) begin
            txd_reg <= {1'b0, tx_data, 1'b1};
            tx_bit_cnt <= 0;
            tx_busy <= 1;
        end else if (tx_busy) begin
            if (tx_clk_cnt == BAUD_RATE - 1) begin
                tx_clk_cnt <= 0;
                txd_reg <= {1'b1, txd_reg[8:1]};
                tx_bit_cnt <= tx_bit_cnt + 1;
                if (tx_bit_cnt == 9) begin
                    tx_busy <= 0;
                end
            end else begin
                tx_clk_cnt <= tx_clk_cnt + 1;
            end
        end else begin
            tx_clk_cnt <= 0;
            tx_bit_cnt <= 0;
        end
    end
end

// Continuous assignment for uart_txd
assign uart_txd = tx_busy ? txd_reg[0] : 1'b1;

endmodule