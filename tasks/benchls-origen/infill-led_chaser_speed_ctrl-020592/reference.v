module origen_020592 #(
    parameter N_LEDS = 4,
    parameter NB_SEL = 2,
    parameter NB_COUNT = 32,
    parameter NB_SW = 4
) (
    input [NB_SW-1:0] i_sw,
    input i_reset,
    input clk,
    output reg [N_LEDS-1:0] o_led,
    output reg [N_LEDS-1:0] o_led_b,
    output reg [N_LEDS-1:0] o_led_g
);

    reg [NB_COUNT-1:0] counter;
    reg [NB_COUNT-1:0] ref_limit;

    always @(posedge clk or negedge i_reset) begin
        if (!i_reset) begin
            counter <= 0;
            o_led <= 1;
            o_led_b <= 1;
            o_led_g <= 1;
        end else if (i_sw[0]) begin
            if (counter >= ref_limit) begin
                counter <= 0;
                o_led <= {o_led[N_LEDS-2:0], o_led[N_LEDS-1]};
                o_led_b <= {o_led_b[N_LEDS-2:0], o_led_b[N_LEDS-1]};
                o_led_g <= {o_led_g[N_LEDS-2:0], o_led_g[N_LEDS-1]};
            end else begin
                counter <= counter + 1;
            end
        end
    end

    always @(*) begin
        case (i_sw[2:1])
            2'b00: ref_limit = 32'd100000000; // R0 (slowest)
            2'b01: ref_limit = 32'd50000000;  // R1
            2'b10: ref_limit = 32'd25000000;  // R2
            2'b11: ref_limit = 32'd12500000;  // R3 (fastest)
        endcase
    end

    always @(*) begin
        if (i_sw[3]) begin
            o_led_g = o_led;
            o_led_b = 0;
        end else begin
            o_led_b = o_led;
            o_led_g = 0;
        end
    end

endmodule