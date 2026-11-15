module origen_043175 #(
    parameter CLK_FREQ = 100_000_000
) (
    input wire i_Clock,
    input wire i_Reset,
    input wire i_Start,
    input wire [7:0] i_LED1_R, i_LED1_G, i_LED1_B,
    input wire [7:0] i_LED2_R, i_LED2_G, i_LED2_B,
    input wire [7:0] i_LED3_R, i_LED3_G, i_LED3_B,
    output reg o_Led,
    output wire o_Ready
);

    localparam LED_CLK_FREQ = 2_380_000;
    localparam CLK_DIV = CLK_FREQ / LED_CLK_FREQ;

    reg [71:0] output_rgb;
    reg [31:0] clk_counter;
    reg [7:0] led_counter;
    reg led_clock;

    reg [2:0] SM;
    localparam sm_waiting = 3'd0,
               sm_phase1  = 3'd1,
               sm_phase2  = 3'd2,
               sm_phase3  = 3'd3,
               sm_reset   = 3'd4;

    assign o_Ready = (SM == sm_waiting);

    always @(posedge i_Clock or posedge i_Reset) begin
        if (i_Reset) begin
            clk_counter <= 0;
            led_clock <= 0;
        end else begin
            if (clk_counter == CLK_DIV - 1) begin
                clk_counter <= 0;
                led_clock <= ~led_clock;
            end else begin
                clk_counter <= clk_counter + 1;
            end
        end
    end

    always @(posedge led_clock or posedge i_Reset) begin
        if (i_Reset) begin
            SM <= sm_waiting;
            led_counter <= 0;
            o_Led <= 0;
            output_rgb <= 0;
        end else begin
            case (SM)
                sm_waiting: begin
                    o_Led <= 0;
                    if (i_Start) begin
                        output_rgb <= {i_LED3_G, i_LED3_R, i_LED3_B,
                                       i_LED2_G, i_LED2_R, i_LED2_B,
                                       i_LED1_G, i_LED1_R, i_LED1_B};
                        SM <= sm_phase2;
                        led_counter <= 71;
                    end
                end

                sm_phase1: begin
                    o_Led <= 0;
                    SM <= sm_phase2;
                end

                sm_phase2: begin
                    o_Led <= 1;
                    SM <= sm_phase3;
                end

                sm_phase3: begin
                    o_Led <= output_rgb[led_counter];
                    if (led_counter == 0) begin
                        SM <= sm_reset;
                        led_counter <= 250;
                    end else begin
                        SM <= sm_phase1;
                        led_counter <= led_counter - 1;
                    end
                end

                sm_reset: begin
                    o_Led <= 0;
                    if (led_counter == 0) begin
                        SM <= sm_waiting;
                    end else begin
                        led_counter <= led_counter - 1;
                    end
                end

                default: SM <= sm_waiting;
            endcase
        end
    end

endmodule