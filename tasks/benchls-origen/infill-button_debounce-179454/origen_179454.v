module origen_179454(
    input clk,
    input rst,
    input btn_in,
    output reg btn_press
);

localparam INIT = 2'b00;
localparam BTN_PRESSED = 2'b01;
localparam LOCKOUT = 2'b10;

reg [1:0] state;
reg [15:0] lockout_timer;

[MASKED]

endmodule