module origen_106492 (
    input wire clk,
    input wire rst,
    input wire we,
    input wire re,
    input wire [15:0] din,
    output reg [15:0] dout,
    output reg flagf,
    output reg flage
);

    reg [15:0] ram [0:15];
    reg [3:0] wp, rp;
    reg [4:0] count;

    [MASKED]

endmodule