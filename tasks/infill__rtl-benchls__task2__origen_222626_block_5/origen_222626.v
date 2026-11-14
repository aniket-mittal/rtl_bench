module origen_222626(
    input clkin,
    input PSCLK,
    input PSEN,
    input PSINCDEC,
    input RST,
    output clk0,
    output CLKFB,
    output CLK2X
);

reg [2:0] phase_shift = 0;
reg [1:0] phase_inc_dec = 0;
reg clk_div2 = 0;
reg clk_div4 = 0;
reg clk_feedback = 0;

[MASKED]

assign clk0 = clk_div2;
assign CLKFB = clk_feedback;
assign CLK2X = clk_div2;

endmodule