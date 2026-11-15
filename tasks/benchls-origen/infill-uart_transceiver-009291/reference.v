module origen_009291(
    input wire SCLK,
    input wire RESET,
    input wire RX,
    output reg RX_VALID,
    output reg [7:0] RX_DATA,
    output reg TX,
    input wire TX_VALID,
    input wire [7:0] TX_DATA,
    output reg TX_READY
);

    // Configuration
    parameter CLOCK_DIVIDER = 868;
    parameter UART_CLK_DIVIDER = 434;
    wire even_parity = 1'b1;

    // Clock generation
    reg [9:0] clk_counter;
    reg uart_clk;

    always @(posedge SCLK or posedge RESET) begin
        if (RESET) begin
            clk_counter <= 0;
            uart_clk <= 0;
        end else begin
            if (clk_counter == UART_CLK_DIVIDER - 1) begin
                clk_counter <= 0;
                uart_clk <= ~uart_clk;
            end else begin
                clk_counter <= clk_counter + 1;
            end
        end
    end

    // Receiver
    reg [3:0] rx_state;
    reg [3:0] rx_bit_count;
    reg [7:0] rx_shift_reg;
    reg rx_parity;

    always @(posedge uart_clk or posedge RESET) begin
        if (RESET) begin
            rx_state <= 4'd0;
            rx_bit_count <= 4'd0;
            rx_shift_reg <= 8'd0;
            rx_parity <= 1'b0;
            RX_VALID <= 1'b0;
            RX_DATA <= 8'd0;
        end else begin
            case (rx_state)
                4'd0: begin // Idle
                    RX_VALID <= 1'b0;
                    if (!RX) rx_state <= 4'd1; // Start bit detected
                end
                4'd1: begin // Start bit
                    rx_state <= 4'd2;
                    rx_bit_count <= 4'd0;
                    rx_parity <= 1'b0;
                end
                4'd2: begin // Data bits
                    rx_shift_reg <= {RX, rx_shift_reg[7:1]};
                    rx_parity <= rx_parity ^ RX;
                    rx_bit_count <= rx_bit_count + 1;
                    if (rx_bit_count == 4'd7) rx_state <= 4'd3;
                end
                4'd3: begin // Parity bit
                    if (even_parity ? (rx_parity == RX) : (rx_parity != RX)) begin
                        rx_state <= 4'd4;
                    end else begin
                        rx_state <= 4'd0; // Parity error
                    end
                end
                4'd4: begin // Stop bit
                    if (RX) begin
                        RX_VALID <= 1'b1;
                        RX_DATA <= rx_shift_reg;
                    end
                    rx_state <= 4'd0;
                end
                default: rx_state <= 4'd0;
            endcase
        end
    end

    // Transmitter
    reg [3:0] tx_state;
    reg [3:0] tx_bit_count;
    reg [7:0] tx_shift_reg;
    reg tx_parity;

    always @(posedge uart_clk or posedge RESET) begin
        if (RESET) begin
            tx_state <= 4'd0;
            tx_bit_count <= 4'd0;
            tx_shift_reg <= 8'd0;
            tx_parity <= 1'b0;
            TX <= 1'b1;
            TX_READY <= 1'b1;
        end else begin
            case (tx_state)
                4'd0: begin // Idle
                    TX <= 1'b1;
                    TX_READY <= 1'b1;
                    if (TX_VALID) begin
                        tx_shift_reg <= TX_DATA;
                        tx_state <= 4'd1;
                        TX_READY <= 1'b0;
                    end
                end
                4'd1: begin // Start bit
                    TX <= 1'b0;
                    tx_state <= 4'd2;
                    tx_bit_count <= 4'd0;
                    tx_parity <= 1'b0;
                end
                4'd2: begin // Data bits
                    TX <= tx_shift_reg[0];
                    tx_shift_reg <= {1'b0, tx_shift_reg[7:1]};
                    tx_parity <= tx_parity ^ tx_shift_reg[0];
                    tx_bit_count <= tx_bit_count + 1;
                    if (tx_bit_count == 4'd7) tx_state <= 4'd3;
                end
                4'd3: begin // Parity bit
                    TX <= even_parity ? tx_parity : ~tx_parity;
                    tx_state <= 4'd4;
                end
                4'd4: begin // Stop bit
                    TX <= 1'b1;
                    tx_state <= 4'd0;
                end
                default: tx_state <= 4'd0;
            endcase
        end
    end

endmodule