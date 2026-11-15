module rtlpp_09724 (
    output [4:0] clk,
    input  [1:0] inclk
);
    // Internal signals
    wire [4:0]   wire_pll1_clk;
    wire         wire_pll1_fbout;

    // PLL Implementation directly
    // Parameters
    parameter bandwidth_type = "auto";
    parameter clk0_divide_by = 1;
    parameter clk0_duty_cycle = 50;
    parameter clk0_multiply_by = 2;
    parameter clk0_phase_shift = "0";
    parameter compensate_clock = "clk0";
    parameter inclk0_input_frequency = 20000;
    parameter operation_mode = "normal";
    parameter pll_type = "auto";

    // Internal registers
    reg [4:0] clk_reg;
    reg fbout_reg;

    [MASKED]

    // Assignments
    assign wire_pll1_clk = clk_reg;
    assign wire_pll1_fbout = fbout_reg;
    assign clk = wire_pll1_clk;

endmodule