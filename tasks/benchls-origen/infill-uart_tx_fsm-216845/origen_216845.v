module origen_216845 (
    input clk,
    input rst,
    input send,
    input [7:0] data,
    output reg txd
);

reg [1:0] state;
reg [2:0] cnt;
reg prev_send;

parameter STATE1 = 2'b00;
parameter STATE2 = 2'b01;
parameter STATE3 = 2'b10;
parameter STATE4 = 2'b11;

[MASKED]

endmodule