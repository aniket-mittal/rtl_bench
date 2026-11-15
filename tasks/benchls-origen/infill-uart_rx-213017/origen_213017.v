module origen_213017(
    input UART_RX,
    input reset,
    input baud_clk,
    output reg RX_STATUS,
    output reg [7:0] RX_DATA
);

reg RX_EN;
reg sample;
reg [2:0] state;
reg [2:0] state1;

[MASKED]

endmodule