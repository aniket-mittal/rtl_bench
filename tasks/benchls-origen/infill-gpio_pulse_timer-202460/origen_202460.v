module origen_202460 (
    input clk,
    input rst_n,
    input [31:0] pulse1start,
    input [31:0] pulse1end,
    input startclock,
    output [5:0] gpio
);

reg [26:0] counter1;
reg [31:0] counter;
reg startflag;
reg startflag1;
reg startflag2;
reg [5:0] gpio_reg;

[MASKED]

assign gpio = gpio_reg;

endmodule