module origen_028427 (
    input wire clk48,
    input wire manchester_data_in,
    output reg new_byte_available,
    output reg end_of_frame,
    output reg rx_led,
    output reg [31:0] data_out
);

    // State definitions
    localparam IDLE = 3'd0;
    localparam SYNC = 3'd1;
    localparam START_FRAME = 3'd2;
    localparam RECEIVE_DATA = 3'd3;
    localparam END_FRAME = 3'd4;

    reg [2:0] state;
    reg [7:0] shift_reg;
    reg [2:0] bit_counter;
    reg [1:0] byte_counter;
    reg [7:0] led_timer;
    reg [23:0] frame_data;

    always @(posedge clk48) begin
        new_byte_available <= 0;
        end_of_frame <= 0;

        case (state)
            IDLE: begin
                if (manchester_data_in == 1'b1) begin
                    state <= SYNC;
                    shift_reg <= {shift_reg[6:0], manchester_data_in};
                    bit_counter <= 3'd0;
                end
            end

            SYNC: begin
                shift_reg <= {shift_reg[6:0], manchester_data_in};
                bit_counter <= bit_counter + 1;
                if (bit_counter == 3'd7) begin
                    if (shift_reg == 8'h55 || shift_reg == 8'hAA || shift_reg == 8'hD5) begin
                        state <= START_FRAME;
                        bit_counter <= 3'd0;
                    end else begin
                        state <= IDLE;
                    end
                end
            end

            START_FRAME: begin
                shift_reg <= {shift_reg[6:0], manchester_data_in};
                bit_counter <= bit_counter + 1;
                if (bit_counter == 3'd7) begin
                    if (shift_reg == 8'h13) begin
                        state <= RECEIVE_DATA;
                        bit_counter <= 3'd0;
                        byte_counter <= 2'd0;
                    end else begin
                        state <= IDLE;
                    end
                end
            end

            RECEIVE_DATA: begin
                shift_reg <= {shift_reg[6:0], manchester_data_in};
                bit_counter <= bit_counter + 1;
                if (bit_counter == 3'd7) begin
                    new_byte_available <= 1;
                    frame_data <= {frame_data[15:0], shift_reg};
                    byte_counter <= byte_counter + 1;
                    if (byte_counter == 2'd2) begin
                        state <= END_FRAME;
                    end
                end
            end

            END_FRAME: begin
                shift_reg <= {shift_reg[6:0], manchester_data_in};
                bit_counter <= bit_counter + 1;
                if (bit_counter == 3'd7) begin
                    if (shift_reg == 8'hAA) begin
                        data_out <= {frame_data, shift_reg};
                        end_of_frame <= 1;
                        rx_led <= 1;
                        led_timer <= 8'd255;
                    end
                    state <= IDLE;
                end
            end
        endcase

        // LED timer
        if (led_timer > 0) begin
            led_timer <= led_timer - 1;
        end else begin
            rx_led <= 0;
        end
    end

endmodule