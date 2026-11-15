module origen_190073 #(
    parameter COUNT = 8,
    parameter INVERT = 0,
    parameter PRESCALE = 10
) (
    input clk,
    input rst,
    input [COUNT-1:0] led,
    output sreg_d,
    output sreg_ld,
    output sreg_clk
);

    reg [COUNT-1:0] led_reg;
    reg [COUNT-1:0] led_sync1;
    reg [COUNT-1:0] led_sync2;
    reg [PRESCALE-1:0] prescaler;
    reg sreg_ld_reg;
    reg sreg_clk_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led_sync1 <= 0;
            led_sync2 <= 0;
            led_reg <= 0;
            prescaler <= 0;
            sreg_ld_reg <= 0;
            sreg_clk_reg <= 0;
        end else begin
            led_sync1 <= led;
            led_sync2 <= led_sync1;
            if (prescaler == PRESCALE - 1) begin
                prescaler <= 0;
                if (led_sync2 != led_reg) begin
                    led_reg <= led_sync2;
                    sreg_ld_reg <= 1;
                end else begin
                    sreg_ld_reg <= 0;
                end
                sreg_clk_reg <= ~sreg_clk_reg;
            end else begin
                prescaler <= prescaler + 1;
                sreg_ld_reg <= 0;
                sreg_clk_reg <= sreg_clk_reg;
            end
        end
    end

    assign sreg_d = INVERT ? ~led_reg[COUNT-1] : led_reg[COUNT-1];
    assign sreg_ld = sreg_ld_reg;
    assign sreg_clk = sreg_clk_reg;

endmodule