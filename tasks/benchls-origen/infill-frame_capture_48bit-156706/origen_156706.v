module origen_156706(
    input pclk,
    input vsync,
    input hsync,
    input [7:0] din_8bit,
    output reg [18:0] address,
    output reg [47:0] dout_48bit,
    output reg we
);

    reg [15:0] din_latch_reg;
    reg [5:0] count;
    reg [18:0] addr_next;
    reg wr_hold;
    reg [47:0] dout_48bit_reg;

    [MASKED]

endmodule