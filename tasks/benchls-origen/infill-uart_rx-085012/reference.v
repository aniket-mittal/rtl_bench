module origen_085012 #(
    parameter DATA_WIDTH = 16
) (
    input wire i_clk,
    input wire i_reset,
    input wire i_uart_rx,
    input wire [15:0] i_baudrate_prescaler,
    output wire [DATA_WIDTH-1:0] o_data,
    output wire o_data_stb
);

    // State definitions
    localparam s_IDLE = 2'b00;
    localparam s_RECEIVE = 2'b01;
    localparam s_STOP = 2'b10;

    // Registers
    reg [2:0] r_rx_sync;
    reg [15:0] r_baud_counter;
    reg r_baud_clock;
    reg [1:0] r_state;
    reg [DATA_WIDTH-1:0] r_data;
    reg [$clog2(DATA_WIDTH):0] r_rx_bit_count;
    reg r_data_valid;

    // Input synchronization
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset)
            r_rx_sync <= 3'b111;
        else
            r_rx_sync <= {r_rx_sync[1:0], i_uart_rx};
    end

    // Baud rate generation
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_baud_counter <= 16'd0;
            r_baud_clock <= 1'b0;
        end else begin
            if (r_state == s_IDLE) begin
                if (r_baud_counter >= {1'b0, i_baudrate_prescaler[15:1]} + i_baudrate_prescaler) begin
                    r_baud_counter <= 16'd0;
                    r_baud_clock <= 1'b1;
                end else begin
                    r_baud_counter <= r_baud_counter + 1'b1;
                    r_baud_clock <= 1'b0;
                end
            end else begin
                if (r_baud_counter >= i_baudrate_prescaler) begin
                    r_baud_counter <= 16'd0;
                    r_baud_clock <= 1'b1;
                end else begin
                    r_baud_counter <= r_baud_counter + 1'b1;
                    r_baud_clock <= 1'b0;
                end
            end
        end
    end

    // State machine and data reception
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_state <= s_IDLE;
            r_data <= {DATA_WIDTH{1'b0}};
            r_rx_bit_count <= 0;
            r_data_valid <= 1'b0;
        end else begin
            case (r_state)
                s_IDLE: begin
                    r_data_valid <= 1'b0;
                    if (r_rx_sync[2] == 1'b0 && r_baud_clock) begin
                        r_state <= s_RECEIVE;
                        r_rx_bit_count <= 0;
                    end
                end

                s_RECEIVE: begin
                    if (r_baud_clock) begin
                        r_data <= {r_rx_sync[2], r_data[DATA_WIDTH-1:1]};
                        r_rx_bit_count <= r_rx_bit_count + 1'b1;
                        if (r_rx_bit_count == DATA_WIDTH - 1) begin
                            r_state <= s_STOP;
                        end
                    end
                end

                s_STOP: begin
                    if (r_baud_clock) begin
                        if (r_rx_sync[2] == 1'b1) begin
                            r_data_valid <= 1'b1;
                        end
                        r_state <= s_IDLE;
                    end
                end

                default: r_state <= s_IDLE;
            endcase
        end
    end

    // Output assignments
    assign o_data = r_data;
    assign o_data_stb = r_data_valid;

endmodule