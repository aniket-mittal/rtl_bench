module origen_207352(
    input rst,
    input clk,
    input enable,
    output reg piezo
);

    reg [15:0] buff;
    reg [31:0] cnt_sound;
    reg [15:0] tone;
    reg [31:0] tone_cnt;
    reg [31:0] clk_cnt;

    [MASKED]

    always @(*) begin
        piezo = buff;
    end

endmodule