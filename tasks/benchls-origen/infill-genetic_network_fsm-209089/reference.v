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

always @(posedge clk or posedge rst) begin
    if (rst) begin
        networkState <= INITIALIZE;
        generationCounter <= 32'b0;
    end
    else begin
        case (networkState)
            INITIALIZE: begin
                if (initializeFinished) begin
                    networkState <= RUN;
                end
            end
            RUN: begin
                if (networkFinished) begin
                    networkState <= SORT;
                end
            end
            SORT: begin
                if (sortFinished) begin
                    networkState <= CROSS;
                end
            end
            CROSS: begin
                if (crossFinished) begin
                    networkState <= RUN;
                    generationCounter <= generationCounter + 1;
                end
            end
            default: begin
                networkState <= INITIALIZE;
            end
        endcase
    end
end

endmodule