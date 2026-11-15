module origen_189435(
    input clk,
    input rst,
    input RX,
    input BTU,
    input DONE,
    output reg START,
    output reg DOIT
);

reg [1:0] state;
localparam INIT = 2'b00, RECV = 2'b01, LAST = 2'b10;

[MASKED]

endmodule