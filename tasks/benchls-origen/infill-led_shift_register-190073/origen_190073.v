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

    [MASKED]

    assign sreg_d = INVERT ? ~led_reg[COUNT-1] : led_reg[COUNT-1];
    assign sreg_ld = sreg_ld_reg;
    assign sreg_clk = sreg_clk_reg;

endmodule