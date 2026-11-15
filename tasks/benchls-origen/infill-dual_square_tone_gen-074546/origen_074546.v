module origen_074546 (
    input wire clk,
    input wire rst_n,
    input wire [19:0] note_div_left,
    input wire [19:0] note_div_right,
    output reg [15:0] audio_left,
    output reg [15:0] audio_right
);

reg [19:0] clk_cnt_left, clk_cnt_right;
reg [19:0] next_clk_cnt_left, next_clk_cnt_right;
reg b_clk_left, b_clk_right;
reg next_b_clk_left, next_b_clk_right;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        clk_cnt_left <= 20'd0;
        clk_cnt_right <= 20'd0;
        b_clk_left <= 1'b0;
        b_clk_right <= 1'b0;
    end else begin
        clk_cnt_left <= next_clk_cnt_left;
        clk_cnt_right <= next_clk_cnt_right;
        b_clk_left <= next_b_clk_left;
        b_clk_right <= next_b_clk_right;
    end
end

[MASKED]

always @(*) begin
    audio_left = b_clk_left ? 16'h3FFF : 16'hC000;
    audio_right = b_clk_right ? 16'h3FFF : 16'hC000;
end

endmodule