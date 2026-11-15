module origen_131507 (
    input wire clk,
    input wire rst_n,
    input wire [15:0] baud_div,
    input wire [7:0] data_in,
    input wire data_valid,
    input wire force_break,
    output reg txd,
    output reg tx_ready,
    output reg shift_empty,
    output reg overrun
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;

    reg [1:0] state, next_state;
    reg [15:0] baud_counter;
    reg [3:0] bit_counter;
    reg [7:0] shift_reg;
    reg baud_tick;

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = (data_valid && !force_break) ? START : IDLE;
            START: next_state = (baud_tick) ? DATA : START;
            DATA: next_state = (baud_tick && bit_counter == 4'd7) ? STOP : DATA;
            STOP: next_state = (baud_tick) ? IDLE : STOP;
            default: next_state = IDLE;
        endcase
    end

    // Baud rate generator
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baud_counter <= 16'd0;
            baud_tick <= 1'b0;
        end else begin
            if (baud_counter == baud_div) begin
                baud_counter <= 16'd0;
                baud_tick <= 1'b1;
            end else begin
                baud_counter <= baud_counter + 1'b1;
                baud_tick <= 1'b0;
            end
        end
    end

    // Bit counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            bit_counter <= 4'd0;
        end else if (state == DATA && baud_tick) begin
            bit_counter <= bit_counter + 1'b1;
        end else if (state == IDLE) begin
            bit_counter <= 4'd0;
        end
    end

    // Shift register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= 8'd0;
        end else if (state == IDLE && data_valid) begin
            shift_reg <= data_in;
        end else if (state == DATA && baud_tick) begin
            shift_reg <= {1'b0, shift_reg[7:1]};
        end
    end

    // TXD output
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            txd <= 1'b1;
        end else if (force_break) begin
            txd <= 1'b0;
        end else begin
            case (state)
                IDLE: txd <= 1'b1;
                START: txd <= 1'b0;
                DATA: txd <= shift_reg[0];
                STOP: txd <= 1'b1;
                default: txd <= 1'b1;
            endcase
        end
    end

    // Control signals
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_ready <= 1'b1;
            shift_empty <= 1'b1;
            overrun <= 1'b0;
        end else begin
            tx_ready <= (state == IDLE);
            shift_empty <= (state == IDLE);
            overrun <= (state != IDLE && data_valid);
        end
    end

endmodule