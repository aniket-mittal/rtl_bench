module origen_091304 (
    input wire clk,
    input wire rst,
    input wire [7:0] din0, din1, din2, din3,
    input wire inv0, inv1, inv2, inv3,
    output reg [7:0] dout0, dout1, dout2, dout3,
    output reg outv0, outv1, outv2, outv3
);

    reg [7:0] mem [0:3];
    reg [3:0] mem_valid;
    reg [1:0] state;

    [MASKED]

endmodule