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

    [MASKED]

endmodule