module origen_083028 (
    input wire clk,
    input wire reset,
    input wire Multu,
    input wire [31:0] dataA,
    input wire [31:0] dataB,
    output reg [63:0] dataOut
);

    reg state;
    reg [7:0] counter;
    reg [63:0] temp;
    reg [63:0] mcnd;
    reg [31:0] mpy;

    [MASKED]

endmodule