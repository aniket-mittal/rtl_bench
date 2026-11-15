module origen_039569 (
    input wire reset,
    input wire enable,
    input wire clock,
    input wire [7:0] in_numberIn,
    output reg switchSample,
    output reg pwmWave
);

    parameter COUNTER_DELAY = 8'd221;

    reg [7:0] accumulator;
    reg [7:0] lastAudioSample;
    reg [7:0] slowerCounter;

    always @(posedge clock) begin
        if (reset) begin
            accumulator <= 8'd0;
            lastAudioSample <= 8'd0;
            slowerCounter <= 8'd0;
            switchSample <= 1'b0;
            pwmWave <= 1'b0;
        end
        else if (enable) begin
            if (slowerCounter == COUNTER_DELAY) begin
                if (accumulator == 8'd0) begin
                    lastAudioSample <= in_numberIn;
                    pwmWave <= (in_numberIn != 8'd0);
                    accumulator <= accumulator + 8'd1;
                    switchSample <= 1'b0;
                end
                else begin
                    accumulator <= accumulator + 8'd1;
                    pwmWave <= (accumulator < lastAudioSample);
                    switchSample <= (accumulator < 8'd128);
                end
                slowerCounter <= 8'd0;
            end
            else begin
                slowerCounter <= slowerCounter + 8'd1;
            end
        end
        else begin
            accumulator <= 8'd0;
            lastAudioSample <= 8'd0;
            slowerCounter <= 8'd0;
            switchSample <= 1'b0;
            pwmWave <= 1'b0;
        end
    end

endmodule