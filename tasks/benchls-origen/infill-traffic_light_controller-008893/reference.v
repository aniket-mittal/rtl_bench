module origen_008893 (
    input wire i_clk,
    input wire i_nreset,
    input wire i_countEnable,
    output reg o_newState,
    output reg o_nextLight
);

    parameter GOYELLOW = 4'd10;
    parameter GORED = 4'd12;

    reg [3:0] lightCounter;
    reg downSampler;
    integer downSamplercounter;

    // Clock Divider (Downsampler)
    always @(posedge i_clk or negedge i_nreset) begin
        if (!i_nreset) begin
            downSamplercounter <= 0;
            downSampler <= 0;
        end else begin
            if (downSamplercounter == 49999999) begin
                downSamplercounter <= 0;
                downSampler <= 1;
            end else begin
                downSamplercounter <= downSamplercounter + 1;
                downSampler <= 0;
            end
        end
    end

    // Counter Logic
    always @(posedge i_clk or negedge i_nreset) begin
        if (!i_nreset) begin
            lightCounter <= 4'd0;
            o_newState <= 1'b0;
            o_nextLight <= 1'b0;
        end else if (i_countEnable && downSampler) begin
            lightCounter <= lightCounter + 1'b1;
            
            if (lightCounter == GOYELLOW) begin
                o_nextLight <= 1'b1;
            end
            
            if (lightCounter == GORED) begin
                o_nextLight <= 1'b0;
                o_newState <= 1'b1;
                lightCounter <= 4'd0;
            end else begin
                o_newState <= 1'b0;
            end
        end
    end

endmodule