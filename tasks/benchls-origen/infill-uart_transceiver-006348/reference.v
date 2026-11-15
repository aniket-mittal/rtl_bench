module origen_006348 (
    input wire SCLK,
    input wire RESET,
    input wire RX,
    input wire TX_VALID,
    input wire [7:0] TX_DATA_IN,
    output reg RX_VALID,
    output reg RX_PARITY,
    output reg [7:0] RX_DATA_OUT,
    output reg TX,
    output reg TX_READY
);

    // Parameters
    parameter CLOCK_RATE = 50000000;  // 50 MHz system clock
    parameter BAUD_RATE = 115200;     // 115200 bps
    parameter PARITY_ENABLED = 1;     // 1 for enabled, 0 for disabled
    parameter PARITY_ODD = 1;         // 1 for odd parity, 0 for even parity

    // Constants
    localparam UART_CLK_DIVIDER = CLOCK_RATE / (BAUD_RATE * 8) - 1;
    localparam RX_IDLE = 2'b00, RX_START = 2'b01, RX_DATA = 2'b10, RX_STOP = 2'b11;
    localparam TX_IDLE = 2'b00, TX_START = 2'b01, TX_DATA = 2'b10, TX_STOP = 2'b11;

    // Internal signals
    reg [15:0] clk_count;
    reg uart_clk;
    reg [1:0] rx_state, tx_state;
    reg [3:0] read_count, write_count;
    reg [2:0] read_phase, write_tick;
    reg [7:0] read_buffer, write_buffer;
    reg read_parity, write_parity;

    // Clock generation
    always @(posedge SCLK or posedge RESET) begin
        if (RESET) begin
            clk_count <= 0;
            uart_clk <= 0;
        end else if (clk_count == UART_CLK_DIVIDER) begin
            clk_count <= 0;
            uart_clk <= ~uart_clk;
        end else begin
            clk_count <= clk_count + 1;
        end
    end

    // Receiver logic
    always @(posedge uart_clk or posedge RESET) begin
        if (RESET) begin
            rx_state <= RX_IDLE;
            read_count <= 0;
            read_phase <= 0;
            read_buffer <= 0;
            read_parity <= PARITY_ODD;
            RX_VALID <= 0;
            RX_PARITY <= 0;
            RX_DATA_OUT <= 0;
        end else begin
            case (rx_state)
                RX_IDLE: begin
                    if (!RX) begin
                        rx_state <= RX_START;
                        read_phase <= 0;
                    end
                    RX_VALID <= 0;
                end
                RX_START: begin
                    if (read_phase == 7) begin
                        rx_state <= RX_DATA;
                        read_count <= 0;
                        read_phase <= 0;
                        read_parity <= PARITY_ODD;
                    end else begin
                        read_phase <= read_phase + 1;
                    end
                end
                RX_DATA: begin
                    if (read_phase == 7) begin
                        read_buffer[read_count] <= RX;
                        read_parity <= read_parity ^ RX;
                        if (read_count == 7) begin
                            rx_state <= PARITY_ENABLED ? RX_STOP : RX_IDLE;
                            RX_DATA_OUT <= {RX, read_buffer[6:0]};
                        end else begin
                            read_count <= read_count + 1;
                        end
                        read_phase <= 0;
                    end else begin
                        read_phase <= read_phase + 1;
                    end
                end
                RX_STOP: begin
                    if (read_phase == 7) begin
                        rx_state <= RX_IDLE;
                        RX_VALID <= 1;
                        RX_PARITY <= read_parity;
                    end else begin
                        read_phase <= read_phase + 1;
                    end
                end
            endcase
        end
    end

    // Transmitter logic
    always @(posedge uart_clk or posedge RESET) begin
        if (RESET) begin
            tx_state <= TX_IDLE;
            write_count <= 0;
            write_tick <= 0;
            write_buffer <= 0;
            write_parity <= PARITY_ODD;
            TX <= 1;
            TX_READY <= 1;
        end else begin
            case (tx_state)
                TX_IDLE: begin
                    if (TX_VALID) begin
                        tx_state <= TX_START;
                        write_buffer <= TX_DATA_IN;
                        write_parity <= PARITY_ODD;
                        TX_READY <= 0;
                    end
                end
                TX_START: begin
                    if (write_tick == 7) begin
                        TX <= 0;
                        tx_state <= TX_DATA;
                        write_count <= 0;
                        write_tick <= 0;
                    end else begin
                        write_tick <= write_tick + 1;
                    end
                end
                TX_DATA: begin
                    if (write_tick == 7) begin
                        TX <= write_buffer[write_count];
                        write_parity <= write_parity ^ write_buffer[write_count];
                        if (write_count == 7) begin
                            tx_state <= PARITY_ENABLED ? TX_STOP : TX_IDLE;
                            TX_READY <= 1;
                        end else begin
                            write_count <= write_count + 1;
                        end
                        write_tick <= 0;
                    end else begin
                        write_tick <= write_tick + 1;
                    end
                end
                TX_STOP: begin
                    if (write_tick == 7) begin
                        TX <= PARITY_ENABLED ? write_parity : 1;
                        tx_state <= TX_IDLE;
                        write_tick <= 0;
                    end else begin
                        write_tick <= write_tick + 1;
                    end
                end
            endcase
        end
    end

endmodule