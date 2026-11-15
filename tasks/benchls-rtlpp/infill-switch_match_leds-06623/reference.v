module rtlpp_06623(
    input clk,
    input reset,
    input [15:0] switches,
    output reg [15:0] leds,
    output reg [47:0] tiles
);

    reg [3:0] first;
    reg [3:0] second;
    reg [15:0] match;
    reg [15:0] mismatch;
    reg select2;
    reg [1:0] state [15:0];
    integer i;

    initial begin
        first = 4'b1111;
        second = 4'b1111;
        select2 = 0;
        for (i = 0; i < 16; i = i + 1) begin
            state[i] = 2'b00;
            leds[i] = 1'b0;
            match[i] = 1'b0;
            mismatch[i] = 1'b0;
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 16; i = i + 1) begin
                state[i] <= 2'b00;
                leds[i] <= 1'b0;
                match[i] <= 1'b0;
                mismatch[i] <= 1'b0;
            end
            first <= 4'b1111;
            second <= 4'b1111;
            select2 <= 1'b0;
        end else begin
            for (i = 0; i < 16; i = i + 1) begin
                if (switches[i]) begin
                    if (!select2 && state[i] == 2'b00) begin
                        first <= i;
                        select2 <= 1'b1;
                        state[i] <= 2'b01;
                    end else if (select2 && state[i] == 2'b00) begin
                        second <= i;
                        select2 <= 1'b0;
                        state[i] <= 2'b01;
                        if (tiles[first * 3 +: 3] == tiles[second * 3 +: 3]) begin
                            match[first] <= 1'b1;
                            match[second] <= 1'b1;
                            leds[first] <= 1'b1;
                            leds[second] <= 1'b1;
                        end else begin
                            mismatch[first] <= 1'b1;
                            mismatch[second] <= 1'b1;
                        end
                        first <= 4'b1111;
                        second <= 4'b1111;
                    end
                end else if (!switches[i] && state[i] == 2'b01) begin
                    state[i] <= 2'b00;
                    if (i == first) first <= 4'b1111;
                    if (i == second) second <= 4'b1111;
                end
            end
        end
    end
endmodule