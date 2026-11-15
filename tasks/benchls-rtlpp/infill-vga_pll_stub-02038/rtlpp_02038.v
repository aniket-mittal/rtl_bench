module rtlpp_02038 (
    output locked,
    output outclk_0,
    output outclk_1,
    input refclk,
    input rst
);

    wire wire_vga_pll_altera_pll_altera_pll_i_1098_locked;
    wire [1:0] wire_vga_pll_altera_pll_altera_pll_i_1098_outclk;

    // Altera PLL internal logic
    reg locked_reg;
    reg [1:0] outclk_reg;
    
    [MASKED]

    assign wire_vga_pll_altera_pll_altera_pll_i_1098_locked = locked_reg;
    assign wire_vga_pll_altera_pll_altera_pll_i_1098_outclk = outclk_reg;

    assign locked = wire_vga_pll_altera_pll_altera_pll_i_1098_locked;
    assign outclk_0 = wire_vga_pll_altera_pll_altera_pll_i_1098_outclk[0];
    assign outclk_1 = wire_vga_pll_altera_pll_altera_pll_i_1098_outclk[1];

endmodule