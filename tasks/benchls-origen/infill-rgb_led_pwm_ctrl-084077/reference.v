module origen_084077 (
    input wire pclk,
    input wire nreset,
    input wire bus_write_en,
    input wire bus_read_en,
    input wire [7:0] bus_addr,
    input wire [31:0] bus_write_data,
    output reg [31:0] bus_read_data,
    output reg pwm_r,
    output reg pwm_g,
    output reg pwm_b
);

    // Parameters
    parameter PWM_PERIOD = 1000000;

    // Internal registers
    reg [31:0] led_control;
    reg [31:0] pending_led_state_1;
    reg [31:0] pending_led_state_2;
    reg [31:0] led_state_1;
    reg [31:0] led_state_2;
    reg [31:0] current_state;
    reg [31:0] brightness;
    reg [31:0] brightness_factor;
    reg [19:0] duty_cycle_counter;

    // Bus interface
    always @(posedge pclk or negedge nreset) begin
        if (!nreset) begin
            led_control <= 32'h0;
            pending_led_state_1 <= 32'h0;
            pending_led_state_2 <= 32'h0;
        end else if (bus_write_en) begin
            case (bus_addr)
                8'h00: led_control <= bus_write_data;
                8'h04: pending_led_state_1 <= bus_write_data;
                8'h08: pending_led_state_2 <= bus_write_data;
            endcase
        end
    end

    always @(posedge pclk) begin
        if (bus_read_en) begin
            case (bus_addr)
                8'h00: bus_read_data <= led_control;
                8'h04: bus_read_data <= led_state_1;
                8'h08: bus_read_data <= led_state_2;
                default: bus_read_data <= 32'h0;
            endcase
        end
    end

    // State management
    always @(posedge pclk or negedge nreset) begin
        if (!nreset) begin
            led_state_1 <= 32'h0;
            led_state_2 <= 32'h0;
            current_state <= 32'h0;
        end else if (duty_cycle_counter == 0) begin
            led_state_1 <= pending_led_state_1;
            led_state_2 <= pending_led_state_2;
            current_state <= (current_state == led_state_1) ? led_state_2 : led_state_1;
        end
    end

    // Brightness control
    always @(posedge pclk or negedge nreset) begin
        if (!nreset) begin
            brightness <= 32'd0;
            brightness_factor <= 32'd0;
        end else begin
            brightness <= (brightness + 32'd1) % 32'd100000000;
            brightness_factor <= (brightness * 32'd255) / 32'd100000000;
        end
    end

    // PWM generation
    always @(posedge pclk or negedge nreset) begin
        if (!nreset) begin
            duty_cycle_counter <= 20'd0;
            pwm_r <= 1'b0;
            pwm_g <= 1'b0;
            pwm_b <= 1'b0;
        end else begin
            duty_cycle_counter <= (duty_cycle_counter + 20'd1) % PWM_PERIOD;

            if (duty_cycle_counter == 0) begin
                pwm_r <= current_state[31];
                pwm_g <= current_state[31];
                pwm_b <= current_state[31];
            end else begin
                pwm_r <= (duty_cycle_counter < ((current_state[7:0] * brightness_factor) >> 8));
                pwm_g <= (duty_cycle_counter < ((current_state[15:8] * brightness_factor) >> 8));
                pwm_b <= (duty_cycle_counter < ((current_state[23:16] * brightness_factor) >> 8));
            end
        end
    end

endmodule