module origen_001175 #(
    parameter BAUD_RATE = 115200
) (
    input wire clk,
    input wire [7:0] tx_data,
    input wire send,
    output reg uart_tx,
    output reg uart_tx_busy
);

    localparam CLOCK_FREQ = 50_000_000; // Assuming 50MHz clock, adjust as needed
    localparam UART_PERIOD = CLOCK_FREQ / BAUD_RATE;

    reg [9:0] tx_buffer;
    reg [3:0] bit_counter;
    reg [31:0] clock_counter;

    initial begin
        uart_tx = 1'b1;
        uart_tx_busy = 1'b0;
    end

    always @(posedge clk) begin
        if (send && !uart_tx_busy) begin
            task_uart_tx;
        end
        else if (uart_tx_busy) begin
            clock_counter <= clock_counter + 1;
            if (clock_counter >= UART_PERIOD) begin
                clock_counter <= 0;
                if (bit_counter < 10) begin
                    uart_tx <= tx_buffer[bit_counter];
                    bit_counter <= bit_counter + 1;
                end
                else begin
                    uart_tx_busy <= 1'b0;
                    uart_tx <= 1'b1;
                end
            end
        end
    end

    task task_uart_tx;
        begin
            uart_tx_busy <= 1'b1;
            tx_buffer <= {1'b1, tx_data, 1'b0};
            bit_counter <= 0;
            clock_counter <= 0;
            uart_tx <= 1'b0;
        end
    endtask

endmodule