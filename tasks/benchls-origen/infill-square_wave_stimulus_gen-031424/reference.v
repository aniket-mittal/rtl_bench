module origen_031424 (
    input wire system_clk,
    input wire reset,
    input wire clk_17k,
    output reg stimulus,
    output reg clk_34
);

    reg clk_40k;
    reg [10:0] cnt_40k;
    reg [8:0] cnt_34;
    reg [4:0] cnt_17k;

    // 40 kHz clock generation
    always @(posedge system_clk or posedge reset) begin
        if (reset) begin
            cnt_40k <= 11'd0;
            clk_40k <= 1'b0;
        end else begin
            if (cnt_40k == 11'd1249) begin
                cnt_40k <= 11'd0;
                clk_40k <= ~clk_40k;
            end else begin
                cnt_40k <= cnt_40k + 1'b1;
            end
        end
    end

    // 34 Hz clock generation
    always @(posedge clk_17k or posedge reset) begin
        if (reset) begin
            cnt_34 <= 9'd0;
            clk_34 <= 1'b0;
        end else begin
            if (cnt_34 == 9'd499) begin
                cnt_34 <= 9'd0;
            end else begin
                cnt_34 <= cnt_34 + 1'b1;
            end
            clk_34 <= (cnt_34 == 9'd0);
        end
    end

    // Stimulus generation
    always @(posedge system_clk or posedge reset) begin
        if (reset) begin
            stimulus <= 1'b0;
        end else begin
            stimulus <= clk_34 & clk_40k;
        end
    end

endmodule