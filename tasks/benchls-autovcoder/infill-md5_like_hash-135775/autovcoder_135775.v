module autovcoder_135775(
    input clk,
    input rst,
    input [511:0] data_in,
    input start,
    output reg [127:0] hash_out,
    output reg done
);
    
    reg [127:0] a, b, c, d;
    reg [3:0] state; // state machine for processing
    reg [4:0] round;

    [MASKED]
endmodule