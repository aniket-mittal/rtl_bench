module origen_128646 (
    input wire clock,
    input wire reset,
    input wire s_tick,
    input wire tx_start,
    input wire [7:0] data_in,
    output reg tx,
    output reg tx_done,
    output reg baud_rate_clock
);

    // Parameters
    parameter CLOCK_FREQ = 50_000_000;
    parameter BAUD_RATE = 9600;
    parameter TICKS_PER_BIT = CLOCK_FREQ / (BAUD_RATE * 16);
    parameter DATA_BITS = 8;
    parameter TOTAL_BITS = 10; // Start bit + 8 data bits + Stop bit

    // State machine states
    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;

    // Registers
    reg [1:0] state;
    reg [3:0] tick_counter;
    reg [3:0] bit_counter;
    reg [7:0] shift_reg;

    // Baud rate generator
    reg [15:0] baud_counter;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            baud_counter <= 0;
            baud_rate_clock <= 0;
        end else if (s_tick) begin
            if (baud_counter == TICKS_PER_BIT - 1) begin
                baud_counter <= 0;
                baud_rate_clock <= ~baud_rate_clock;
            end else begin
                baud_counter <= baud_counter + 1;
            end
        end
    end

    // UART transmitter state machine
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            tx <= 1'b1;
            tx_done <= 1'b0;
            tick_counter <= 0;
            bit_counter <= 0;
            shift_reg <= 8'b0;
        end else if (baud_rate_clock) begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    tx_done <= 1'b0;
                    if (tx_start) begin
                        state <= START;
                        shift_reg <= data_in;
                        tick_counter <= 0;
                    end
                end

                START: begin
                    tx <= 1'b0;
                    if (tick_counter == 15) begin
                        state <= DATA;
                        tick_counter <= 0;
                        bit_counter <= 0;
                    end else begin
                        tick_counter <= tick_counter + 1;
                    end
                end

                DATA: begin
                    tx <= shift_reg[0];
                    if (tick_counter == 15) begin
                        tick_counter <= 0;
                        if (bit_counter == DATA_BITS - 1) begin
                            state <= STOP;
                        end else begin
                            bit_counter <= bit_counter + 1;
                            shift_reg <= {1'b0, shift_reg[7:1]};
                        end
                    end else begin
                        tick_counter <= tick_counter + 1;
                    end
                end

                STOP: begin
                    tx <= 1'b1;
                    if (tick_counter == 15) begin
                        state <= IDLE;
                        tx_done <= 1'b1;
                    end else begin
                        tick_counter <= tick_counter + 1;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule