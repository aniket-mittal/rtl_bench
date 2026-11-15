module origen_209089(
    input clk,
    input rst,
    input initializeFinished,
    input sortFinished,
    input crossFinished,
    input networkFinished,
    output reg [1:0] networkState,
    output reg [31:0] generationCounter
);

parameter INITIALIZE = 2'b00;
parameter RUN = 2'b01;
parameter SORT = 2'b10;
parameter CROSS = 2'b11;

[MASKED]

endmodule