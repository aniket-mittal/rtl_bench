module autovcoder_129212 (
    input wire clk,
    input wire reset,
    input wire SCK_EN,
    input wire [7:0] data_in,
    output reg SCK,
    output reg CS,
    output reg MOSI
);
    reg [2:0] bit_count;
    reg [7:0] shift_reg;
    reg sending;

    [MASKED]
endmodule