module autovcoder_136258(
    input clk,
    input rst,
    input [255:0] key,
    input [255:0] message,
    input start,
    output reg [255:0] hmac_output,
    output reg done
);
    reg [2:0] state;
    localparam IDLE = 3'b000,
               HASH1 = 3'b001,
               HASH2 = 3'b010,
               DONE = 3'b011;

    [MASKED]
endmodule