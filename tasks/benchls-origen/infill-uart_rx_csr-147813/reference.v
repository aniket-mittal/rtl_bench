module origen_147813 (
    input wire sys_clk,
    input wire sys_rst,
    input wire [13:0] csr_a,
    input wire csr_we,
    input wire [31:0] csr_di,
    input wire rx,
    output reg rx_irq,
    output reg [31:0] csr_do
);

    // Parameters
    parameter CLOCK_FREQ = 100_000_000; // 100 MHz
    parameter BAUD_RATE = 115200;
    parameter DIVISOR = CLOCK_FREQ / (16 * BAUD_RATE);

    // Internal registers
    reg [15:0] baud_counter;
    reg [15:0] bit_counter;
    reg [7:0] rx_data;
    reg [2:0] rx_sync;
    reg rx_start;
    reg rx_busy;
    reg [31:0] csr;

    // States
    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;

    reg [1:0] state;

    // Generate 16x baud rate enable signal
    wire baud_en = (baud_counter == 0);

    always @(posedge sys_clk or posedge sys_rst) begin
        if (sys_rst) begin
            baud_counter <= DIVISOR - 1;
        end else if (baud_counter == 0) begin
            baud_counter <= DIVISOR - 1;
        end else begin
            baud_counter <= baud_counter - 1;
        end
    end

    // Synchronize rx input
    always @(posedge sys_clk) begin
        rx_sync <= {rx_sync[1:0], rx};
    end

    // UART receiver state machine
    always @(posedge sys_clk or posedge sys_rst) begin
        if (sys_rst) begin
            state <= IDLE;
            rx_start <= 0;
            rx_busy <= 0;
            rx_data <= 8'h00;
            bit_counter <= 0;
            rx_irq <= 0;
        end else begin
            case (state)
                IDLE: begin
                    rx_irq <= 0;
                    if (baud_en && !rx_sync[2]) begin
                        state <= START;
                        rx_start <= 1;
                        rx_busy <= 1;
                        bit_counter <= 0;
                    end
                end

                START: begin
                    if (baud_en) begin
                        if (bit_counter == 7) begin
                            state <= DATA;
                            bit_counter <= 0;
                            rx_data <= 8'h00;
                        end else begin
                            bit_counter <= bit_counter + 1;
                        end
                    end
                end

                DATA: begin
                    if (baud_en) begin
                        if (bit_counter == 15) begin
                            rx_data <= {rx_sync[2], rx_data[7:1]};
                            if (rx_data[0] == 8) begin
                                state <= STOP;
                            end else begin
                                bit_counter <= 0;
                            end
                        end else begin
                            bit_counter <= bit_counter + 1;
                        end
                    end
                end

                STOP: begin
                    if (baud_en) begin
                        if (bit_counter == 15) begin
                            state <= IDLE;
                            rx_busy <= 0;
                            rx_irq <= 1;
                        end else begin
                            bit_counter <= bit_counter + 1;
                        end
                    end
                end
            endcase
        end
    end

    // CSR interface
    always @(posedge sys_clk or posedge sys_rst) begin
        if (sys_rst) begin
            csr <= 32'h0000_0000;
            csr_do <= 32'h0000_0000;
        end else begin
            if (csr_we && csr_a == 14'h0000) begin
                csr <= csr_di;
            end else if (!csr_we && csr_a == 14'h0000) begin
                csr_do <= csr;
            end

            if (rx_irq) begin
                csr[7:0] <= rx_data;
                csr[8] <= 1'b1; // Set received data flag
            end
        end
    end

endmodule