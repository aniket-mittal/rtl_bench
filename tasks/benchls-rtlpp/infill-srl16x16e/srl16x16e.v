module srl16x16e (
    input [15:0] d,
    input [3:0] a,
    output [15:0] y,
    input clk,
    input ce
);
    reg [15:0] srl [0:15];

    [MASKED]

    assign y = srl[a];

endmodule