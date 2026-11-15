module autovcoder_140467(
    input clk,
    input rst,
    input tx_en,
    input [7:0] data_in,
    output reg tx
);
    reg [3:0] state;
    reg [3:0] count;
    reg [7:0] data;
    
    parameter IDLE = 0, START = 1, DATA = 2, STOP = 3;
    
    [MASKED]
endmodule