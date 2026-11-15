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

    always @(posedge CLOCK_50 or posedge reset) begin
        if (reset) begin
            state_sortFSM <= initial_sortFSM;
            compareGeneCounter <= 8'b0;
            sortGeneCount <= 8'b0;
            sortBitCount <= 8'b0;
            sortedCounter <= 8'b0;
        end
        else begin
            case (state_sortFSM)
                initial_sortFSM: begin
                    if (state_controller == 3'b000) begin
                        state_sortFSM <= zeros_sortFSM;
                    end
                    else if (state_controller == 3'b001) begin
                        state_sortFSM <= ones_sortFSM;
                    end
                    else begin
                        state_sortFSM <= initial_sortFSM;
                    end
                end

                // Rest of the case statement remains the same
            endcase
        end
    end
endmodule