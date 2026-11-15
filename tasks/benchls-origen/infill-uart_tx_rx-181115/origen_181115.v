module origen_181115 #(
    parameter CLK_FREQ = 50000000,
    parameter BAUD = 115200,
    parameter CLK_MUL = CLK_FREQ / BAUD,
    parameter CLK_MUL_WIDTH = $clog2(CLK_MUL)
) (
    input  wire        clk,
    input  wire        rst,

    // Transmitter (TX) Interface
    input  wire [7:0]  dat_t,
    input  wire        txe,
    output reg         tx,

    // Receiver (RX) Interface
    input  wire        rx,
    output reg [7:0]   dat_r,
    output reg         ready,
    input  wire        ready_rst
);

    // Transmitter (TX) Section
    reg [3:0] tx_state;
    reg [3:0] tx_count;
    reg [7:0] tx_data;

    [MASKED]

    // Receiver (RX) Section
    reg [3:0] rx_state;
    reg [3:0] rx_count;
    reg [7:0] rx_data;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rx_state <= 0;
            rx_count <= 0;
            dat_r <= 0;
            ready <= 0;
        end else begin
            case (rx_state)
                0: begin
                    if (~rx) begin
                        rx_state <= 1;
                        rx_count <= 0;
                    end else begin
                        ready <= 0;
                    end
                end
                1: begin
                    if (rx_count == 7) begin
                        rx_data[0] <= rx;
                        rx_count <= 0;
                        rx_state <= 2;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                2: begin
                    if (rx_count == 15) begin
                        rx_data[1] <= rx;
                        rx_count <= 0;
                        rx_state <= 3;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                3: begin
                    if (rx_count == 15) begin
                        rx_data[2] <= rx;
                        rx_count <= 0;
                        rx_state <= 4;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                4: begin
                    if (rx_count == 15) begin
                        rx_data[3] <= rx;
                        rx_count <= 0;
                        rx_state <= 5;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                5: begin
                    if (rx_count == 15) begin
                        rx_data[4] <= rx;
                        rx_count <= 0;
                        rx_state <= 6;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                6: begin
                    if (rx_count == 15) begin
                        rx_data[5] <= rx;
                        rx_count <= 0;
                        rx_state <= 7;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                7: begin
                    if (rx_count == 15) begin
                        rx_data[6] <= rx;
                        rx_count <= 0;
                        rx_state <= 8;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                8: begin
                    if (rx_count == 15) begin
                        rx_data[7] <= rx;
                        dat_r <= rx_data;
                        ready <= 1;
                        rx_state <= 0;
                    end else begin
                        rx_count <= rx_count + 1;
                    end
                end
                default: rx_state <= 0;
            endcase

            if (ready_rst) begin
                ready <= 0;
            end
        end
    end

endmodule