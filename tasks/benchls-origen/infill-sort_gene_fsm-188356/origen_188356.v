module origen_188356
(
    input CLOCK_50,
    input reset,
    input [7:0] gene,
    input [2:0] state_controller,
    input [63:0] compareGeneCounterFitness,
    output reg [7:0] compareGeneCounter,
    output reg [7:0] sortGeneCount,
    output reg [7:0] sortBitCount,
    output reg [7:0] sortedCounter,
    output reg [3:0] state_sortFSM,
    output reg andAll,
    output reg orAll
);

    localparam initial_sortFSM = 4'b0000;
    localparam zeros_sortFSM = 4'b0001;
    localparam zeroCounter_sortFSM = 4'b0010;
    localparam ones_sortFSM = 4'b0011;
    localparam oneCounter_sortFSM = 4'b0100;
    localparam baseBitCounter_sortFSM = 4'b0101;
    localparam sortedCounterZeros_sortFSM = 4'b0110;
    localparam sortedCounterOnes_sortFSM = 4'b0111;
    localparam finished_sortFSM = 4'b1000;

    [MASKED]
endmodule