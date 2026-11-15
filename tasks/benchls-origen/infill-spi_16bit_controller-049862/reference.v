module origen_049862 (
    input wire clk,
    input wire reset_n,
    input wire [15:0] data_in_16bit,
    input wire start,
    input wire spi_busy,
    input wire [7:0] spi_data_out,
    output reg busy,
    output reg [15:0] data_out_16bit,
    output reg CS,
    output reg [7:0] spi_data_in,
    output reg spi_start
);

    // State definition
    localparam IDLE = 3'd0,
               SET_UP = 3'd1,
               SEND_BYTE_1 = 3'd2,
               SEND_BYTE_0 = 3'd3,
               FINISH = 3'd4;

    reg [2:0] state, next_state;
    reg [3:0] spi_start_cnt;
    reg spi_busy_prev;
    reg [7:0] data_in_upper, data_in_lower;

    // State transition logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        busy = 1'b1;
        CS = 1'b1;
        spi_start = 1'b0;
        spi_data_in = 8'h00;

        case (state)
            IDLE: begin
                busy = 1'b0;
                CS = 1'b1;
                if (start)
                    next_state = SET_UP;
            end

            SET_UP: begin
                CS = 1'b0;
                next_state = SEND_BYTE_1;
            end

            SEND_BYTE_1: begin
                spi_data_in = data_in_upper;
                spi_start = (spi_start_cnt > 0);
                if (!spi_busy && spi_busy_prev)
                    next_state = SEND_BYTE_0;
            end

            SEND_BYTE_0: begin
                spi_data_in = data_in_lower;
                spi_start = (spi_start_cnt > 0);
                if (!spi_busy && spi_busy_prev)
                    next_state = FINISH;
            end

            FINISH: begin
                CS = 1'b1;
                next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    // SPI start counter
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            spi_start_cnt <= 4'd0;
        else if (state == SEND_BYTE_1 || state == SEND_BYTE_0)
            spi_start_cnt <= (spi_start_cnt > 0) ? spi_start_cnt - 1 : 4'd10;
        else
            spi_start_cnt <= 4'd0;
    end

    // Data handling
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data_in_upper <= 8'h00;
            data_in_lower <= 8'h00;
            data_out_16bit <= 16'h0000;
        end else begin
            if (state == SET_UP) begin
                data_in_upper <= data_in_16bit[15:8];
                data_in_lower <= data_in_16bit[7:0];
            end
            if (state == SEND_BYTE_1 && !spi_busy && spi_busy_prev)
                data_out_16bit[15:8] <= spi_data_out;
            if (state == SEND_BYTE_0 && !spi_busy && spi_busy_prev)
                data_out_16bit[7:0] <= spi_data_out;
        end
    end

    // SPI busy edge detection
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            spi_busy_prev <= 1'b0;
        else
            spi_busy_prev <= spi_busy;
    end

endmodule