module origen_040698(
    input CLK_50M,
    input RS232_DCE_RXD,
    input BTN_SOUTH,
    output reg [7:0] LED
);

wire reset = BTN_SOUTH;
wire rxd = RS232_DCE_RXD;

reg [15:0] clock_count;
reg serclk;
reg receiving;
reg parity;
reg [15:0] buffer;

[MASKED]

endmodule