module autovcoder_144225 (
    input wire clk,
    input wire rst,
    input wire [31:0] key0,
    input wire [31:0] key1,
    input wire [31:0] key2,
    input wire [31:0] key3,
    input wire [31:0] nonce0,
    input wire [31:0] nonce1,
    output reg [31:0] out0,
    output reg [31:0] out1,
    output reg [31:0] out2,
    output reg [31:0] out3
);
    reg [31:0] state [0:3];

    integer i;
    
    [MASKED]
endmodule