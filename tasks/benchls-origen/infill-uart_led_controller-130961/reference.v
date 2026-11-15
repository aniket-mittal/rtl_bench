module origen_130961 (
    input wire clk,
    input wire rst,
    input wire btnu, btnl, btnd, btnr, btnc,
    input wire [7:0] sw,
    input wire uart_rxd,
    input wire uart_cts,
    output wire uart_txd,
    output reg [7:0] led,
    output reg uart_rts
);

// UART parameters
parameter CLOCK_RATE = 125_000_000;
parameter BAUD_RATE = 9600;
parameter UART_OVERSAMPLE = 16;

// UART signals
wire [7:0] uart_rx_data;
wire uart_rx_valid;
reg uart_rx_ready;
reg [7:0] uart_tx_data;
reg uart_tx_valid;
wire uart_tx_ready;

// UART instance
uart #(
    .CLOCK_RATE(CLOCK_RATE),
    .BAUD_RATE(BAUD_RATE)
) uart_inst (
    .clk(clk),
    .rst(rst),
    .rx(uart_rxd),
    .tx(uart_txd),
    .tx_data(uart_tx_data),
    .tx_valid(uart_tx_valid),
    .tx_ready(uart_tx_ready),
    .rx_data(uart_rx_data),
    .rx_valid(uart_rx_valid),
    .rx_ready(uart_rx_ready)
);

// LED control
always @(posedge clk) begin
    if (rst) begin
        led <= 8'b0;
    end else if (btnc) begin
        led <= sw;
    end
end

// UART RTS control
always @(posedge clk) begin
    if (rst) begin
        uart_rts <= 1'b0;
    end else if (btnu) begin
        uart_rts <= 1'b1;
    end else if (btnd) begin
        uart_rts <= 1'b0;
    end
end

// UART transmit logic
reg [7:0] tx_data;
reg tx_valid;

always @(posedge clk) begin
    if (rst) begin
        tx_data <= 8'b0;
        tx_valid <= 1'b0;
    end else if (btnr && !tx_valid && uart_tx_ready) begin
        tx_data <= sw;
        tx_valid <= 1'b1;
    end else if (uart_tx_ready && tx_valid) begin
        tx_valid <= 1'b0;
    end
end

always @(posedge clk) begin
    uart_tx_data <= tx_data;
    uart_tx_valid <= tx_valid;
end

// UART receive logic
always @(posedge clk) begin
    if (rst) begin
        uart_rx_ready <= 1'b1;
    end else begin
        uart_rx_ready <= 1'b1; // Always ready to receive data
    end
end

endmodule

module uart #(
    parameter CLOCK_RATE = 125_000_000,
    parameter BAUD_RATE = 9600
) (
    input wire clk,
    input wire rst,
    input wire rx,
    output reg tx,
    input wire [7:0] tx_data,
    input wire tx_valid,
    output reg tx_ready,
    output reg [7:0] rx_data,
    output reg rx_valid,
    input wire rx_ready
);

// UART logic implementation goes here
// This is a placeholder and should be replaced with actual UART logic

endmodule